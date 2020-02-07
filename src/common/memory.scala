//**************************************************************************
// MemPortIO
//--------------------------------------------------------------------------
//
// Zhigang Liu
// 2017 Sep 14

package Common

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

import Constants._
import Common._
import Common.Util._
import NPC.CoreParams

object VAddr {
  class VAddrImpl(addr:UInt) {
    // force 32bits vaddr
    require(addr.getWidth == 32)

    def getSegId = addr(31, 29)

    // 0x80000000 - 0x9FFFFFFF   unmapped cached
    // 0xA0000000 - 0xBFFFFFFF   unmapped uncached:  MMIO
    def isUnmapped = getSegId === "b101".U || getSegId === "b100".U 
    def isUncached = getSegId === "b101".U
    def isUserMapped = addr(31) === 0.U
    def isMMIO = isUncached

    def isCached = !isUncached
    def isMapped = !isUnmapped

    def getSegmentOffset = addr(28, 0)

    def toPhsical = Mux(isUnmapped, Cat("b000".U, getSegmentOffset), addr)
  }

  def apply(addr:UInt) = new VAddrImpl(addr)
}

trait MemoryOpConstants 
{
  // for MemPortIO
  // fcn
  val M_X   = "b0".asUInt(1.W)
  val M_XRD = "b0".asUInt(1.W) // int load
  val M_XWR = "b1".asUInt(1.W) // int store


  val CACHECONTROL_X                        = "b000".asUInt(3.W)
  val CACHECONTROL_INVALIDATE_INDEX         = "b001".asUInt(3.W)
  val CACHECONTROL_HIT_INVALIDATE           = "b100".asUInt(3.W)
  val CACHECONTROL_HIT_WRITEBACK_INVALIDATE = "b101".asUInt(3.W)

  val ML_B = "b00".asUInt(2.W)
  val ML_H = "b01".asUInt(2.W)
  val ML_W = "b11".asUInt(2.W)

  val DPORT = 0
  val IPORT = 1
}

// ============================== MemPortIO ==============================

class MemPortIO(addr_width:Int, data_width: Int) extends Bundle 
{
  val req    = new DecoupledIO(new MemReq(addr_width, data_width))
  val resp   = Flipped(new DecoupledIO(new MemResp(data_width)))
  override def cloneType = { new MemPortIO(addr_width, data_width).asInstanceOf[this.type] }
  def dump(s: String = "") = {
    req match { case x => {
      when (x.fire()) {
        printf("time: %d ", GTimer())
        printf(s)
        printf(": ")
        x.bits.dump()
      }
      when (x.bits.s1_kill) {
        printf("time: %d ", GTimer())
        printf(s)
        printf(": s1_kill\n")
      }
    }}
    resp match { case x => {
      when (x.fire()) {
        printf("time: %d ", GTimer())
        printf(s)
        printf(": ")
        x.bits.dump()
      }
    }}
  }
}

class MemReq(addr_width:Int, data_width: Int) extends Bundle
{
  val addr = Output(UInt(addr_width.W))
  val data = Output(UInt(data_width.W))
  val fcn  = Output(UInt(M_X.getWidth.W))  // memory function code
  val wstrb = Output(UInt((data_width / 8).W))
  // 0: 1byte, 1:2bytes, 2:3bytes, 3:4bytes
  val len = Output(UInt(log2Ceil(data_width / 8).W))
  val is_cached = Output(Bool())
  val s1_kill = Output(Bool())
  def dump() = {
    printf("MemReq ")
    when (fcn === M_XRD) {
      printf("Read addr = %x\n", addr)
    }
    when (fcn === M_XWR) {
      printf("Write addr = %x wstrb = %x data = %x\n", addr, wstrb, data)
    }
  }
  override def cloneType = { new MemReq(addr_width, data_width).asInstanceOf[this.type] }
}

class MemResp(data_width: Int) extends Bundle
{
  val data = Output(UInt(data_width.W))
  def dump() = {
    printf("MemResp data = %x\n", data)
  }
  override def cloneType = { new MemResp(data_width).asInstanceOf[this.type] }
}

class CacheControlPortIO(addr_width:Int, data_width: Int) extends Bundle
{
  val req    = new DecoupledIO(new CacheControlReq(addr_width, data_width))
  val resp   = Flipped(new DecoupledIO(new CacheControlResp(data_width)))
  override def cloneType = { new CacheControlPortIO(addr_width, data_width).asInstanceOf[this.type] }
  def dump(s: String = "") = {
    req match { case x => {
      when (x.fire()) {
        printf("time: %d ", GTimer())
        printf(s)
        printf(": ")
        x.bits.dump()
      }
    }}
    resp match { case x => {
      when (x.fire()) {
        printf("time: %d ", GTimer())
        printf(s)
        printf(": ")
        x.bits.dump()
      }
    }}
  }
}

