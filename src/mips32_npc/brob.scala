package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

// a preliminary branch rob
// for now, it just takes care allocate/free branch ids 
class BROBAllocate(param: CoreParams) extends Bundle
{
  val valid = Output(Bool())
  val ready = Input(Bool())
  val branch_id = Input(UInt(log2Up(param.nBROBEntries).W))
  override def cloneType = { new BROBAllocate(param).asInstanceOf[this.type] }
}

class BranchRetire(param: CoreParams) extends Bundle
{
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  override def cloneType = { new BranchRetire(param).asInstanceOf[this.type] }
}

class BROB_IO(param: CoreParams) extends Bundle
{
  val allocate = Flipped(new BROBAllocate(param))
  val free = Flipped(ValidIO(new BranchRetire(param)))
  val flush = Flipped(ValidIO(new Flush(param)))
}

class BROB(param: CoreParams) extends Module
{
  val io = IO(new BROB_IO(param))

  val nBROBEntries = param.nBROBEntries
  require(isPow2(nBROBEntries))
  val brobIdxBits = log2Up(param.nBROBEntries)
  val head = RegInit(0.asUInt(brobIdxBits.W))
  val tail = RegInit(0.asUInt(brobIdxBits.W))

  def inc(a: UInt) = Mux(a >= (nBROBEntries - 1).U, 0.U, a + 1.U)
  def dec(a: UInt) = Mux(a === 0.U, (nBROBEntries - 1).U, a - 1.U)
  val empty = head === tail
  val full =  inc(head) === tail

  val flush_valid = io.flush.valid

  io.allocate.ready := !full 
  io.allocate.branch_id := tail
  when (io.allocate.valid && io.allocate.ready) {
    tail := dec(tail)
  }

  when (io.free.valid && !flush_valid) {
    head := dec(head)
  }
  
  when (flush_valid) {
    head := 0.U
    tail := 0.U
  }

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.allocate.valid && io.allocate.ready) {
        printf("time: %d [brob_allocate]: idx: %d\n",
          GTimer(), tail)
      }
      when (io.free.valid) {
        printf("time: %d [brob_free]: idx: %d\n",
          GTimer(), head)
      }
    }
  }
}
