//**************************************************************************
// RISCV Processor Utility Functions
//--------------------------------------------------------------------------

package Common

import chisel3._
import chisel3.util._
import scala.math._
import scala.collection.mutable.ArrayBuffer

object Util
{
  def wordStrb(ov: UInt, nv: UInt, bwen: UInt): UInt = {
    // old value byte 0/1/2/3
    val ov0 = ov(7, 0)
    val ov1 = ov(15, 8)
    val ov2 = ov(23, 16)
    val ov3 = ov(31, 24)
    // new value byte 0/1/2/3
    val nv0 = nv(7, 0)
    val nv1 = nv(15, 8)
    val nv2 = nv(23, 16)
    val nv3 = nv(31, 24)

    val new_ov = Cat(Mux(bwen(3), nv3, ov3),
      Cat(Mux(bwen(2), nv2, ov2),
        Cat(Mux(bwen(1), nv1, ov1),
          Mux(bwen(0), nv0, ov0))))
    new_ov
  }

  def checkOneHot(in: Seq[Bool]): Unit = {
    val value = Vec(in).asUInt
    val length = in.length
    def bitMap[T <: Data](f: Int => T) = Vec((0 until length).map(f))
    val bitOneHot = bitMap((w: Int) => value === (1 << w).asUInt(length.W)).asUInt
    val oneHot = bitOneHot.orR
    val noneHot = value === 0.U
    assert(oneHot || noneHot)
  }

  // a and b must be both hot or none hot
  def bothHotOrNoneHot(a: Bool, b: Bool, str: String): Unit = {
    val cond = (a === b)
    assert(cond, str)
  }

  implicit def intToUInt(x: Int): UInt = x.U
  implicit def intToBoolean(x: Int): Boolean = if (x != 0) true else false
  implicit def booleanToInt(x: Boolean): Int = if (x) 1 else 0
  implicit def booleanToBool(x: Boolean): Bool = Bool(x)
  implicit def sextToConv(x: UInt) = new AnyRef {
    def sextTo(n: Int): UInt = Cat(Fill(n - x.getWidth, x(x.getWidth-1)), x)
  }

  implicit def wcToUInt(c: WideCounter): UInt = c.value
  implicit class UIntIsOneOf(val x: UInt) extends AnyVal {
    def isOneOf(s: Seq[UInt]): Bool = s.map(x === _).reduce(_||_)
  
    def isOneOf(u1: UInt, u2: UInt*): Bool = isOneOf(u1 +: u2.toSeq)
  }

  implicit class UIntToAugmentedUInt(val x: UInt) extends AnyVal {
    def sextTo(n: Int): UInt = {
      require(x.getWidth <= n)
      if (x.getWidth == n) x
      else Cat(Fill(n - x.getWidth, x(x.getWidth-1)), x)
    }

    def padTo(n: Int): UInt = {
      require(x.getWidth <= n)
      if (x.getWidth == n) x
      else Cat(UInt(0, n - x.getWidth), x)
    }

    def extract(hi: Int, lo: Int): UInt = {
      if (hi == lo-1) UInt(0)
      else x(hi, lo)
    }

    def inRange(base: UInt, bounds: UInt) = x >= base && x < bounds
  }
}

 
//do two masks have at least 1 bit match?
object maskMatch
{
   def apply(msk1: UInt, msk2: UInt): Bool =
   {
      val br_match = (msk1 & msk2) != 0.U
      return br_match
   }
}
   
//clear one-bit in the Mask as specified by the idx
object clearMaskBit
{
   def apply(msk: UInt, idx: UInt): UInt =
   {
      return (msk & ~(1.U << idx))(msk.getWidth-1, 0)
   }
}
  
//shift a register over by one bit
object PerformShiftRegister
{
   def apply(reg_val: Bits, new_bit: Bool): Bits =
   {
      reg_val := Cat(reg_val(reg_val.getWidth-1, 0).toBits, new_bit.toBits).toBits
      reg_val
   }
}

object Split
{
  // is there a better way to do do this?
  def apply(x: Bits, n0: Int) = {
    val w = checkWidth(x, n0)
    (x(w-1,n0), x(n0-1,0))
  }
  def apply(x: Bits, n1: Int, n0: Int) = {
    val w = checkWidth(x, n1, n0)
    (x(w-1,n1), x(n1-1,n0), x(n0-1,0))
  }
  def apply(x: Bits, n2: Int, n1: Int, n0: Int) = {
    val w = checkWidth(x, n2, n1, n0)
    (x(w-1,n2), x(n2-1,n1), x(n1-1,n0), x(n0-1,0))
  }

  private def checkWidth(x: Bits, n: Int*) = {
    val w = x.getWidth
    def decreasing(x: Seq[Int]): Boolean =
      if (x.tail.isEmpty) true
      else x.head > x.tail.head && decreasing(x.tail)
    require(decreasing(w :: n.toList))
    w
  }
}
 

// a counter that clock gates most of its MSBs using the LSB carry-out
case class WideCounter(width: Int, inc: UInt = 1.U, reset: Boolean = true)
{
  private val isWide = width > 2*inc.getWidth
  private val smallWidth = if (isWide) inc.getWidth max log2Ceil(width) else width
  private val small = if (reset) Reg(init=0.asUInt(smallWidth.W)) else Reg(UInt(smallWidth.W))
  private val nextSmall = small +& inc
  small := nextSmall

  private val large = if (isWide) {
    val r = if (reset) Reg(init=0.asUInt((width - smallWidth).W)) else Reg(UInt((width - smallWidth).W))
    when (nextSmall(smallWidth)) { r := r + 1.U }
    r
  } else null

  val value = if (isWide) Cat(large, small) else small
  lazy val carryOut = {
    val lo = (small ^ nextSmall) >> 1
    if (!isWide) lo else {
      val hi = Mux(nextSmall(smallWidth), large ^ (large +& 1.U), 0.U) >> 1
      Cat(hi, lo)
    }
  }

  def := (x: UInt) = {
    small := x
    if (isWide) large := x >> smallWidth
  }
}

