package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class IQ_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(DecoupledIO(new IDU_ISU_DECODE(param)))
  val out = DecoupledIO(new IDU_ISU_DECODE(param))
  val flush = Flipped(ValidIO(new Flush(param)))
}

class IQ(param: CoreParams) extends Module
{
  val io = IO(new IQ_IO(param))

  if (param.pipelineDebug) {
    val in = io.in.bits
    val bp_info = in.bp_info
    when (io.in.fire()) {
      printf("time: %d [idu_iq]: pc: %x is_delayslot: %d branch_id: %d fu_type: %d fu_op: %d rs: %d rt: %d rd: %d a_src: %d b_src: %d rd_sel: %d predicted_taken: %d predicted_target: %x\n",
        GTimer(), in.pc, in.is_delayslot, in.branch_id, in.fu_type, in.fu_op, in.rs, in.rt, in.rd, in.a_src, in.b_src, in.rd_sel,
        bp_info.predicted_taken, bp_info.predicted_target)
    }
  }

  val nIQEntries = param.nIQEntries
  require(isPow2(nIQEntries))
  val iqIdxBits = log2Up(param.nIQEntries)
  val head = RegInit(0.asUInt(iqIdxBits.W))
  val tail = RegInit(0.asUInt(iqIdxBits.W))
  val iq = Mem(nIQEntries, new IDU_ISU_DECODE(param))
  val iq_valid = RegInit(Vec.fill(nIQEntries)(N))

  def inc(a: UInt) = Mux(a >= (nIQEntries - 1).U, 0.U, a + 1.U)
  def dec(a: UInt) = Mux(a === 0.U, (nIQEntries - 1).U, a - 1.U)
  val empty = head === tail
  val full =  inc(head) === tail

  io.in.ready := !full 
  when (io.in.fire()) {
    tail := dec(tail)
    iq(tail) := io.in.bits
    iq_valid(tail) := Y
  }

  val flush = io.flush.bits
  val head_flushed = check_flush(io.flush.valid, flush.kind, flush.branch_id, iq(head).is_delayslot, iq(head).branch_id)
  io.out.valid := !empty && iq_valid(head) && !head_flushed
  io.out.bits := iq(head)
  // walk out non-empty and invalid entries
  when (io.out.fire() || (!empty && !iq_valid(head))) {
    head := dec(head)
    iq_valid(head) := N
  }
  
  when (io.flush.valid) {
    // non conditional flush is not frequent
    // conditional flush(caused by branch misprediction is frequent)
    for (i <- 0 until nIQEntries) {
      val entry = iq(i)
      val do_flush = check_flush(io.flush.valid, flush.kind, flush.branch_id, entry.is_delayslot, entry.branch_id)
      when (iq_valid(i) && do_flush) {
        iq_valid(i) := N
      }
    }
  }
}
