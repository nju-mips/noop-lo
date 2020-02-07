package NPC
import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.CP0Regs._
import Common.Constants._
import Common.Instructions._
import scala.collection.mutable.LinkedHashMap

class ILARegWrite(param: CoreParams) extends Bundle {
  val reg_write = Output(Bool())
  val wb_rd = Output(UInt(5.W))
  val wb_write_val = Output(UInt(param.xprlen.W))
  val wb_rd_history_hash = Output(UInt(5.W))
  val wb_rd_value_history_hash = Output(UInt(param.xprlen.W))
  val gprs = Vec(32, UInt(param.xprlen.W)).asOutput
  val hi = Output(UInt(param.xprlen.W))
  val lo = Output(UInt(param.xprlen.W))
  // hash of the current content of gprs
  val gpr_current_hash = Output(UInt(param.xprlen.W))
  // hash of gpr_current_hash, it reflects the history of gpr contents
  val gpr_history_hash = Output(UInt(param.xprlen.W))
  override def cloneType = { new ILARegWrite(param).asInstanceOf[this.type] }
}

class ISUPerfIO extends Bundle
{
  val operand_not_ready = Output(Bool())
  val rd_busy = Output(Bool())
  val backend_starving = Output(Bool())
  val backend_mdu_busy = Output(Bool())
  val backend_lsu_busy = Output(Bool())
}

class ISU_IO(param: CoreParams) extends Bundle
{
  val decode = Flipped(DecoupledIO(new IDU_ISU_DECODE(param)))

  val alu_datain = ValidIO(new ISU_ALU_DATAIN(param))
  val bru_datain = ValidIO(new ISU_BRU_DATAIN(param))
  val lsu_datain = DecoupledIO(new ISU_LSU_DATAIN(param))
  val mdu_datain = DecoupledIO(new ISU_MDU_DATAIN(param))
  val pru_datain = DecoupledIO(new ISU_PRU_DATAIN(param))

  val alu_bypass = Flipped(ValidIO(new ALU_ISU_BYPASS(param)))
  val bru_bypass = Flipped(ValidIO(new BRU_ISU_BYPASS(param)))
  val mdu_bypass = Flipped(ValidIO(new MDU_ISU_BYPASS(param)))
  val lsu_bypass = Flipped(ValidIO(new LSU_ISU_BYPASS(param)))

  val flush = Flipped(ValidIO(new Flush(param)))
  val wb = Flipped(ValidIO(new WBU_ISU_RES(param)))
  val rports = Vec(2, new ROBRPort(param))
  val perf = new ISUPerfIO

  val nemu = new NEMUCommit(param)

  val ila_debug = new ILARegWrite(param)
}

class ISU(param: CoreParams) extends Module
{
  val io = IO(new ISU_IO(param))

  val nIQEntries = param.nIQEntries
  val iqIdxBits = log2Up(param.nIQEntries)

  val iq_allocated_slot = RegInit(Vec.fill(nIQEntries)(N))
  val iq = Reg(Vec(nIQEntries, new IDU_ISU_DECODE(param)))

  // ******************** iq allocate ********************
  val iq_full = iq_allocated_slot.reduce(_ && _)
  val iq_alloc_slot = PriorityEncoder(~iq_allocated_slot.asUInt)

  val decode = io.decode.bits
  io.decode.ready := !iq_full
  when (io.decode.fire()) {
    iq_allocated_slot(iq_alloc_slot) := Y
    iq(iq_alloc_slot) := decode
  }