// taken from rocket FPU
object RegEn
{
   def apply[T <: Data](data: T, en: Bool) = 
   {
      val r = Reg(data)
      when (en) { r := data }
      r
   }
   def apply[T <: Bits](data: T, en: Bool, resetVal: T) = 
   {
      val r = RegInit(resetVal)
      when (en) { r := data }
      r
   }
}
 
object Str
{
  def apply(s: String): UInt = {
    var i = BigInt(0)
    require(s.forall(validChar _))
    for (c <- s)
      i = (i << 8) | c
    i.asUInt((s.length*8).W)
  }
  def apply(x: Char): Bits = {
    require(validChar(x))
    val lit = x.asUInt(8.W)
    lit
  }
  def apply(x: UInt): Bits = apply(x, 10)
  def apply(x: UInt, radix: Int): Bits = {
    val rad = radix.U
    val digs = digits(radix)
    val w = x.getWidth
    require(w > 0)

    var q = x
    var s = digs(q % rad)
    for (i <- 1 until ceil(log(2)/log(radix)*w).toInt) {
      q = q / rad
      s = Cat(Mux(Bool(radix == 10) && q === 0.U, Str(' '), digs(q % rad)), s)
    }
    s
  }
  def apply(x: SInt): Bits = apply(x, 10)
  def apply(x: SInt, radix: Int): Bits = {
    val neg = x < 0.S
    val abs = Mux(neg, -x, x).toUInt
    if (radix != 10) {
      Cat(Mux(neg, Str('-'), Str(' ')), Str(abs, radix))
    } else {
      val rad = UInt(radix)
      val digs = digits(radix)
      val w = abs.getWidth
      require(w > 0)

      var q = abs
      var s = digs(q % rad)
      var needSign = neg
      for (i <- 1 until ceil(log(2)/log(radix)*w).toInt) {
        q = q / rad
        val placeSpace = q === 0.U
        val space = Mux(needSign, Str('-'), Str(' '))
        needSign = needSign && !placeSpace
        s = Cat(Mux(placeSpace, space, digs(q % rad)), s)
      }
      Cat(Mux(needSign, Str('-'), Str(' ')), s)
    }
  }

  def bigIntToString(x: BigInt): String = {
    val s = new StringBuilder
    var b = x
    while (b != 0) {
      s += (x & 0xFF).toChar
      b = b >> 8
    }
    s.toString
  }

  private def digit(d: Int): Char = (if (d < 10) '0'+d else 'a'-10+d).toChar
  private def digits(radix: Int): Vec[Bits] =
    Vec((0 until radix).map(i => Str(digit(i))))

  private def validChar(x: Char) = x == (x & 0xFF)
}

class LatencyPipe[T <: Data](typ: T, latency: Int) extends Module {
  val io = IO(new Bundle {
    val in = Decoupled(chiselTypeOf(typ)).flip
    val out = Decoupled(chiselTypeOf(typ))
  })

  def doN[T](n: Int, func: T => T, in: T): T =
    (0 until n).foldLeft(in)((last, _) => func(last))

  io.out <> doN(latency, (last: DecoupledIO[T]) => Queue(last, 1, pipe=true), io.in)
}

object LatencyPipe {
  def apply[T <: Data](in: DecoupledIO[T], latency: Int): DecoupledIO[T] = {
    val pipe = Module(new LatencyPipe(in.bits, latency))
    pipe.io.in <> in
    pipe.io.out
  }
}

object CountLeadingZeros32 {
  def apply(in: UInt):UInt = {
    val out = Wire(Vec(5, Bool()))

    out(4) := in(31, 16) === 0.U(16.W)

    val val16 = Mux(out(4), in(15, 0), in(31, 16))
    out(3) := val16(15, 8) === 0.U(8.W)

    val val8  = Mux(out(3), val16(7, 0), val16(15, 8))
    out(2) := val8(7, 4) === 0.U(4.W)

    val val4  = Mux(out(2), val8(3, 0), val8(7, 4))
    out(1) := val4(3, 2) === 0.U(2.W)

    out(0) := Mux(out(1), ~val4(1), ~val4(3))

    Mux(in === 0.U, 32.U, out.asUInt)
  }
}

object Tie {
  class TieImpl(data:Bits*) {
    def :=(in:Bits) {
      var total:Int = (for(d <- data) yield d.getWidth).reduce(_ + _);
      assert(total <= in.getWidth);
      for(d <- data) {
        d := in(total - 1, total - d.getWidth);
        total = total - d.getWidth;
      }
    }
  }
  def apply(data:Bits*) = new TieImpl(data:_*);
}

object ExtOperation {
  implicit class BitsExtTo[T<:Bits](in:T) {
    def ZExt(n:Int):UInt = {
      assert(n >= in.getWidth);
      Cat(Fill(n - in.getWidth, 0.U(1.W)), in);
    }

    def SExt(n:Int):UInt = {
      assert(n >= in.getWidth);
      Cat(Fill(n - in.getWidth, in.head(1)), in);
    }
  }
}

