package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class ROBEntry(param: CoreParams) extends Bundle
{
  // result ready, ready to be retired
  val ready = Output(Bool())
  val fu_type = Output(chiselTypeOf(FU_TYPE_X))

  // ALU
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  // BRU
  val target = Output(UInt(param.xprlen.W))
  val is_taken = Output(Bool())
  val bp_info = new BPInfo(param)

  // MDU
  val hi = Output(UInt(param.xprlen.W))
  val hi_wen = Output(Bool())
  val lo = Output(UInt(param.xprlen.W))
  val lo_wen = Output(Bool())

  // LSU
  val badvaddr = Output(UInt(param.xprlen.W))
  val lsq_idx = Output(UInt(log2Up(param.nLSQEntries).W))
  val is_load = Output(Bool())
  val speculative = Output(Bool())

  override def cloneType = { new ROBEntry(param).asInstanceOf[this.type] }
}

class ROBAllocatePort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nROBEntries))
  // resp
  val valid = Output(Bool())
  val ready = Input(Bool())
  val empty = Input(Bool())
  val idx = Input(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new ROBAllocatePort(param).asInstanceOf[this.type] }
}

class ROBRPort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nROBEntries))
  // req
  val idx = Output(UInt(log2Up(param.nROBEntries).W))
  // resp
  val entry = Flipped(new ROBEntry(param))
  override def cloneType = { new ROBRPort(param).asInstanceOf[this.type] }
}

class ROBWPort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nROBEntries))
  // req
  val idx = Output(UInt(log2Up(param.nROBEntries).W))
  // resp
  val entry = new ROBEntry(param)
  override def cloneType = { new ROBWPort(param).asInstanceOf[this.type] }
}

class ROBCommitPort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nROBEntries))
  // req
  val idx = Output(UInt(log2Up(param.nROBEntries).W))
  // resp
  val entry = new ROBEntry(param)
  override def cloneType = { new ROBCommitPort(param).asInstanceOf[this.type] }
}

class ROB_IO(param: CoreParams) extends Bundle
{
  val allocate = Flipped(new ROBAllocatePort(param))
  val commit = DecoupledIO(new ROBCommitPort(param))
  val free_rob_head = Input(Bool())

  val alu_wport = Flipped(ValidIO(new ROBWPort(param)))
  val bru_wport = Flipped(ValidIO(new ROBWPort(param)))
  val mdu_wport = Flipped(ValidIO(new ROBWPort(param)))
  val lsu_wport = Flipped(ValidIO(new ROBWPort(param)))
  val pru_wport = Flipped(ValidIO(new ROBWPort(param)))
  val lsq_wport = Flipped(ValidIO(new ROBWPort(param)))
  val rports = Vec(2, Flipped(new ROBRPort(param)))
  val lsq_rport = Flipped(new ROBRPort(param))
  val flush = Flipped(ValidIO(new Flush(param)))
}

class ROB(param: CoreParams) extends Module
{
  val io = IO(new ROB_IO(param))

  val nROBEntries = param.nROBEntries
  val robIdxBits = log2Up(param.nROBEntries)
  val head = RegInit(0.asUInt(robIdxBits.W))
  val commit_head = RegInit(0.asUInt(robIdxBits.W))
  val tail = RegInit(0.asUInt(robIdxBits.W))
  val rob = Reg(Vec(nROBEntries, new ROBEntry(param)))
  when (reset.toBool) {
    for (i <- 0 until nROBEntries) { rob(i).ready := false.B }
  }

  def inc(a: UInt) = Mux(a >= (nROBEntries - 1).U, 0.U, a + 1.U)
  def dec(a: UInt) = Mux(a === 0.U, (nROBEntries - 1).U, a - 1.U)
  val empty = head === tail
  val full = inc(head) === tail

  val flush_valid = io.flush.valid

  val allocate = io.allocate
  allocate.ready := !full && !flush_valid
  allocate.idx := tail
  allocate.empty := empty
  when (allocate.valid && allocate.ready) {
    tail := dec(tail)
    rob(tail).ready := false.B
  }

  // on commit, pass this entry to wbu, but do not free it
  // subsequent instructions may still read it
  io.commit.valid := commit_head =/= tail && rob(commit_head).ready
  io.commit.bits.idx := commit_head
  io.commit.bits.entry := rob(commit_head)
  when (io.commit.fire() && !flush_valid) {
    commit_head := dec(commit_head)
  }