  val bp_info = decode.bp_info
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.decode.fire()) {
        printf("time: %d [idu_isu]: iq_alloc_slot: %d pc: %x rob_idx: %x fu_type: %d fu_op: %d etw: %x rs: %d rs_sb_status: %d rs_rob_idx: %d rt: %d rt_sb_status: %d rt_rob_idx: %d rd: %d rd_rob_idx: %d a_src: %d b_src: %d rd_sel: %d predicted_taken: %d predicted_target: %x\n",
          GTimer(), iq_alloc_slot, decode.pc, decode.rob_idx, decode.fu_type, decode.fu_op, decode.etw,
          decode.rs, decode.rs_sb_status, decode.rs_rob_idx,
          decode.rt, decode.rt_sb_status, decode.rt_rob_idx,
          decode.rd, decode.rd_rob_idx,
          decode.a_src, decode.b_src, decode.rd_sel,
          bp_info.predicted_taken, bp_info.predicted_target)
      }
    }
  }

  // for now, branch misprediction flush are triggered when branch delay slot retires
  // so all flush are unconditional flushes
  val flush_valid = io.flush.valid
  val iq_fireable_slot = Wire(Vec(nIQEntries, Bool()))

  // ISU
  val rf = new RegFile(31, param.xprlen)
  val hi = Reg(UInt(param.xprlen.W))
  val lo = Reg(UInt(param.xprlen.W))

  // scoreboard for hi/lo
  val sb_hi = RegInit(N)
  val sb_lo = RegInit(N)

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      printf("time: %d [sboard hi lo] sb_hi: %d sb_lo: %d\n",
        GTimer(), sb_hi, sb_lo)
    }
  }

  // ******************** data forwarding and wb reg write ********************
  // we only deal with bypass on gpr and hi/lo
  // for cp0 regs, we do not do hazard checking
  // given their low usage frequency
  // we recommend pipeline flush when committing cp0 instructions

  val wb = io.wb.bits
  val wb_gpr_do_write = io.wb.valid && wb.rd_should_write && wb.rd_do_write

  val alu_bypass = io.alu_bypass.bits
  val bru_bypass = io.bru_bypass.bits
  val lsu_bypass = io.lsu_bypass.bits
  val mdu_bypass = io.mdu_bypass.bits

  val alu_bypass_valid = io.alu_bypass.valid && alu_bypass.rd_wen
  val bru_bypass_valid = io.bru_bypass.valid && bru_bypass.rd_wen
  val lsu_bypass_valid = io.lsu_bypass.valid && lsu_bypass.rd_wen
  val mdu_bypass_valid = io.mdu_bypass.valid && mdu_bypass.rd_wen

  // when wb.rd_should_write === true and wb.rd_do_write === false
  // it means that we want to nofity scoreboard, value in wb.rd has been computed out
  // and does not need to be changed
  // this works for MOVN and MOVZ
  when (io.wb.valid) {
    when (wb_gpr_do_write) { rf.write(wb.rd, wb.value) }
    when (wb.hi_wen) {
      sb_hi := N
      hi := wb.hi
    }
    when (wb.lo_wen) {
      sb_lo := N
      lo := wb.lo
    }
  }

  // ******************** check which ones are ready to issue ********************
  for (i <- 0 until nIQEntries) {

    val entry = iq(i)
    val entry_valid = iq_allocated_slot(i)

    def check_reg(reg: UInt, sb_status: UInt, rob_idx: UInt) = {
      // $zero should be taken special care of
      // just in case previous instructions try to write $zero
      val is_zero = reg === 0.U
      val sb_ready = sb_status === SB_READY
      val sb_busy = sb_status === SB_BUSY
      val sb_rob_ready = sb_status === SB_ROB_READY

      // if register is marked as ready in sboard
      // we can directly read it fromm regfile
      // if it is not ready
      // we check for bypass
      val alu_bypass_match = alu_bypass_valid && alu_bypass.rd_wen && (reg === alu_bypass.rd) && (rob_idx === alu_bypass.rob_idx)
      val bru_bypass_match = bru_bypass_valid && bru_bypass.rd_wen && (reg === bru_bypass.rd) && (rob_idx === bru_bypass.rob_idx)
      val mdu_bypass_match = mdu_bypass_valid && mdu_bypass.rd_wen && (reg === mdu_bypass.rd) && (rob_idx === mdu_bypass.rob_idx)
      val lsu_bypass_match = lsu_bypass_valid && lsu_bypass.rd_wen && (reg === lsu_bypass.rd) && (rob_idx === lsu_bypass.rob_idx)
      val fu_bypass_match = alu_bypass_match || bru_bypass_match || mdu_bypass_match || lsu_bypass_match
      val wb_bypass_match = io.wb.valid && wb.rd_should_write && (reg === wb.rd) && (wb.rob_idx === rob_idx)

      val ready = is_zero || sb_ready || fu_bypass_match || sb_rob_ready

      val update_sb_status = (sb_busy && fu_bypass_match) || ((sb_rob_ready || sb_busy) && wb_bypass_match)
      val new_sb_status = Mux(wb_bypass_match, SB_READY, SB_ROB_READY)
      if (param.pipelineDebug) {
        when (TraceTrigger()) {
          when (entry_valid) {
            printf("time: %d [issue queue scoreboard] entry: %d pc: %x reg: %d sb_status: %d rob_idx: %d fu_bypass_match: %d wb_bypass_match: %d\n",
              GTimer(), i.U, entry.pc, reg, sb_status, rob_idx, fu_bypass_match, wb_bypass_match)
          }
        }
      }
      (ready, update_sb_status, new_sb_status)
    }

    def check_hi() = {
      val hi_ready = !sb_hi
      val ready = hi_ready
      ready
    }

    def check_lo() = {
      val lo_ready = !sb_lo
      val ready = lo_ready
      ready
    }

    val isu_rs = check_reg(entry.rs, entry.rs_sb_status, entry.rs_rob_idx)
    val isu_rt = check_reg(entry.rt, entry.rt_sb_status, entry.rt_rob_idx)
    val isu_hi = check_hi
    val isu_lo = check_lo
    when (entry_valid && isu_rs._2) {
      entry.rs_sb_status := isu_rs._3
    }
    when (entry_valid && isu_rt._2) {
      entry.rt_sb_status := isu_rt._3
    }

    val op_a_rs_ready = entry.a_src === A_SRC_RS && isu_rs._1
    val op_a_hi_ready = entry.a_src === A_SRC_HI && isu_hi
    val op_a_lo_ready = entry.a_src === A_SRC_LO && isu_lo
    val op_a_always_ready = entry.a_src === A_SRC_X || entry.a_src === A_SRC_SA

    val op_b_reg_ready = entry.b_src === B_SRC_REG && isu_rt._1
    val op_b_always_ready = entry.b_src === B_SRC_X || entry.b_src === B_SRC_IMM

    val op_a_ready = op_a_rs_ready || op_a_hi_ready || op_a_lo_ready || op_a_always_ready
    val op_b_ready = op_b_reg_ready || op_b_always_ready
    val operand_ready = op_a_ready && op_b_ready

    // WAW on gpr already solved!
    val rd_ready = Y
    val hi_lo_ready = (entry.fu_type =/= FU_TYPE_MDU) || (!sb_hi && !sb_lo)
    val dest_ready = rd_ready && hi_lo_ready

    val alu_ready = (entry.fu_type === FU_TYPE_ALU)
    val bru_ready = (entry.fu_type === FU_TYPE_BRU)
    val lsu_ready = (entry.fu_type === FU_TYPE_LSU) && io.lsu_datain.ready
    val mdu_ready = (entry.fu_type === FU_TYPE_MDU) && io.mdu_datain.ready
    val pru_ready = (entry.fu_type === FU_TYPE_PRU) && io.pru_datain.ready
    val fu_ready = alu_ready || bru_ready || lsu_ready || mdu_ready || pru_ready

    // ready to issue
    val isu_valid = entry_valid && operand_ready && dest_ready && fu_ready && !flush_valid
    if (param.pipelineDebug) {
      when (TraceTrigger()) {
        when (entry_valid) {
          printf("time: %d [issue queue] entry: %d pc: %x operand_ready: %d dest_ready: %d fu_ready: %d\n",
            GTimer(), i.U, entry.pc, operand_ready, dest_ready, fu_ready)
        }
      }
    }
    iq_fireable_slot(i) := isu_valid
  }

  // ******************** issue select and prepare operands ********************
  val iq_fire_valid = iq_fireable_slot.asUInt =/= 0.U
  val iq_fire_idx = PriorityEncoder(iq_fireable_slot)
  val entry = iq(iq_fire_idx)

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (iq_fire_valid) {
        printf("time: %d [issue select] idx: %d\n", GTimer(), iq_fire_idx)
      }
    }
  }

  val imm = entry.offset(15, 0)
  val ext_bit = Mux(entry.ext_type === EXT_TYPE_SIGN, entry.offset(15), "b0".U)
  val ext_imm = Cat(Fill(16,ext_bit), imm)

  def read_reg(reg: UInt, sb_status: UInt, rob_idx: UInt, robRport: ROBRPort) = {
    // $zero should be taken special care of
    // just in case previous instructions try to write $zero
    val is_zero = reg === 0.U
    val sb_ready = sb_status === SB_READY
    val sb_busy = sb_status === SB_BUSY
    robRport.idx := rob_idx
    val robEntry = robRport.entry

    val reg_rdata = rf.read(reg)
    // if register is marked as ready in sboard
    // we can directly read it fromm regfile
    // if it is not ready
    // we check for bypass
    val alu_bypass_match = alu_bypass_valid && alu_bypass.rd_wen && (reg === alu_bypass.rd) && (rob_idx === alu_bypass.rob_idx)
    val bru_bypass_match = bru_bypass_valid && bru_bypass.rd_wen && (reg === bru_bypass.rd) && (rob_idx === bru_bypass.rob_idx)
    val mdu_bypass_match = mdu_bypass_valid && mdu_bypass.rd_wen && (reg === mdu_bypass.rd) && (rob_idx === mdu_bypass.rob_idx)
    val lsu_bypass_match = lsu_bypass_valid && lsu_bypass.rd_wen && (reg === lsu_bypass.rd) && (rob_idx === lsu_bypass.rob_idx)
    val fu_bypass_match = alu_bypass_match || bru_bypass_match || mdu_bypass_match || lsu_bypass_match
    val wb_bypass_match = io.wb.valid && wb.rd_should_write && (reg === wb.rd) && (wb.rob_idx === rob_idx)

    val fu_bypass_data = Mux1H(Array(
      alu_bypass_match -> alu_bypass.value,
      bru_bypass_match -> bru_bypass.value,
      lsu_bypass_match -> lsu_bypass.value,
      mdu_bypass_match -> mdu_bypass.value))

    val sb_rob_ready = (sb_status === SB_ROB_READY) && robEntry.ready
    val sb_rob_data = robEntry.value

    val ready = is_zero || sb_ready || fu_bypass_match || sb_rob_ready
    // the order here matters
    val rdata = Mux(is_zero, 0.U,
      Mux(sb_ready, reg_rdata,
        Mux(sb_rob_ready, sb_rob_data,
          Mux(fu_bypass_match, fu_bypass_data, 0.U))))

    if (param.pipelineDebug) {
      when (TraceTrigger()) {
        when (iq_fire_valid) {
          printf("time: %d [operand read] reg: %d sb_ready: %d reg_rdata: %x fu_bypass_match: %d fu_bypass_data: %x sb_rob_ready: %d sb_rob_data: %x rdata: %x\n",
            GTimer(), reg, sb_ready, reg_rdata, fu_bypass_match, fu_bypass_data, sb_rob_ready, sb_rob_data, rdata)
        }
      }
    }
    (ready, rdata)
  }

  def read_hi() = {
    val hi_ready = !sb_hi
    val hi_rdata = hi
    val ready = hi_ready
    val rdata = hi_rdata
    (ready, rdata)
  }

  def read_lo() = {
    val lo_ready = !sb_lo
    val lo_rdata = lo
    val ready = lo_ready
    val rdata = lo_rdata
    (ready, rdata)
  }

  val isu_rs = read_reg(entry.rs, entry.rs_sb_status, entry.rs_rob_idx, io.rports(0))
  val isu_rt = read_reg(entry.rt, entry.rt_sb_status, entry.rt_rob_idx, io.rports(1))
  val isu_hi = read_hi
  val isu_lo = read_lo

  val real_a = Mux1H(Array(
    (entry.a_src === A_SRC_RS)  -> isu_rs._2,
    (entry.a_src === A_SRC_SA)  -> entry.sa,
    (entry.a_src === A_SRC_HI)  -> isu_hi._2,
    (entry.a_src === A_SRC_LO)  -> isu_lo._2,
    )).asUInt

  val real_b = Mux1H(Array(
    (entry.b_src === B_SRC_REG) -> isu_rt._2,
    (entry.b_src === B_SRC_IMM) -> ext_imm
  )).asUInt

  // the default value for final_rd is $zero
  // so that it will not create any wrong dependency on scoreboard
  // and it wont't mess up regfile
  val final_rd = Mux1H(Array(
    (entry.rd_sel === RD_SEL_RD) -> entry.rd,
    (entry.rd_sel === RD_SEL_RT) -> entry.rt,
    (entry.rd_sel === RD_SEL_31) -> 31.U
  )).asUInt


  // we can accept new upstream requests
  // when we have nothing to do
  // or we have completed and ready to pass down the results
  val alu_fire = iq_fire_valid && (entry.fu_type === FU_TYPE_ALU)
  val bru_fire = iq_fire_valid && (entry.fu_type === FU_TYPE_BRU)
  val lsu_fire = iq_fire_valid && (entry.fu_type === FU_TYPE_LSU) && io.lsu_datain.ready
  val mdu_fire = iq_fire_valid && (entry.fu_type === FU_TYPE_MDU) && io.mdu_datain.ready
  val pru_fire = iq_fire_valid && (entry.fu_type === FU_TYPE_PRU) && io.pru_datain.ready

  val isu_fire = alu_fire || bru_fire || lsu_fire || mdu_fire || pru_fire

  // perf interface
  /*
  io.perf.backend_starving := !iq_fire_valid
  io.perf.operand_not_ready := decode_valid && !operand_ready
  io.perf.rd_busy := decode_valid && !dest_ready
  io.perf.backend_mdu_busy := decode_valid && !io.mdu_datain.ready
  io.perf.backend_lsu_busy := decode_valid && !io.lsu_datain.ready
  */
  io.perf.backend_starving := N
  io.perf.operand_not_ready := N
  io.perf.rd_busy := N
  io.perf.backend_mdu_busy := N
  io.perf.backend_lsu_busy := N

  when (isu_fire) {
    iq_allocated_slot(iq_fire_idx) := N
  }

  // isu to alu
  io.alu_datain.valid := alu_fire
  val alu_datain = io.alu_datain.bits
  alu_datain.a := real_a
  alu_datain.b := real_b
  alu_datain.fu_op := entry.fu_op
  alu_datain.rd := final_rd
  alu_datain.pc := entry.pc
  alu_datain.instr := entry.instr
  alu_datain.is_delayslot := entry.is_delayslot
  alu_datain.branch_id := entry.branch_id
  alu_datain.etw := entry.etw
  alu_datain.rob_idx := entry.rob_idx

  // isu to bru
  io.bru_datain.valid := bru_fire
  val bru_datain = io.bru_datain.bits
  bru_datain.a := real_a
  bru_datain.b := real_b
  bru_datain.fu_op := entry.fu_op
  bru_datain.rd := final_rd
  bru_datain.pc := entry.pc
  bru_datain.instr := entry.instr
  bru_datain.offset := entry.offset
  bru_datain.is_delayslot := entry.is_delayslot
  bru_datain.branch_id := entry.branch_id
  bru_datain.etw := entry.etw
  bru_datain.rob_idx := entry.rob_idx
  bru_datain.bp_info <> entry.bp_info

  // isu to lsu
  io.lsu_datain.valid := lsu_fire
  val lsu_datain = io.lsu_datain.bits
  lsu_datain.base := real_a
  lsu_datain.offset := ext_imm
  lsu_datain.wdata := real_b
  lsu_datain.fu_op := entry.fu_op
  lsu_datain.rd := final_rd
  lsu_datain.pc := entry.pc
  lsu_datain.instr := entry.instr
  lsu_datain.is_delayslot := entry.is_delayslot
  lsu_datain.branch_id := entry.branch_id
  lsu_datain.etw := entry.etw
  lsu_datain.rob_idx := entry.rob_idx
  lsu_datain.lsq_idx := entry.lsq_idx

  // isu to mdu
  io.mdu_datain.valid := mdu_fire
  val mdu_datain = io.mdu_datain.bits
  mdu_datain.a := real_a
  mdu_datain.b := real_b
  mdu_datain.fu_op := entry.fu_op
  mdu_datain.rd := final_rd
  mdu_datain.pc := entry.pc
  mdu_datain.instr := entry.instr
  mdu_datain.is_delayslot := entry.is_delayslot
  mdu_datain.branch_id := entry.branch_id
  mdu_datain.etw := entry.etw
  mdu_datain.rob_idx := entry.rob_idx
  when (mdu_fire) {
    when (entry.rd_sel === RD_SEL_HILO || entry.rd_sel === RD_SEL_HI) {
      sb_hi := Y
    }
    when (entry.rd_sel === RD_SEL_HILO || entry.rd_sel === RD_SEL_LO) {
      sb_lo := Y
    }
  }

  io.pru_datain.valid := pru_fire
  val pru_datain = io.pru_datain.bits
  pru_datain.a := real_a
  pru_datain.b := real_b
  pru_datain.fu_op := entry.fu_op
  pru_datain.reg := entry.rd
  pru_datain.sel := entry.sel
  pru_datain.rd := final_rd
  // cache, pref has a instruction format like this
  // base + offset to form a effective address
  // and a op to be used as cache_op or pref hint
  pru_datain.base := real_a
  pru_datain.offset := ext_imm
  pru_datain.op := entry.instr(20, 16)
  pru_datain.pc := entry.pc
  pru_datain.instr := entry.instr
  pru_datain.is_delayslot := entry.is_delayslot
  pru_datain.branch_id := entry.branch_id
  pru_datain.etw := entry.etw
  pru_datain.rob_idx := entry.rob_idx

  // ******************** flush logic ********************
  // flush signal
  when (flush_valid) {
    for (i <- 0 until nIQEntries) {
      iq_allocated_slot(i) := N
    }
    sb_hi := N
    sb_lo := N
  }

  // generate commit log
  val init_gprs = param.commitLog || param.ilaDebug
  if (init_gprs) {
    // if we use commit log, we explicitly reset gpr and hi/lo
    // to make diff with NEMU much easier
    when (reset.toBool) {
      hi := 0.U
      lo := 0.U
      for (i <- 0 until 32) { rf.write(i, 0.U) }
    }
  }

  // reset anyhow
  when (reset.toBool) {
    hi := 0.U
    lo := 0.U
    for (i <- 0 until 32) { rf.write(i, 0.U) }
  }

  // nemu commit, for debugging
  io.nemu.valid := wb.commit
  io.nemu.pc := wb.curr_pc
  io.nemu.instr := wb.curr_instr
  for(i <- 0 until 32) {
    io.nemu.gpr(i) := rf.read(i)
  }

  if (param.commitLog) {
    val ninstr = RegInit(0.asUInt(32.W))
    when (wb.commit) {
      ninstr := ninstr + 1.U
      when (TraceTrigger()) {
        printf("$pc:    0x%x    $hi:    0x%x    $lo:    0x%x\n", wb.curr_pc, hi, lo)
        printf("$ninstr: 0x%x                     $instr: 0x%x\n", ninstr, wb.curr_instr);
        printf("$0 :0x%x  $at:0x%x  $v0:0x%x  $v1:0x%x\n", rf.read(0), rf.read(1), rf.read(2), rf.read(3))
        printf("$a0:0x%x  $a1:0x%x  $a2:0x%x  $a3:0x%x\n", rf.read(4), rf.read(5), rf.read(6), rf.read(7))
        printf("$t0:0x%x  $t1:0x%x  $t2:0x%x  $t3:0x%x\n", rf.read(8), rf.read(9), rf.read(10), rf.read(11))
        printf("$t4:0x%x  $t5:0x%x  $t6:0x%x  $t7:0x%x\n", rf.read(12), rf.read(13), rf.read(14), rf.read(15))
        printf("$s0:0x%x  $s1:0x%x  $s2:0x%x  $s3:0x%x\n", rf.read(16), rf.read(17), rf.read(18), rf.read(19))
        printf("$s4:0x%x  $s5:0x%x  $s6:0x%x  $s7:0x%x\n", rf.read(20), rf.read(21), rf.read(22), rf.read(23))
        printf("$t8:0x%x  $t9:0x%x  $k0:0x%x  $k1:0x%x\n", rf.read(24), rf.read(25), rf.read(26), rf.read(27))
        printf("$gp:0x%x  $sp:0x%x  $fp:0x%x  $ra:0x%x\n", rf.read(28), rf.read(29), rf.read(30), rf.read(31))
      }
    }
  }
  if (param.ilaDebug) {
    val ila = io.ila_debug
    ila.reg_write := wb_gpr_do_write
    ila.wb_rd := wb.rd
    ila.wb_write_val := wb.value
    for (i <- 0 until 32) { ila.gprs(i) := rf.read(i) }
    ila.hi := hi
    ila.lo := lo

    // due to the limited capacity of ILA, we can diff the state of all the registers by diff-ing its hash
    def recursive_hash(begin: Int, end: Int): UInt = {
      if (begin == end - 1)
        rf.read(begin) ^ rf.read(end)
      else {
        val mid = (begin + end) / 2
        recursive_hash(begin, mid) ^ recursive_hash(mid + 1, end)
      }
    }
    val gpr_current_hash = hi ^ lo ^ recursive_hash(0, 31)
    val gpr_history_hash = RegInit(0.asUInt(param.xprlen.W))
    when (wb.commit) { gpr_history_hash := gpr_history_hash ^ gpr_current_hash }
    ila.gpr_current_hash := gpr_current_hash
    ila.gpr_history_hash := gpr_history_hash

    val wb_rd_history_hash = RegInit(0.asUInt(5.W))
    val wb_rd_value_history_hash = RegInit(0.asUInt(param.xprlen.W))
    when (wb_gpr_do_write) {
      wb_rd_history_hash := wb_rd_history_hash ^ wb.rd
      wb_rd_value_history_hash := wb_rd_value_history_hash ^ wb.value
    }
    ila.wb_rd_history_hash := wb_rd_history_hash
    ila.wb_rd_value_history_hash := wb_rd_value_history_hash
  }
  else {
    io.ila_debug := DontCare
  }
}

