package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class LSUPerfIO extends Bundle
{
  val wait_dcache = Output(Bool())
  val load = Output(Bool())
  val load_miss = Output(Bool())
  val store = Output(Bool())
  val store_miss = Output(Bool())
}

class LSU_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(DecoupledIO(new ISU_LSU_DATAIN(param)))
  val lq_wport = ValidIO(new LSQWPort(param))
  val sq_wport = ValidIO(new LSQWPort(param))
  val rob = ValidIO(new ROBWPort(param))

  val daddr = new TLBTransaction(param)

  val flush = Flipped(ValidIO(new Flush(param)))
}

class LSU(param: CoreParams) extends Module
{
  val io = IO(new LSU_IO(param))
  val in_valid = RegInit(N)
  val in = Reg(new ISU_LSU_DATAIN(param))
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (in_valid) {
        printf("time: %d [isu_lsu]: pc: %x rob_idx: %x etw: %x fu_op: %d base: %x offset: %x wdata: %x rd: %d\n",
          GTimer(), in.pc, in.rob_idx, in.etw, in.fu_op, in.base, in.offset, in.wdata, in.rd)
      }
    }
  }

  val lsu_base = RegInit(0.U(param.xprlen.W))

  val flush = io.flush.bits
  val s0_flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, in.is_delayslot, in.branch_id)

  io.in.ready := Y
  when (io.in.fire()) {
    in_valid := Y
    in := io.in.bits
  }

  val s0_passdown = Wire(Bool())
  when (s0_passdown && !io.in.fire()) { in_valid := N }

  // LSU
  // ******************** Preparation ********************
  // do the following things:
  // 1. address generation
  // 2. address translation
  // 3. write to ROB
  // 4. issue jobs to LSQ
  val s0_valid = in_valid
  val s0_addr = in.base + in.offset
  val s0_op = in.fu_op

  val s0_fcn = Mux1H(Array(
    (s0_op === FU_OP_LSU_LW)  ->  M_XRD,
    (s0_op === FU_OP_LSU_LL)  ->  M_XRD,
    (s0_op === FU_OP_LSU_LWL) ->  M_XRD,
    (s0_op === FU_OP_LSU_LWR) ->  M_XRD,
    (s0_op === FU_OP_LSU_LB)  ->  M_XRD,
    (s0_op === FU_OP_LSU_LBU) ->  M_XRD,
    (s0_op === FU_OP_LSU_LH)  ->  M_XRD,
    (s0_op === FU_OP_LSU_LHU) ->  M_XRD,
    (s0_op === FU_OP_LSU_SW)  ->  M_XWR,
    (s0_op === FU_OP_LSU_SC)  ->  M_XWR,
    (s0_op === FU_OP_LSU_SWL) ->  M_XWR,
    (s0_op === FU_OP_LSU_SWR) ->  M_XWR,
    (s0_op === FU_OP_LSU_SB)  ->  M_XWR,
    (s0_op === FU_OP_LSU_SH)  ->  M_XWR
  ))

  // add one more bit to byte_sel
  // so that it wont't overflow in subsequent byte_sel + 1.U
  val s0_byte_sel = Cat(Fill(1, UInt(0)), s0_addr(1, 0))
  val s0_wdata = Mux1H(Array(
    (s0_op === FU_OP_LSU_SW)   ->  in.wdata,
    (s0_op === FU_OP_LSU_SC)   ->  in.wdata,
    (s0_op === FU_OP_LSU_SB)   ->  (in.wdata << (s0_byte_sel << 3)),
    (s0_op === FU_OP_LSU_SH)   ->  (in.wdata << (s0_byte_sel << 3)),
    (s0_op === FU_OP_LSU_SWL)  ->  (in.wdata >> ((3.U - s0_byte_sel) << 3)),
    (s0_op === FU_OP_LSU_SWR)  ->  (in.wdata << (s0_byte_sel << 3)),

    // this will not be written to memory/mmio
    // but it will pass down to lsq
    // the old data resides in in.wdata
    // we merge old data with new loaded new data in LSQ
    (s0_op === FU_OP_LSU_LW)  ->   in.wdata,
    (s0_op === FU_OP_LSU_LL)  ->   in.wdata,
    (s0_op === FU_OP_LSU_LWL) ->   in.wdata,
    (s0_op === FU_OP_LSU_LWR) ->   in.wdata,
    (s0_op === FU_OP_LSU_LB)  ->   in.wdata,
    (s0_op === FU_OP_LSU_LBU) ->   in.wdata,
    (s0_op === FU_OP_LSU_LH)  ->   in.wdata,
    (s0_op === FU_OP_LSU_LHU) ->   in.wdata
  ))
  val s0_wstrb = Mux1H(Array(
    (s0_op === FU_OP_LSU_SW)   ->  "b1111".U,
    (s0_op === FU_OP_LSU_SC)   ->  "b1111".U,
    (s0_op === FU_OP_LSU_SB)   ->  ("b0001".asUInt(4.W) << s0_byte_sel),
    (s0_op === FU_OP_LSU_SH)   ->  ("b0011".asUInt(4.W) << s0_byte_sel),
    (s0_op === FU_OP_LSU_SWL)  ->  ((1.U << (s0_byte_sel + 1.U)) - 1.U),
    (s0_op === FU_OP_LSU_SWR)  ->  ("b1000".U.asSInt >> (3.U - s0_byte_sel)).asUInt
  ))

  val bad_addr_load = ((s0_addr(1, 0) =/= 0.U && (s0_op === FU_OP_LSU_LW || s0_op === FU_OP_LSU_LL)) ||
    (s0_addr(0) =/= 0.U && (s0_op === FU_OP_LSU_LH || s0_op === FU_OP_LSU_LHU)))
  val bad_addr_store = ((s0_addr(1, 0) =/= 0.U && (s0_op === FU_OP_LSU_SW || s0_op === FU_OP_LSU_SC)) ||
    (s0_addr(0) =/= 0.U && s0_op === FU_OP_LSU_SH))
  when (!reset.toBool) {
    // assert(!((s0_valid && !s0_flush_valid) && (bad_addr_load || bad_addr_store)), "Misaligned load/store")
  }

  // for mmio load store, bytes cannot by extended to words
  val s0_mem_addr = Cat(s0_addr(param.xprlen - 1, 2), 0.asUInt(2.W))
  val s0_bad_tlb = WireInit(false.B)

  val s0_misaligned = bad_addr_load || bad_addr_store
  val s0_bad_ls = s0_misaligned || s0_bad_tlb
  val s0_ls_len = ML_W /* Mux1H(Array(
    (s0_op === FU_OP_LSU_LW)  ->  ML_W,
    (s0_op === FU_OP_LSU_LL)  ->  ML_W,
    (s0_op === FU_OP_LSU_LWL) ->  ML_W,
    (s0_op === FU_OP_LSU_LWR) ->  ML_W,
    (s0_op === FU_OP_LSU_LB)  ->  ML_B,
    (s0_op === FU_OP_LSU_LBU) ->  ML_B,
    (s0_op === FU_OP_LSU_LH)  ->  ML_H,
    (s0_op === FU_OP_LSU_LHU) ->  ML_H,
    (s0_op === FU_OP_LSU_SW)  ->  ML_W,
    (s0_op === FU_OP_LSU_SC)  ->  ML_W,
    (s0_op === FU_OP_LSU_SWL) ->  ML_W,
    (s0_op === FU_OP_LSU_SWR) ->  ML_W,
    (s0_op === FU_OP_LSU_SB)  ->  ML_B,
    (s0_op === FU_OP_LSU_SH)  ->  ML_H,
  )) */
  // val s0_ls_addr = Mux(VAddr(s0_addr).isMMIO, s0_addr, s0_mem_addr)
  val s0_ls_addr = s0_mem_addr
  val s0_ls_etw = Mux1H(Array(
      bad_addr_load -> ET_AdEL_LD,
      bad_addr_store -> ET_AdES,
      ))

  val s0_tlb_etw = WireInit(in.etw)
  val s0_etw = in.etw | s0_ls_etw | s0_tlb_etw
  val s0_reg = in

  s0_passdown := s0_valid && !s0_flush_valid

  // address translation
  io.daddr.req.valid := s0_valid && !s0_misaligned
  io.daddr.req.bits.fcn := s0_fcn
  io.daddr.req.bits.vaddr := lsu_base + s0_ls_addr

  s0_tlb_etw := io.daddr.resp.bits.etw
  s0_bad_tlb := s0_tlb_etw.orR

  when(io.flush.valid && io.flush.bits.spr_valid) {
	lsu_base := io.flush.bits.seg_base
  }

  val ls_vaddr = lsu_base + s0_ls_addr
  val ls_paddr = io.daddr.resp.bits.paddr
  val is_mmio = VAddr(s0_addr).isMMIO
  val is_load = s0_fcn === M_XRD
  val is_store = s0_fcn === M_XWR
  val is_cached = VAddr(ls_vaddr).isCached

  // ******************** write to ROB ********************
  io.rob.valid := s0_passdown
  val rob = io.rob.bits
  rob.idx := s0_reg.rob_idx
  val robEntry = rob.entry

  // mmio and store executes nonspeculatively
  // only load to memory executes speculatively
  val speculative_ls = is_load && !is_mmio
  val ls_exception = (s0_etw =/= 0.U) || s0_bad_ls

  // cases under which rob can retire directly(by setting rob entry to ready)
  // 1. mmio load/store
  // 2. memory store
  //   load/store that has side effects should be executed non-speculatively
  //   so we retire it and execute it after retire
  // 3. load/store exception
  //   if there is a exception, then lsq will not execute it
  //   and this rob may not be retired properly(especially for speculative memory load)
  robEntry.ready := is_mmio || is_store || ls_exception
  robEntry.fu_type := FU_TYPE_LSU

  robEntry.value := DontCare
  robEntry.rd := s0_reg.rd
  robEntry.rd_wen := is_load
  robEntry.pc := s0_reg.pc
  robEntry.instr := s0_reg.instr
  robEntry.is_delayslot := s0_reg.is_delayslot
  robEntry.branch_id := s0_reg.branch_id
  robEntry.etw := s0_etw

  robEntry.target := DontCare
  robEntry.is_taken := DontCare
  robEntry.bp_info := DontCare

  robEntry.hi := DontCare
  robEntry.hi_wen := DontCare
  robEntry.lo := DontCare
  robEntry.lo_wen := DontCare

  robEntry.badvaddr := s0_addr
  robEntry.lsq_idx := s0_reg.lsq_idx
  robEntry.is_load := is_load
  robEntry.speculative := speculative_ls


  // ******************** write to LSQ ********************
  val lq_wport = io.lq_wport.bits.entry
  val sq_wport = io.sq_wport.bits.entry

  io.lq_wport.valid := s0_passdown && is_load
  io.lq_wport.bits.idx := s0_reg.lsq_idx
  lq_wport.valid := Y
  lq_wport.fired := N
  lq_wport.speculative := speculative_ls
  lq_wport.bad_ls := s0_bad_ls
  lq_wport.addr := ls_paddr
  lq_wport.data := s0_wdata
  lq_wport.fcn := s0_fcn
  lq_wport.is_cached := is_cached
  lq_wport.fu_op := s0_reg.fu_op
  lq_wport.wstrb := s0_wstrb
  lq_wport.len := s0_ls_len
  lq_wport.byte_sel := s0_byte_sel
  lq_wport.rob_idx := s0_reg.rob_idx

  io.sq_wport.valid := s0_passdown && is_store
  io.sq_wport.bits.idx := s0_reg.lsq_idx
  sq_wport.valid := Y
  sq_wport.fired := N
  sq_wport.speculative := speculative_ls
  sq_wport.bad_ls := s0_bad_ls
  sq_wport.addr := ls_paddr
  sq_wport.data := s0_wdata
  sq_wport.fcn := s0_fcn
  sq_wport.is_cached := is_cached
  sq_wport.fu_op := s0_reg.fu_op
  sq_wport.wstrb := s0_wstrb
  sq_wport.len := s0_ls_len
  sq_wport.byte_sel := s0_byte_sel
  sq_wport.rob_idx := s0_reg.rob_idx


  // ******************** flush logic ********************
  when (s0_flush_valid && !io.in.fire()) { in_valid := N }
}
