package Common

import chisel3._
import chisel3.util._

object GTimer {
  def apply(): UInt = {
    val (t, c) = Counter(Bool(true), 0x7fffffff)
    t
  }
}

object TraceTrigger {
  def apply(): Bool = {
    val (t, c) = Counter(Bool(true), 0x7fffffff)
    t >= (922149 - 40).U
  }
}