class SBReadPort(param: CoreParams) extends Bundle
{
  val valid = Output(Bool())
  val reg = Output(UInt(5.W))
  val sb_status = Input(UInt(SCOREBOARD_STATUS_WIDTH.W))
  val rob_idx = Input(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new SBReadPort(param).asInstanceOf[this.type] }
}

class SBRenamePort(param: CoreParams) extends Bundle
{
  val reg = Output(UInt(5.W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new SBRenamePort(param).asInstanceOf[this.type] }
}

class Scoreboard_IO(param: CoreParams) extends Bundle
{
  val rs = Flipped(new SBReadPort(param))
  val rt = Flipped(new SBReadPort(param))
  val rename = Flipped(ValidIO(new SBRenamePort(param)))

  val alu_wake_up = Flipped(ValidIO(new ALU_ISU_BYPASS(param)))
  val bru_wake_up = Flipped(ValidIO(new BRU_ISU_BYPASS(param)))
  val mdu_wake_up = Flipped(ValidIO(new MDU_ISU_BYPASS(param)))
  val lsu_wake_up = Flipped(ValidIO(new LSU_ISU_BYPASS(param)))

  val free = Flipped(ValidIO(new WBU_ISU_RES(param)))
  val flush = Flipped(ValidIO(new Flush(param)))
}

// sb and rename table entry for $zero in scoreboard can not be set or cleared
// always returns sb_ready on read to the $zero entry.
class Scoreboard(param: CoreParams) extends Module
{
  val io = IO(new Scoreboard_IO(param))

