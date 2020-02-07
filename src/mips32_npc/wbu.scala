package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class ILACommit(param: CoreParams) extends Bundle {
  val commit = Output(Bool())
  val curr_pc = Output(UInt(param.xprlen.W))
  val curr_pc_hash = Output(UInt(param.xprlen.W))
  val instr_hash = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val ninstr = Output(UInt(param.xprlen.W))
  override def cloneType = { new ILACommit(param).asInstanceOf[this.type] }
}

class WBUPerfIO extends Bundle
{
  val instr_commit = Output(Bool())
  val branch_commit = Output(Bool())
  val branch_misprediction = Output(Bool())
  val branch_btb_miss = Output(Bool())
  val br_commit = Output(Bool())
  val br_misprediction = Output(Bool())
  val br_btb_miss = Output(Bool())
  val j_commit = Output(Bool())
  val j_misprediction = Output(Bool())
  val j_btb_miss = Output(Bool())
  val call_commit = Output(Bool())
  val call_misprediction = Output(Bool())
  val call_btb_miss = Output(Bool())
  val ret_commit = Output(Bool())
  val ret_misprediction = Output(Bool())
  val ret_btb_miss = Output(Bool())
}

class WBU_IO(param: CoreParams) extends Bundle
{
  val commit = Flipped(DecoupledIO(new ROBCommitPort(param)))
  val free_rob_head = Output(Bool())
  val pru_instr_commit = Output(Bool())
  val wb = ValidIO(new WBU_ISU_RES(param))
  val retire = new LSQRetirePortIO(param)
  val flush = ValidIO(new Flush(param))
  val delayed_flush = ValidIO(new Flush(param))
  val branch_retire = ValidIO(new BranchRetire(param))
  val delayed_branch_retire = ValidIO(new BranchRetire(param))
  val bht_1_update = ValidIO(new BHTUpdate(param.bht1Param))
  val bht_2_update = ValidIO(new BHTUpdate(param.bht2Param))
  val btb_update = ValidIO(new BTBUpdate(param))
  val ras_revert = ValidIO(new RASRevert(param))

  val perf = new WBUPerfIO
  val cp0_dataout = ValidIO(new ExceptionInfo(param))
  val cp0_res = Flipped(new CP0_RES(param))

  val ila_debug = new ILACommit(param)
  val loongson_debug = new LoongsonCommit(param)
}

class WBU(param: CoreParams) extends Module
{
  val io = IO(new WBU_IO(param))

  val rob_idx = io.commit.bits.idx
  val robEntry = io.commit.bits.entry
  if (param.pipelineDebug) {
   when (TraceTrigger()) {
    when (io.commit.fire()) {
      printf("time: %d [wbu_commit]: pc: %x fu_type: %x rd: %x rd_wen: %d value: %x etw: %x ",
        GTimer(), robEntry.pc, robEntry.fu_type, robEntry.rd, robEntry.rd_wen, robEntry.value, robEntry.etw)
      when (robEntry.fu_type === FU_TYPE_ALU) {
        printf("\n")
      } .elsewhen (robEntry.fu_type === FU_TYPE_BRU) {
        printf("target: %x is_taken: %d\n", robEntry.target, robEntry.is_taken)
      } .elsewhen (robEntry.fu_type === FU_TYPE_MDU) {
        printf("hi: %x hi_wen: %d lo: %x lo_wen: %d\n", robEntry.hi, robEntry.hi_wen, robEntry.lo, robEntry.lo_wen)
      } .elsewhen (robEntry.fu_type === FU_TYPE_LSU) {
        printf("lsq_idx: %d is_load: %d speculative: %d badvaddr: %x\n",
          robEntry.lsq_idx, robEntry.is_load, robEntry.speculative, robEntry.badvaddr)
      } .elsewhen (robEntry.fu_type === FU_TYPE_PRU) {
        printf("\n")
      } .otherwise {
        assert(N, "unknown fu_type")
      }
    }
   }
  }