class CacheControlReq(addr_width:Int, data_width: Int) extends Bundle
{
  val addr = Output(UInt(addr_width.W))
  val data = Output(UInt(data_width.W))
  val fcn  = Output(UInt(CACHECONTROL_INVALIDATE_INDEX.getWidth.W))
  def dump() = {
    printf("CacheControlReq ")
    when (fcn === CACHECONTROL_INVALIDATE_INDEX) {
      printf("Invalidate index addr = %x\n", addr)
    } .elsewhen (fcn === CACHECONTROL_HIT_INVALIDATE) {
      printf("Hit Invalidate addr = %x\n", addr)
    } .elsewhen (fcn === CACHECONTROL_HIT_WRITEBACK_INVALIDATE) {
      printf("Hit WriteBack Invalidate addr = %x\n", addr)
    }
  }
  override def cloneType = { new CacheControlReq(addr_width, data_width).asInstanceOf[this.type] }
}

class CacheControlResp(data_width: Int) extends Bundle
{
  val data = Output(UInt(data_width.W))
  def dump() = {
    printf("CacheControlResp data = %x\n", data)
  }
  override def cloneType = { new CacheControlResp(data_width).asInstanceOf[this.type] }
}

// a Naive Memport Crossbar
class MemCrossbar(param: CoreParams, addr_width:Int, data_width: Int) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new MemPortIO(addr_width, data_width))
    val out = Vec(3, new MemPortIO(addr_width, data_width))
  })

  // memory mapping
  val w = addr_width
  val PerfCounterStart = "h1fe95000".U(w.W)
  val PerfCounterEnd = PerfCounterStart + 0x1000.U

  val addr = io.in.req.bits.addr
  val req_valid = io.in.req.valid

  val to_perf = {
    if(param.usePerfCounter) {
      PerfCounterStart <= addr && addr <= PerfCounterEnd
    } else {
      false.B
    }
  }

  val to_dcache = io.in.req.bits.is_cached
  val to_mmio = !to_dcache && !to_perf

  val to_0 = req_valid && to_dcache
  val to_1 = req_valid && to_mmio
  val to_2 = req_valid && to_perf

  // make sure all reqs(even invalid ones) has a resp
  // all reqs should not be silently dropped
  // core's logic depends on this
  val to_errror_slave = io.in.req.fire() && !to_0 && !to_1 && !to_2
  val error_slave_resp_valid = RegNext(next = to_errror_slave, init = false.B)

  // ready can wait for valid
  io.in.req.ready := io.out(0).req.ready && io.out(1).req.ready && io.out(2).req.ready
  io.in.resp.valid := io.out(0).resp.valid || io.out(1).resp.valid || io.out(2).resp.valid || error_slave_resp_valid

  // check for on hot
  checkOneHot(Seq(to_0, to_1, to_2))
  checkOneHot(Seq(io.out(0).resp.valid, io.out(1).resp.valid, io.out(2).resp.valid))

  io.in.resp.bits.data := Mux1H(Array(
    io.out(0).resp.valid -> io.out(0).resp.bits.data,
    io.out(1).resp.valid -> io.out(1).resp.bits.data,
    io.out(2).resp.valid -> io.out(2).resp.bits.data
  ))

  io.out(0).req.valid := to_0 && io.out(1).req.ready && io.out(2).req.ready
  io.out(1).req.valid := to_1 && io.out(0).req.ready && io.out(2).req.ready
  io.out(2).req.valid := to_2 && io.out(0).req.ready && io.out(1).req.ready

  io.out(0).req.bits := io.in.req.bits
  io.out(1).req.bits := io.in.req.bits
  io.out(2).req.bits := io.in.req.bits

  io.out(0).resp.ready := io.in.resp.ready
  io.out(1).resp.ready := io.in.resp.ready
  io.out(2).resp.ready := io.in.resp.ready
}

// memory with AXI interface
class SimAXIMem extends BlackBox {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val reset = Input(Bool())
    val axi = Flipped(new AXI4IO(id_width=5, data_width=64))
  })
}

class Device extends BlackBox {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val reset = Input(Bool())
    val in = Flipped(new MemPortIO(addr_width = 32, data_width = 32))
  })
}

class MultiplierIO extends Bundle {
  val a = Output(UInt(33.W))
  val b = Output(UInt(33.W))
  val dout = Input(UInt(66.W))
}

class Multiplier extends BlackBox {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val data = Flipped(new MultiplierIO)
  })
}

class DividerIO extends Bundle {
  val diviend = DecoupledIO(Output(UInt(40.W)))
  val divisor = DecoupledIO(Output(UInt(40.W)))
  val dout = Flipped(ValidIO(Output(UInt(80.W))))
}

class Divider extends BlackBox {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val data = Flipped(new DividerIO)
  })
}