  val n = param.nScoreboardEntries
  val nROBEntries = param.nROBEntries

  require(isPow2(n))
  require(isPow2(nROBEntries))

  val sb = RegInit(Vec.fill(n) { SB_READY })
  val rename_table = RegInit(Vec.fill(n) { 0.asUInt(log2Up(nROBEntries).W) })

  val rs = io.rs
  val rt = io.rt
  val rename = io.rename.bits
  val alu_wake_up = io.alu_wake_up.bits
  val bru_wake_up = io.bru_wake_up.bits
  val mdu_wake_up = io.mdu_wake_up.bits
  val lsu_wake_up = io.lsu_wake_up.bits
  val free = io.free.bits
  val flush_valid = io.flush.valid

  if (param.pipelineDebug) {
    when(TraceTrigger()) {
      when (io.rs.valid) {
        printf("time: %d [Scoreboard] rs rport reg: %d sb_status: %d rob_idx: %d\n",
          GTimer(), rs.reg, rs.sb_status, rs.rob_idx)
      }
      when (io.rt.valid) {
        printf("time: %d [Scoreboard] rt rport reg: %d sb_status: %d rob_idx: %d\n",
          GTimer(), rt.reg, rt.sb_status, rt.rob_idx)
      }
      when (io.rename.valid) {
        printf("time: %d [Scoreboard] rename reg: %d rob_idx: %d\n",
          GTimer(), rename.reg, rename.rob_idx)
      }
    }
  }

