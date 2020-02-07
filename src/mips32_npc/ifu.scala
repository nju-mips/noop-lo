package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class IFUPerfIO extends Bundle
{
  val backend_busy_cycles = Output(Bool())
  val frontend_stall_cycles = Output(Bool())
  val backend_stall_cycles = Output(Bool())
  val frontend_backend_stall_cycles = Output(Bool())
}

class BranchPredictionIO(param: CoreParams) extends Bundle
{
  val npc = Output(UInt(param.xprlen.W))
  override def cloneType = { new BranchPredictionIO(param).asInstanceOf[this.type] }
}

class DelayslotIO(param: CoreParams) extends Bundle
{
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  override def cloneType = { new DelayslotIO(param).asInstanceOf[this.type] }
}

class IFU_IO(param: CoreParams) extends Bundle
{
  val iaddr = new TLBTransaction(param)
  val imem = new MemPortIO(param.xprlen, param.xprlen)
  val instr = DecoupledIO(new IFU_IDU_INSTR(param))
  val flush = Flipped(ValidIO(new Flush(param)))
  val perf = new IFUPerfIO
  val bp = Flipped(ValidIO(new BranchPredictionIO(param)))
  val delayslot = Flipped(new DelayslotIO(param))
  val decode_pru_stall_frontend = Input(Bool())
  val decode_pru_stall_frontend_pc = Input(UInt(param.xprlen.W))
}

