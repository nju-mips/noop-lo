//**************************************************************************
// AXIIO
//--------------------------------------------------------------------------
//
// Zhigang Liu
// 2017 Sep 5

package Common

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

import Constants._
import Common._
import Common.Util._

// address channel signals
abstract class AXI4LiteChannelA extends Bundle
{
  val addr = Output(UInt(32.W))
  val prot = Output(UInt(3.W))
}

// write address channel signals
class AXI4LiteChannelAW extends AXI4LiteChannelA

// read address channel signals
class AXI4LiteChannelAR extends AXI4LiteChannelA

// write data channel signals
class AXI4LiteChannelW(data_width: Int) extends Bundle
{
  val data = Output(UInt(data_width.W))
  val strb = Output(UInt((data_width / 8).W))
  override def cloneType = { new AXI4LiteChannelW(data_width).asInstanceOf[this.type] }
}

// write response channel signals
class AXI4LiteChannelB extends Bundle
{
  val resp = Output(UInt(2.W))
}

// read data channel signals
class AXI4LiteChannelR(data_width: Int) extends Bundle
{
  val data = Output(UInt(data_width.W))
  val resp = Output(UInt(2.W))
  override def cloneType = { new AXI4LiteChannelR(data_width).asInstanceOf[this.type] }
}

class AXI4LiteIO(data_width: Int) extends Bundle
{
  val aw = DecoupledIO(new AXI4LiteChannelAW)
  val w = DecoupledIO(new AXI4LiteChannelW(data_width))
  val b = Flipped(DecoupledIO(new AXI4LiteChannelB))
  val ar = DecoupledIO(new AXI4LiteChannelAR)
  val r = Flipped(DecoupledIO(new AXI4LiteChannelR(data_width)))
  override def cloneType = { new AXI4LiteIO(data_width).asInstanceOf[this.type] }
}

// address channel signals
abstract class AXI4ChannelA(id_width: Int) extends Bundle
{
  val id = Output(UInt(id_width.W))
  val addr = Output(UInt(32.W))
  val len = Output(UInt(8.W))
  val size = Output(UInt(3.W))
  val burst = Output(UInt(2.W))
  val lock = Output(Bool())
  val cache = Output(UInt(4.W))
  val prot = Output(UInt(3.W))
  val region = Output(UInt(4.W))
  val qos = Output(UInt(4.W))
  val user = Output(UInt(5.W))
}

// write address channel signals
class AXI4ChannelAW(id_width: Int) extends AXI4ChannelA(id_width)
{
  def dump() = {
    printf("time %d: Channel AW id = %d addr = %x len = %d  size = %d burst = %x\n", GTimer(), id, addr, len, size, burst)
  }
  override def cloneType = { new AXI4ChannelAW(id_width).asInstanceOf[this.type] }
}

// read address channel signals
class AXI4ChannelAR(id_width: Int) extends AXI4ChannelA(id_width)
{
  def dump() = {
    printf("time %d: Channel AR id = %d addr = %x len = %d  size = %d burst = %x\n", GTimer(), id, addr, len, size, burst)
  }
  override def cloneType = { new AXI4ChannelAR(id_width).asInstanceOf[this.type] }
}

// write data channel signals
class AXI4ChannelW(id_width: Int, data_width: Int) extends Bundle
{
  // write data channel signals
  val id = Output(UInt(id_width.W))
  val data = Output(UInt(data_width.W))
  val strb = Output(UInt((data_width / 8).W))
  val last = Output(Bool())
  val user = Output(UInt(5.W))
  def dump() = {
    printf("time %d: Channel W id = %d data = %x wstrb = %x last = %d\n", GTimer(), id, data, strb, last)
  }
  override def cloneType = { new AXI4ChannelW(id_width, data_width).asInstanceOf[this.type] }
}

// write response channel signals
class AXI4ChannelB(id_width: Int) extends Bundle
{
  val id = Input(UInt(id_width.W))
  val resp = Input(UInt(2.W))
  val user = Output(UInt(5.W))
  def dump() = {
    printf("time %d: Channel B id = %d\n", GTimer(), id)
  }
  override def cloneType = { new AXI4ChannelB(id_width).asInstanceOf[this.type] }
}

// read data channel signals
class AXI4ChannelR(id_width: Int, data_width: Int) extends Bundle
{
  val id = Input(UInt(id_width.W))
  val data = Input(UInt(data_width.W))
  val resp = Input(UInt(2.W))
  val last = Input(Bool())
  val user = Output(UInt(5.W))
  def dump() = {
    printf("time %d: Channel R id = %d, last = %d, data = %x\n", GTimer(), id, last, data)
  }
  override def cloneType = { new AXI4ChannelR(id_width, data_width).asInstanceOf[this.type] }
}

class AXI4IO(id_width: Int, data_width: Int) extends Bundle
{
  val aw = DecoupledIO(new AXI4ChannelAW(id_width))
  val w = DecoupledIO(new AXI4ChannelW(id_width, data_width))
  val b = Flipped(DecoupledIO(new AXI4ChannelB(id_width)))
  val ar = DecoupledIO(new AXI4ChannelAR(id_width))
  val r = Flipped(DecoupledIO(new AXI4ChannelR(id_width, data_width)))

  def dump(s: String = "") = {
    aw match { case x => {
      when (x.fire()) {
        printf(s)
        x.bits.dump()
      }
    }}
    w match { case x => {
      when (x.fire()) {
        printf(s)
        x.bits.dump()
      }
    }}
    b match { case x => {
      when (x.fire()) {
        printf(s)
        x.bits.dump()
      }
    }}
    ar match { case x => {
      when (x.fire()) {
        printf(s)
        x.bits.dump()
      }
    }}
    r match { case x => {
      when (x.fire()) {
        printf(s)
        x.bits.dump()
      }
    }}
  }
  override def cloneType = { new AXI4IO(id_width, data_width).asInstanceOf[this.type] }
}