  // read port
  val rs_res = read(rs.reg)
  rs.sb_status := rs_res._1
  rs.rob_idx := rs_res._2

  val rt_res = read(rt.reg)
  rt.sb_status := rt_res._1
  rt.rob_idx := rt_res._2

  // rename port
  set_busy(io.rename.valid, rename.reg, rename.rob_idx)

  // be careful about wake up, free, rename conflict
  // wake up and free will not conflict
  // even if their reg addr conflict, due to renaming, their rob idx wil not conflict
  // so only one of them will actually do the update
  //
  // but wake up may conflict with rename
  // free may conflict with rename

  // wake up ports
  val alu_wake_up_wen = io.alu_wake_up.valid && alu_wake_up.rd_wen && !flush_valid
  val bru_wake_up_wen = io.bru_wake_up.valid && bru_wake_up.rd_wen && !flush_valid
  val mdu_wake_up_wen = io.mdu_wake_up.valid && mdu_wake_up.rd_wen && !flush_valid
  val lsu_wake_up_wen = io.lsu_wake_up.valid && lsu_wake_up.rd_wen && !flush_valid

  set_rob_ready(alu_wake_up_wen && !(io.rename.valid && alu_wake_up.rd === rename.reg), alu_wake_up.rd, alu_wake_up.rob_idx)
  set_rob_ready(bru_wake_up_wen && !(io.rename.valid && bru_wake_up.rd === rename.reg), bru_wake_up.rd, bru_wake_up.rob_idx)
  set_rob_ready(mdu_wake_up_wen && !(io.rename.valid && mdu_wake_up.rd === rename.reg), mdu_wake_up.rd, mdu_wake_up.rob_idx)
  set_rob_ready(lsu_wake_up_wen && !(io.rename.valid && lsu_wake_up.rd === rename.reg), lsu_wake_up.rd, lsu_wake_up.rob_idx)