class IFU(param: CoreParams) extends Module
{
  val io = IO(new IFU_IO(param))

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bp.valid) {
        printf("time: %d [bp redirect]: npc: %x\n", GTimer(), io.bp.bits.npc)
      }

      when (io.flush.valid) {
        printf("time: %d [flush target]: npc: %x\n", GTimer(), io.flush.bits.npc)
      }

      when (io.decode_pru_stall_frontend) {
        printf("time: %d [pru_stall]: npc: %x\n", GTimer(), io.decode_pru_stall_frontend_pc)
      }
    }
  }

  val ifu_base = RegInit(0.U(param.xprlen.W))
  val flush = io.flush.bits

  // when flush arrives, delay slot instructions won't be in stage 0
  val s0_flush_valid = io.flush.valid

  // instruction fetch stage
  // reset or wbu flush will redirect pc
  val start_addr = "hbfc00000".U
  val pc_redirect = RegInit(Y)
  val pc_redirect_target = RegInit(start_addr)
  val next_pc = Wire(chiselTypeOf(pc_redirect_target))
  // if the previous instruction is fetched out, the predicted next pc is valid
  val next_pc_valid = Wire(Bool())
  val s1_stall = Wire(Bool())

  // IFU are seperated into two stages
  // ******************** stage 0 send req ********************
  // if the pc is redirected, we can directly fetch instruction at this pc
  // if not, we need to wait for the previous instruction to be fetched out and next_pc to be predicted
  val s0_valid = !s0_flush_valid && (pc_redirect || next_pc_valid) && !io.decode_pru_stall_frontend
  val s0_pc = Mux(pc_redirect, pc_redirect_target, next_pc)
  val s0_misaligned = s0_pc(1, 0) =/= 0.U
  val s0_misaligned_etw = Mux(s0_misaligned, ET_AdEL_IF, 0.U)
  val s0_etw = io.iaddr.resp.bits.etw | s0_misaligned_etw
  val s0_bad_if = s0_etw.orR

  // update ifu_base
  when(io.flush.valid && io.flush.bits.spr_valid) {
	ifu_base := io.flush.bits.seg_base
  }

  // tlb conversion
  io.iaddr.req.valid := s0_valid && !s0_misaligned
  io.iaddr.req.bits.fcn := M_XRD
  io.iaddr.req.bits.vaddr := s0_pc + ifu_base

  io.imem.req.valid := s0_valid && !s0_bad_if
  io.imem.req.bits.addr := io.iaddr.resp.bits.paddr
  // read word
  io.imem.req.bits.fcn := M_XRD
  io.imem.req.bits.len := ML_W
  // DontCare
  io.imem.req.bits.wstrb := 0.U
  io.imem.req.bits.data := 0.U
  io.imem.req.bits.s1_kill := io.decode_pru_stall_frontend
  io.imem.req.bits.is_cached := Y  // cache instr anyhow

  // ******************** stage 1 receive response ********************
  val s1_need_flush = Wire(Bool())

  val passdown = Wire(Bool())
  val s1_valid = RegEnable(next = s0_valid, init = N, enable = passdown)
  val s1_pc = RegEnable(next = s0_pc, enable = passdown)
  val s1_etw = RegEnable(next = s0_etw, enable = passdown)
  val s1_bad_if = RegEnable(next = s0_bad_if, init = N, enable = passdown)
  // if s0 is bad if, we can not directly pass it down, s1 may be in a icache miss
  passdown := (io.imem.req.fire() || (s0_valid && s0_bad_if)) && !s1_stall && !s1_need_flush
  val resp_stall = s1_valid && !s1_bad_if && !io.imem.resp.valid
  val idu_stall = io.instr.valid && !io.instr.ready
  s1_stall := resp_stall || idu_stall

  // when idu detects a pru instr
  // we stall frontend,
  // what's more, we kill the instr currently in icache s1 stage
  // thus making the icache idle
  // if the pru instr is icache control, it does not needs to wait for icache idle
  //
  // kill the instr in icache s1 may seems unnecessary
  // but consider this case:
  // pru instr waiting for icache idle -> backend busy -> decode not ready
  // -> imem resp not ready -> icache busy -> pru instr keeps waiting
  // this is cyclic dependency
  // to break the cycle, we kill the instrs after pru instr
  // and refetch them when pru instr commits
  when (io.decode_pru_stall_frontend) {
    s1_pc := io.decode_pru_stall_frontend_pc
    s1_valid := N
    s1_bad_if := N
  }

  val flush_pending = RegInit(N)
  val s1_is_delayslot = io.delayslot.is_delayslot
  val s1_branch_id = io.delayslot.branch_id
  val s1_flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, s1_is_delayslot, s1_branch_id)
  s1_need_flush := s1_flush_valid || flush_pending

  // when IFU s1 needs to be flushed, we set resp_ready high
  // so that we just receive the response and drop it
  io.imem.resp.ready := io.instr.ready || s1_need_flush

  val instr_valid = s1_valid && (s1_bad_if || io.imem.resp.valid) && !s1_need_flush
  io.instr.valid := instr_valid
  val instr = io.instr.bits
  instr.pc := s1_pc
  instr.instr := Mux(s1_bad_if, 0.U, io.imem.resp.bits.data)
  instr.etw := s1_etw

  // ******************** next pc logic ********************
  val branch_predicted = RegInit(N)
  val branch_predicted_npc = Reg(UInt(param.xprlen.W))
  val bp_valid = io.bp.valid
  val bp_npc = io.bp.bits.npc

  /*
  when (!reset.toBool) {
    assert(s1_is_delayslot || (!bp_valid && !branch_predicted), "Unexpected branch prediction!")
  }
  */

  // if delayslot instruction encounters cache miss
  // and at the same time branch prediction(in idu stage) decides to redirect the instrucion stream
  // we latched the branch prediction decison here for later use
  // if we encounters a flush when branch redirection has been made
  // make sure flush wins

  when (io.bp.valid && s1_valid && !io.imem.resp.valid && !s1_need_flush) {
    branch_predicted := Y
    branch_predicted_npc := bp_npc
  }

  next_pc_valid := !s1_stall

  next_pc := Mux(bp_valid, bp_npc,
    Mux(branch_predicted, branch_predicted_npc, s1_pc + 4.U))

  // when req fired, we know that branch prediction has taken effect
  // clear it
  when (io.imem.req.fire() || s1_need_flush) {
    branch_predicted := N
  }

  // when we have sent out the fetch req
  // we clear pc_redirect to prevent sending the same fetch req for multiple times
  // when flush_valid is high, passdown is low
  // so this will not conflict with flush
  when (pc_redirect && passdown) {
    pc_redirect := N
  }

  // ******************** flush logic ********************
  // for now, L1 ICache does not support kill previous reqs
  // if we receive a flush when a L1 ICache req is still inflight
  // we wait until it finishes and do a delayed_flush
  when (s1_valid && !s1_bad_if && !io.imem.resp.valid && s1_flush_valid) {
    flush_pending := Y
  }

  // stage 1 not flushed
  val no_flush_clear_s1 = io.instr.fire() && !passdown
  val flush_clear_s1 = s1_valid && (s1_bad_if || io.imem.resp.fire()) && s1_need_flush && !passdown
  when (no_flush_clear_s1 || flush_clear_s1) {
    s1_valid := N
    s1_bad_if := N
    flush_pending := N
  }

  when (s0_flush_valid) {
    pc_redirect_target := flush.npc
    pc_redirect := Y
  }

  // ******************** perf logic ********************
  io.perf.backend_busy_cycles := !io.imem.resp.ready
  io.perf.frontend_stall_cycles := !io.imem.resp.valid && io.imem.resp.ready
  io.perf.backend_stall_cycles := io.imem.resp.valid && !io.imem.resp.ready
  io.perf.frontend_backend_stall_cycles := !io.imem.resp.valid && !io.imem.resp.ready
}