  // wbu to isu wb
  val wb = io.wb.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.wb.valid) {
        printf("time: %d [wbu_isu]: rd_should_write: %d rd_do_write: %d rd: %d rob_idx: %d val: %x hi_wen: %d hi: %x lo_wen: %d lo: %x\n",
          GTimer(), wb.rd_should_write, wb.rd_do_write, wb.rd, wb.rob_idx, wb.value, wb.hi_wen, wb.hi, wb.lo_wen, wb.lo)
      }
    }
  }

  // flush signal
  if (param.pipelineDebug) {
    val flush = io.flush.bits
   when (TraceTrigger()) {
    when (io.flush.valid && flush.kind =/= FLUSH_KIND_NO_FLUSH) {
      printf("time: %d [flush]: ", GTimer())
      when (flush.kind === FLUSH_KIND_NO_COND) {
        printf("unconditional ")
      } .elsewhen (flush.kind === FLUSH_KIND_FLUSH_COND) {
        printf("conditional branch_id: %d ", flush.branch_id)
      } .otherwise {
        when (!reset.toBool) {
          assert(N, "unknown flush kind ")
        }
      }
      printf("npc: %x\n", flush.npc)
    }
   }
  }

  // bht_update
  val bht_1_update = io.bht_1_update.bits
  val bht_2_update = io.bht_2_update.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bht_1_update.valid) {
        printf("time: %d [bht_1_update]: taken: %d counter_idx: %x revert_history: %x original_history: %x\n",
          GTimer(), bht_1_update.taken, bht_1_update.counter_idx, bht_1_update.revert, bht_1_update.original_history)
      }
      when (io.bht_2_update.valid) {
        printf("time: %d [bht_2_update]: taken: %d counter_idx: %x revert_history: %x original_history: %x\n",
          GTimer(), bht_2_update.taken, bht_2_update.counter_idx, bht_2_update.revert, bht_2_update.original_history)
      }
    }
  }

  // btb_update
  val btb_update = io.btb_update.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.btb_update.valid) {
        printf("time: %d [btb_update]: pc: %x target: %x\n",
          GTimer(), btb_update.pc, btb_update.target)
      }
    }
  }

  val fu_etw = robEntry.etw

  // WBU
  val wb_valid = io.commit.fire()
  val inst_except = fu_etw(ETB_AdEL_IF) | fu_etw(ETB_AdEL_LD) |
    fu_etw(ETB_AdES) | fu_etw(ETB_INVOP) | fu_etw(ETB_OV) |
    fu_etw(ETB_Mod) | fu_etw(ETB_TLBL) | fu_etw(ETB_TLBS)
  val s1_stall = Wire(Bool())
  val s2_stall = Wire(Bool())

  io.commit.ready := !s1_stall

  val s0_passdown = wb_valid && !s1_stall && !io.flush.valid

  // if it's LSU instr, we needed to free LSQ
  val s1_reg = Reg(new ROBEntry(param))
  val s1_rob_idx = RegEnable(next = rob_idx, enable = s0_passdown)
  val s1_inst_except = RegEnable(next = inst_except, enable = s0_passdown)
  val s1_ls_retire = s1_reg.fu_type === FU_TYPE_LSU
  val s1_ls_execute = !s1_reg.speculative && !s1_inst_except

  val s1_valid = RegEnable(next = Y, init = N, enable = s0_passdown)
  val s1_passdown = s1_valid && (!s1_ls_retire || io.retire.req.fire()) && !s2_stall && !io.flush.valid
  s1_stall := s1_valid && !s1_passdown
  when (s0_passdown) {
    s1_reg := robEntry
  }
  when (!s0_passdown && (s1_passdown || io.flush.valid)) {
    s1_valid := N
  }

  io.retire.req.valid := s1_valid && s1_ls_retire && !s2_stall && !io.flush.valid
  val retire_req = io.retire.req.bits
  retire_req.retire_lq := s1_reg.is_load
  retire_req.idx := s1_reg.lsq_idx
  retire_req.execute := s1_ls_execute

  val s2_reg = Reg(new ROBEntry(param))
  val s2_rob_idx = RegEnable(next = s1_rob_idx, enable = s1_passdown)
  val s2_ls_retire = RegEnable(next = s1_ls_retire, enable = s1_passdown)
  val s2_ls_execute = RegEnable(next = s1_ls_execute, enable = s1_passdown)

  val s2_valid = RegEnable(next = Y, init = N, enable = s1_passdown)
  val s2_passdown = s2_valid && (!s2_ls_retire || !s2_ls_execute || io.retire.resp.valid)
  val s2_inst_except = RegEnable(next = s1_inst_except, enable = s1_passdown)
  val s2_use_load_data = s2_reg.is_load && s2_ls_retire && s2_ls_execute
  s2_stall := s2_valid && !s2_passdown
  when (s1_passdown) {
    s2_reg := s1_reg
  }
  when (!s1_passdown && s2_passdown) {
    s2_valid := N
  }

  val retire_resp = io.retire.resp.bits

  val alu_valid = s2_passdown && s2_reg.fu_type === FU_TYPE_ALU
  val bru_valid = s2_passdown && s2_reg.fu_type === FU_TYPE_BRU
  val mdu_valid = s2_passdown && s2_reg.fu_type === FU_TYPE_MDU
  val lsu_valid = s2_passdown && s2_reg.fu_type === FU_TYPE_LSU
  val pru_valid = s2_passdown && s2_reg.fu_type === FU_TYPE_PRU

  io.free_rob_head := s2_passdown

  io.wb.valid := s2_passdown
  wb.value := Mux(s2_use_load_data, retire_resp.data, s2_reg.value)
  wb.rd_should_write := !s2_inst_except && Mux(alu_valid, Y, s2_reg.rd_wen)
  wb.rd_do_write := !s2_inst_except && s2_reg.rd_wen
  val wb_pc = s2_reg.pc
  val wb_instr = s2_reg.instr
  wb.rd := s2_reg.rd
  wb.rob_idx := s2_rob_idx
  wb.hi := s2_reg.hi
  wb.hi_wen := mdu_valid && s2_reg.hi_wen
  wb.lo := s2_reg.lo
  wb.lo_wen := mdu_valid && s2_reg.lo_wen

  // latch for another cycle for wbu reg write to finish
  // so that, when we generate commit log, we get the correct register value
  val commit = RegNext(next = io.wb.valid, init = N)
  val curr_pc = RegNext(wb_pc)
  val commit_instr = RegNext(wb_instr)

  wb.commit := commit
  wb.curr_pc := curr_pc
  wb.curr_instr := commit_instr

  // ******** branch misprediction detection and exception handling ********
  // we rely on branch prediction to provide a correct sequence of instructions
  // branch misprediction has the following cases:
  // 1. we recognized that it's a branch(In branch prediction stage), BUT BRU tells us that there is direction/target misprediction
  val bp_info = s2_reg.bp_info

  // case 1
  val direction_misprediction = s2_reg.is_taken =/= bp_info.predicted_taken
  val target_misprediction = s2_reg.target =/= bp_info.predicted_target
  val branch_misprediction = bru_valid && (direction_misprediction || (s2_reg.is_taken && target_misprediction))

  val has_except = io.cp0_res.has_exception
  
  val flush_valid = RegInit(N)
  val flush_npc = Reg(UInt(param.xprlen.W))

  when (branch_misprediction) {
    flush_valid := Y
    flush_npc := MuxCase(s2_reg.pc + 8.U, Array(
      (branch_misprediction && s2_reg.is_taken) -> s2_reg.target))
  }

  // consider exception flush logic, wait until next
  // instruction commit
  val fu_valid = s2_passdown
  when(flush_valid && fu_valid) { flush_valid := N }

  val branch_misprediction_flush = flush_valid && fu_valid

  val branch_retire = s2_passdown && bru_valid

  val s3_valid = RegEnable(next = Y, init = N, enable = branch_retire)
  val s3_branch_predict_taken = RegInit(N)
  val s3_branch_target = RegInit(0.asUInt(param.xprlen.W))
  when (branch_retire) {
    s3_branch_predict_taken := !branch_misprediction && s2_reg.is_taken
    s3_branch_target := s2_reg.target
  }
  when (s2_passdown && !bru_valid) {
    s3_valid := N
  }

  // memory RAW dependency violation flush
  // triggered by valid stores
  // if the store causes exception(thus not executed),
  // it will cause a pipeline flush anyway
  val s2_mem_raw_depenency_violation_flush = s2_passdown && s2_ls_retire && s2_ls_execute && !s2_reg.is_load && retire_resp.flush

  // 1. if this store is not a delayslot instruction or it's in delayslot but next pc is +4 , set pc to next instr
  // 2. if this store in delayslot and previous branch mispredicts,
  //    branch misprediction will cause a flush anyway
  // 3. if this store in delayslto and previous branch correctly predicts and jumps
  //    then flush pc should be the target address
  val s2_raw_flush_npc = Mux(s3_valid && s3_branch_predict_taken, s3_branch_target, s2_reg.pc + 4.U)

  // wait until delayslot instr committed
  io.flush.valid := has_except || branch_misprediction_flush || s2_mem_raw_depenency_violation_flush
  val flush = io.flush.bits
  flush.seg_base := io.cp0_res.seg_base
  flush.spr_valid := io.cp0_res.spr_valid
  flush.kind := FLUSH_KIND_NO_COND
  flush.branch_id := 0.U
  // be careful about the order here
  flush.npc := Mux(has_except, io.cp0_res.flush_addr,
    Mux(branch_misprediction_flush, flush_npc, s2_raw_flush_npc))

  io.delayed_flush.valid := RegNext(io.flush.valid, N)
  val delayed_flush = io.delayed_flush.bits
  delayed_flush.kind := RegNext(flush.kind)
  delayed_flush.branch_id := RegNext(flush.branch_id)
  delayed_flush.npc := RegNext(flush.npc)
  delayed_flush.spr_valid := RegNext(flush.spr_valid)
  delayed_flush.seg_base := RegNext(flush.seg_base)

  io.pru_instr_commit := pru_valid

  // bht update
  val bht_1_info = bp_info.bht_1_info
  val bht_2_info = bp_info.bht_2_info

  val bht_1_direction_misprediction = s2_reg.is_taken =/= bht_1_info.predicted_taken
  val bht_2_direction_misprediction = s2_reg.is_taken =/= bht_2_info.predicted_taken

  io.bht_1_update.valid := bru_valid && bp_info.is_br
  bht_1_update.revert := bht_1_direction_misprediction
  bht_1_update.original_history := bht_1_info.original_history
  bht_1_update.taken := s2_reg.is_taken
  bht_1_update.counter_idx := bht_1_info.counter_idx

  io.bht_2_update.valid := bru_valid && bp_info.is_br
  bht_2_update.revert := bht_2_direction_misprediction
  bht_2_update.original_history := bht_2_info.original_history
  bht_2_update.taken := s2_reg.is_taken
  bht_2_update.counter_idx := bht_2_info.counter_idx

  // whenever bru writes to $ra, we treat it as a call
  // I briefly readed gcc generated assembly of microbench
  // I found that:
  // most of calls uses jal
  // call of function pointers uses jalr
  val call = bru_valid && s2_reg.rd_wen && s2_reg.rd === 31.U
  val ret = bru_valid && bp_info.is_ret

  // btb update
  // ret should use RAS, do not pollute BTB!!!
  io.btb_update.valid := bru_valid && bp_info.is_jr && !ret
  btb_update.pc := s2_reg.pc
  btb_update.target := s2_reg.target

  // revert ras on misprediction
  val ras_revert = io.ras_revert.bits
  io.ras_revert.valid := io.perf.br_misprediction || io.perf.call_misprediction
  ras_revert.push := io.perf.call_misprediction
  ras_revert.call_pc := s2_reg.value
  ras_revert.original_top := bp_info.original_top

  // deallocate this brob entry
  io.branch_retire.valid := bru_valid
  io.branch_retire.bits.branch_id := s2_reg.branch_id
  io.delayed_branch_retire.valid := RegNext(bru_valid, N)
  io.delayed_branch_retire.bits.branch_id := RegNext(s2_reg.branch_id)

  // exception and interrupt
  val cp0_dataout = io.cp0_dataout.bits
  io.cp0_dataout.valid := s2_valid
  val is_delayslot = s2_reg.is_delayslot
  cp0_dataout.is_delayslot := is_delayslot
  cp0_dataout.etw := s2_reg.etw
  cp0_dataout.pc := wb_pc
  val badvaddr = Mux1H(Array(
    alu_valid -> s2_reg.pc,
    mdu_valid -> s2_reg.pc,
    pru_valid -> s2_reg.badvaddr,
    lsu_valid -> s2_reg.badvaddr,
    bru_valid -> s2_reg.target))
  cp0_dataout.badvaddr := badvaddr

  // perf
  io.perf.instr_commit := wb_valid
  io.perf.branch_commit := bru_valid
  io.perf.branch_misprediction := branch_misprediction
  io.perf.branch_btb_miss := io.perf.branch_commit && bp_info.btb_miss
  io.perf.br_commit := bru_valid && bp_info.is_br
  io.perf.br_misprediction := bp_info.is_br && branch_misprediction
  io.perf.br_btb_miss := io.perf.br_commit && bp_info.btb_miss
  val j_misprediction = bp_info.is_j && branch_misprediction
  io.perf.j_commit := bru_valid && bp_info.is_j
  io.perf.j_misprediction := j_misprediction
  io.perf.j_btb_miss := io.perf.j_commit && bp_info.btb_miss
  io.perf.call_commit := call
  io.perf.call_misprediction := call && branch_misprediction
  io.perf.call_btb_miss := io.perf.call_commit && bp_info.btb_miss
  io.perf.ret_commit := ret
  io.perf.ret_misprediction := ret && branch_misprediction
  io.perf.ret_btb_miss := io.perf.ret_commit && bp_info.btb_miss
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.perf.br_commit && io.perf.br_misprediction) {
        printf("time: %d br_misprediction: pc: %x\n", GTimer(), wb_pc);
      }
      when (io.perf.j_commit && io.perf.j_misprediction) {
        printf("time: %d j_misprediction: pc: %x\n", GTimer(), wb_pc);
      }
      when (io.perf.call_commit && io.perf.call_misprediction) {
        printf("time: %d call_misprediction: pc: %x\n", GTimer(), wb_pc);
      }
      when (io.perf.ret_commit && io.perf.ret_misprediction) {
        printf("time: %d ret_misprediction: pc: %x\n", GTimer(), wb_pc);
      }
    }
  }


  // ila debug
  if (param.ilaDebug) {
    val ninstr = RegInit(0.asUInt(param.xprlen.W))
    val curr_pc_hash = RegInit(0.asUInt(param.xprlen.W))
    val instr_hash = RegInit(0.asUInt(param.xprlen.W))
    when (commit) {
      ninstr := ninstr + 1.U
      curr_pc_hash := curr_pc_hash ^ curr_pc
      instr_hash := instr_hash ^ commit_instr
    }

    val ila = io.ila_debug
    ila.commit := commit
    ila.curr_pc := curr_pc
    ila.curr_pc_hash := curr_pc_hash
    ila.instr_hash := instr_hash
    ila.instr := commit_instr
    ila.ninstr := ninstr
  }
  else {
    io.ila_debug := DontCare
  }

  // loongson debug
  if(param.useLoongson) {
    val ninstr = RegInit(0.asUInt(param.xprlen.W))

    val loongson = io.loongson_debug
    loongson.ninstr := ninstr
    loongson.instr := wb_instr
    loongson.wb_valid := wb_valid
    loongson.wb_pc := wb_pc
    loongson.wb_rf_wen := wb_valid && wb.rd_should_write && wb.rd_do_write
    loongson.wb_rf_wdata := wb.value
    loongson.wb_rf_wnum := wb.rd

    when(loongson.wb_valid) { ninstr := ninstr + 1.U }
  } else {
    io.loongson_debug := DontCare
  }
}