  // free port
  val free_wen = io.free.valid && free.rd_should_write && !flush_valid
  clear(free_wen && !(io.rename.valid && free.rd === rename.reg), free.rd, free.rob_idx)


  // flush
  reset(flush_valid)

  def read(addr: UInt) = {
    // forgive me, copy paste here to get rid of strange Java NullPointer errors
    // we should deal with read write conflict here
    // do not bypass rename port's write value to read ports
    // or we will stall forever
    // eg: xor v0, v0, v1
    val alu_wake_up_wen = io.alu_wake_up.valid && alu_wake_up.rd_wen && !flush_valid
    val bru_wake_up_wen = io.bru_wake_up.valid && bru_wake_up.rd_wen && !flush_valid
    val mdu_wake_up_wen = io.mdu_wake_up.valid && mdu_wake_up.rd_wen && !flush_valid
    val lsu_wake_up_wen = io.lsu_wake_up.valid && lsu_wake_up.rd_wen && !flush_valid
    val free_wen = io.free.valid && free.rd_should_write && !flush_valid

    val alu_wake_up_update = do_update(alu_wake_up_wen, alu_wake_up.rd, alu_wake_up.rob_idx, SB_ROB_READY)
    val bru_wake_up_update = do_update(bru_wake_up_wen, bru_wake_up.rd, bru_wake_up.rob_idx, SB_ROB_READY)
    val mdu_wake_up_update = do_update(mdu_wake_up_wen, mdu_wake_up.rd, mdu_wake_up.rob_idx, SB_ROB_READY)
    val lsu_wake_up_update = do_update(lsu_wake_up_wen, lsu_wake_up.rd, lsu_wake_up.rob_idx, SB_ROB_READY)
    val free_update = do_update(free_wen, free.rd, free.rob_idx, SB_READY)

    val alu_match = alu_wake_up_update._1 && alu_wake_up.rd === addr
    val bru_match = bru_wake_up_update._1 && bru_wake_up.rd === addr
    val mdu_match = mdu_wake_up_update._1 && mdu_wake_up.rd === addr
    val lsu_match = lsu_wake_up_update._1 && lsu_wake_up.rd === addr
    val free_match = free_update._1 && free.rd === addr

    val wake_up_match = alu_match || bru_match || mdu_match || lsu_match || free_match

    val update_sb_status = Mux1H(Array(
      alu_match -> alu_wake_up_update._4,
      bru_match -> bru_wake_up_update._4,
      mdu_match -> mdu_wake_up_update._4,
      lsu_match -> lsu_wake_up_update._4,
      free_match -> free_update._4
    ))
    val read_sb_status = Mux(wake_up_match, update_sb_status, sb(addr))
    (read_sb_status, rename_table(addr))
  }