  when (io.free_rob_head && !flush_valid) {
    head := dec(head)
    rob(head).ready := false.B
  }

  val alu_wport = io.alu_wport.bits
  when (io.alu_wport.valid) {
    rob(alu_wport.idx) := alu_wport.entry
  }

  val bru_wport = io.bru_wport.bits
  when (io.bru_wport.valid) {
    rob(bru_wport.idx) := bru_wport.entry
  }

  val mdu_wport = io.mdu_wport.bits
  when (io.mdu_wport.valid) {
    rob(mdu_wport.idx) := mdu_wport.entry
  }

  val lsu_wport = io.lsu_wport.bits
  when (io.lsu_wport.valid) {
    rob(lsu_wport.idx) := lsu_wport.entry
  }

  val pru_wport = io.pru_wport.bits
  when (io.pru_wport.valid) {
    rob(pru_wport.idx) := pru_wport.entry
  }

  val lsq_wport = io.lsq_wport.bits
  when (io.lsq_wport.valid) {
    rob(lsq_wport.idx) := lsq_wport.entry
  }

  for (i <- 0 until 2) {
    val rport = io.rports(i)
    rport.entry := rob(rport.idx)
  }

  val lsq_rport = io.lsq_rport
  lsq_rport.entry := rob(lsq_rport.idx)

  when (flush_valid) {
    head := 0.U
    commit_head := 0.U
    tail := 0.U
    for (i <- 0 until nROBEntries) { rob(i).ready := false.B }
  }

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      // read port
      // write ports
      val alu_entry = alu_wport.entry
      when (io.alu_wport.valid) {
        printf("time: %d [alu_rob]: idx: %x ready: %x pc: %x etw: %x rd: %d rd_wen: %d val: %x \n",
          GTimer(), alu_wport.idx, alu_entry.ready, alu_entry.pc, alu_entry.etw, alu_entry.rd, alu_entry.rd_wen, alu_entry.value)
      }

      val mdu_entry = mdu_wport.entry
      when (io.mdu_wport.valid) {
        printf("time: %d [mdu_rob]: idx: %x ready: %x pc: %x etw: %x rd: %d rd_wen: %d val: %x hi_wen: %d hi: %x lo_wen: %d lo: %x\n",
          GTimer(), mdu_wport.idx, mdu_entry.ready, mdu_entry.pc, mdu_entry.etw, mdu_entry.rd, mdu_entry.rd_wen, mdu_entry.value, mdu_entry.hi_wen, mdu_entry.hi, mdu_entry.lo_wen, mdu_entry.lo)
      }

      val lsu_entry = lsu_wport.entry
      when (io.lsu_wport.valid) {
        printf("time: %d [lsu_rob]: idx: %x ready: %x pc: %x etw: %x rd: %d rd_wen: %d val: %x\n",
          GTimer(), lsu_wport.idx, lsu_entry.ready, lsu_entry.pc, lsu_entry.etw, lsu_entry.rd, lsu_entry.rd_wen, lsu_entry.value)
      }

      val bru_entry = bru_wport.entry
      val bp_info = bru_entry.bp_info
      when (io.bru_wport.valid) {
        printf("time: %d [bru_rob]: idx: %x ready: %x pc: %x etw: %x is_taken: %d target: %x rd_wen: %d rd: %d val: %x predicted_taken: %d predicted_target: %x\n",
          GTimer(), bru_wport.idx, bru_entry.ready, bru_entry.pc, bru_entry.etw, bru_entry.is_taken, bru_entry.target, bru_entry.rd_wen, bru_entry.rd, bru_entry.value, bp_info.predicted_taken, bp_info.predicted_target)
      }

      val pru_entry = pru_wport.entry
      when (io.pru_wport.valid) {
        printf("time: %d [pru_rob]: idx: %x ready: %x pc: %x etw: %x rd: %d rd_wen: %d val: %x \n",
          GTimer(), pru_wport.idx, pru_entry.ready, pru_entry.pc, pru_entry.etw, pru_entry.rd, pru_entry.rd_wen, pru_entry.value)
      }

      val lsq_entry = lsq_wport.entry
      when (io.lsq_wport.valid) {
        printf("time: %d [lsq_rob]: idx: %x ready: %x pc: %x etw: %x rd: %d rd_wen: %d val: %x \n",
          GTimer(), lsq_wport.idx, lsq_entry.ready, lsq_entry.pc, lsq_entry.etw, lsq_entry.rd, lsq_entry.rd_wen, lsq_entry.value)
      }
    }
  }
}