  def update(en: Bool, addr: UInt, next: UInt) = {
    when (en && (addr =/= 0.U)) { sb(addr) := next }
  }

  def do_update(en: Bool, addr: UInt, robIdx: UInt, sb_status: UInt) = {
    (en && !waw(addr, robIdx), addr, robIdx, sb_status)
  }

  def set_busy(en: Bool, addr: UInt, robIdx: UInt): Unit = {
    update(en, addr, SB_BUSY)
    when (en && (addr =/= 0.U)) { rename_table(addr) := robIdx }
  }
  def set_rob_ready(en: Bool, addr: UInt, robIdx: UInt): Unit = update(en && !waw(addr, robIdx), addr, SB_ROB_READY)
  def clear(en: Bool, addr: UInt, robIdx: UInt): Unit = update(en && !waw(addr, robIdx), addr, SB_READY)
  def reset(en: Bool): Unit = {
    when (en) {
      for (i <- 0 until n) { sb(i) := SB_READY }
    }
  }
  def waw(addr: UInt, robIdx: UInt) = rename_table(addr) =/= robIdx

  def dump(en: Bool): Unit = {
    when (TraceTrigger() && en) {
      printf("time: %d [sboard] ", GTimer())
      for (i <- 0 until 32) {
        printf("%d ", sb(i.U))
      }
      printf("\n")
      printf("time: %d [map table] ", GTimer())
      for (i <- 0 until 32) {
        printf("%d ", rename_table(i.U))
      }
      printf("\n")
    }
  }
  if (param.pipelineDebug) {
    dump(Y)
  }
}

// we haven't deal with rw conflict
class RegFile(n: Int, w: Int, zero: Boolean = false) {
  private val rf = Mem(n, UInt(w.W))
  // read write that generates dynamic addressors
  private def access(addr: UInt) = rf(~addr(log2Ceil(n)-1,0))
  def read(addr: UInt) = {
    Mux(addr === UInt(0), UInt(0), access(addr))
  }
  def write(addr: UInt, data: UInt) = {
    when (addr =/= UInt(0)) {
      access(addr) := data
    }
  }
  // read write that generates static addressors
  private def access(addr: Int) = rf(n - addr)
  def read(addr: Int) = {
    if (addr == 0)
      0.asUInt(w.W)
    else
      access(addr)
  }
  def write(addr: Int, data: UInt) = {
    if (addr != 0) {
      access(addr) := data
    }
  }
}
