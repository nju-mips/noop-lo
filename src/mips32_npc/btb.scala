package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

case class BHTParams(
  xprlen: Int = 32,
  pipelineDebug: Boolean = false,
  // BHT
  nBHTEntries: Int = 32,
  counterIndexWidth: Int = 5,
  counterWidth: Int = 2,
  historyLength: Int = 6,
  )

class BHTReq(param: BHTParams) extends Bundle
{
  val pc = Output(UInt(param.xprlen.W))
  val speculative_update = Output(Bool())
  override def cloneType = { new BHTReq(param).asInstanceOf[this.type] }
}

class BHTResp(param: BHTParams) extends Bundle
{
  val taken = Output(Bool())
  val history = Output(UInt((if (param.historyLength > 0) param.historyLength else 1).W))
  val counter_idx = Output(UInt(param.counterIndexWidth.W))
  val mispredict_cnt = Output(UInt(param.xprlen.W))
  override def cloneType = { new BHTResp(param).asInstanceOf[this.type] }
}

class BHTQuery(param: BHTParams) extends Bundle
{
  val req = new BHTReq(param)
  val resp = Flipped(new BHTResp(param))
  override def cloneType = { new BHTQuery(param).asInstanceOf[this.type] }
}

class BHTUpdate(param: BHTParams) extends Bundle
{
  // revert history
  val revert = Output(Bool())
  val original_history = Output(UInt((if (param.historyLength > 0) param.historyLength else 1).W))
  // update counters
  val taken = Output(Bool())
  val counter_idx = Output(UInt(param.counterIndexWidth.W))
  override def cloneType = { new BHTUpdate(param).asInstanceOf[this.type] }
}

class BHT(param: BHTParams) extends Module
{
  val io = IO(new Bundle {
    val query = Flipped(new BHTQuery(param))
    val update = Flipped(ValidIO(new BHTUpdate(param)))
  })

  require(isPow2(param.nBHTEntries))
  // we do branch prediction in stage 1
  val table = Mem(param.nBHTEntries, UInt(param.counterWidth.W))
  // global history register
  val history = Reg(UInt((if (param.historyLength > 0) param.historyLength else 1).W))


  val req = io.query.req

  val counter_idx = if (param.historyLength > 0) req.pc(param.xprlen - 1, 2) ^ history else req.pc(param.xprlen - 1, 2)
  val counter = table(counter_idx)
  val predict_taken = counter >= (1 << (param.counterWidth - 1)).U

  val mispredict_cnt = RegInit(0.asUInt(param.xprlen.W))

  val resp = io.query.resp
  resp.taken := predict_taken
  resp.history := history
  resp.counter_idx := counter_idx
  resp.mispredict_cnt := mispredict_cnt

  // update

  val update = io.update.bits
  val speculative_update = req.speculative_update
  val revert_update = io.update.valid && update.revert
  val speculative_history = Cat(history, predict_taken)
  val revert_history = Cat(update.original_history, update.taken)
  // update counters
  if (param.historyLength > 0) {
    when (speculative_update || revert_update) {
      history := Mux(revert_update, revert_history, speculative_history)
    }
  }
  when (io.update.valid) {
    val old_val = table(update.counter_idx)
    val new_val = Mux(update.taken,
      Mux(old_val =/= ((1 << param.counterWidth) - 1).U, old_val + 1.U, old_val),
      Mux(old_val =/= 0.U, old_val - 1.U, old_val))
    table(update.counter_idx) := new_val
  }

  when (revert_update) {
    mispredict_cnt := mispredict_cnt + 1.U
  }
}


class BTBReq(param: CoreParams) extends Bundle
{
  val pc = Output(UInt(param.xprlen.W))
  override def cloneType = { new BTBReq(param).asInstanceOf[this.type] }
}

class BTBResp(param: CoreParams) extends Bundle
{
  val hit = Output(Bool())
  val target = Output(UInt(param.xprlen.W))
  override def cloneType = { new BTBResp(param).asInstanceOf[this.type] }
}

class BTBQuery(param: CoreParams) extends Bundle
{
  val req = new BTBReq(param)
  val resp = Flipped(new BTBResp(param))
  override def cloneType = { new BTBQuery(param).asInstanceOf[this.type] }
}

class BTBUpdate(param: CoreParams) extends Bundle
{
  val pc = Output(UInt(param.xprlen.W))
  val target = Output(UInt(param.xprlen.W))
  override def cloneType = { new BTBUpdate(param).asInstanceOf[this.type] }
}

class BTB(param: CoreParams) extends Module
{
  val io = IO(new Bundle {
    val query = Flipped(new BTBQuery(param))
    val update = Flipped(ValidIO(new BTBUpdate(param)))
  })

  // BTB
  val nSets = param.btbNSets
  val nWays = param.btbNWays
  val tagBits = param.btbTagBits
  val targetBits = param.xprlen

  require(isPow2(nSets))
  require(isPow2(nWays))

  // btb contents
  val vb_array = Reg(init=Bits(0, nSets * nWays))
  val tag_array = Mem(nSets, Vec(nWays, UInt(width = tagBits.W)))
  val target_array = Mem(nSets, Vec(nWays, UInt(width = targetBits.W)))

  val indexBits = log2Ceil(nSets)
  val indexLSB = 2
  val indexMSB = indexLSB + indexBits - 1
  val tagLSB = indexMSB + 1
  val tagMSB = tagLSB + tagBits - 1

  val req = io.query.req
  val tag = req.pc(tagMSB, tagLSB)
  val idx = req.pc(indexMSB, indexLSB)

  val tag_rdata = tag_array(idx)
  def wayMap[T <: Data](f: Int => T) = Vec((0 until nWays).map(f))
  val tag_eq_way = wayMap((w: Int) => tag_rdata(w) === tag)
  val tag_match_way = wayMap((w: Int) => tag_eq_way(w) && vb_array(Cat(UInt(w), idx))).asUInt
  val hit = tag_match_way.orR
  val hit_way = Wire(Bits())
  hit_way := Bits(0)
  (0 until nWays).foreach(i => when (tag_match_way(i)) { hit_way := Bits(i) })

  val target_rdata = target_array(idx)
  val resp = io.query.resp
  resp.hit := hit
  resp.target := target_rdata(hit_way)

  // update
  val update = io.update.bits
  when (io.update.valid) {
    val tag = update.pc(tagMSB, tagLSB)
    val idx = update.pc(indexMSB, indexLSB)
    val tag_rdata = tag_array(idx)
    def wayMap[T <: Data](f: Int => T) = Vec((0 until nWays).map(f))
    val tag_eq_way = wayMap((w: Int) => tag_rdata(w) === tag)
    val tag_match_way = wayMap((w: Int) => tag_eq_way(w) && vb_array(Cat(UInt(w), idx))).asUInt
    val hit = tag_match_way.orR
    val hit_way = Wire(Bits())
    hit_way := Bits(0)
    (0 until nWays).foreach(i => when (tag_match_way(i)) { hit_way := Bits(i) })

    val lfsr = LFSR16(!hit)
    val repl_way = if(nWays == 1) UInt(0) else lfsr(log2Ceil(nWays) - 1, 0)

    val target_way = Mux(hit, hit_way, repl_way)
    target_array.write(idx, Vec.fill(nWays)(update.target), (0 until nWays).map(target_way === _.U))
    vb_array := vb_array.bitSet(Cat(target_way, idx), true.B)
    tag_array.write(idx, Vec.fill(nWays)(tag), (0 until nWays).map(target_way === _.U))
  }
}

class RASPeek(param: CoreParams) extends Bundle
{
  val top = Output(UInt(param.xprlen.W))
  val original_top = Output(UInt(log2Ceil(param.rasStackDepth).W))

  override def cloneType = { new RASPeek(param).asInstanceOf[this.type] }
}

class RASUpdate(param: CoreParams) extends Bundle
{
  val push = Output(Bool())
  val call_pc = Output(UInt(param.xprlen.W))
  val pop = Output(Bool())
  override def cloneType = { new RASUpdate(param).asInstanceOf[this.type] }
}

class RASRevert(param: CoreParams) extends Bundle
{
  val original_top = Output(UInt(log2Ceil(param.rasStackDepth).W))
  val push = Output(Bool())
  val call_pc = Output(UInt(param.xprlen.W))
  override def cloneType = { new RASRevert(param).asInstanceOf[this.type] }
}

class RAS(param: CoreParams) extends Module
{
  val io = IO(new Bundle {
    val peek = new RASPeek(param)
    val update = Flipped(ValidIO(new RASUpdate(param)))
    val revert = Flipped(ValidIO(new RASRevert(param)))
  })

  // BTB
  val depth = param.rasStackDepth
  val stack = Mem(depth, UInt(width = param.xprlen.W))
  val top = RegInit(0.asUInt(log2Ceil(depth).W))

  val peek = io.peek
  val update = io.update.bits
  val revert = io.revert.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.update.valid) {
        printf("time: %d [ras_update]: top: %d push: %d call_pc: %x pop: %d\n",
          GTimer(), top, update.push, update.call_pc, update.pop)
      }
      when (io.revert.valid) {
        printf("time: %d [ras_revert]: original_top: %d push: %d call_pc: %x\n",
          GTimer(), revert.original_top, revert.push, revert.call_pc)
      }
      /*
      printf("time: %d [ras_peek]: top: %d ret_pc: %x\n",
        GTimer(), top, peek.top)
        */
    }
  }

  // peek
  peek.top := stack(top)
  peek.original_top := top

  def inc(a: UInt) = Mux(a =/= (depth -1).U, a + 1.U, 0.U)
  def dec(a: UInt) = Mux(a =/= 0.U, a - 1.U, (depth -1).U)

  // update
  when (io.update.valid && !io.revert.valid) {
    Util.checkOneHot(Seq(update.push, update.pop))
    when (update.push) {
      val next_top = inc(top)
      top := next_top
    }
    when (update.pop) {
      val next_top = dec(top)
      top := next_top
    }
  }

  // revert
  when (io.revert.valid) {
    when (revert.push) {
      // deal with call misprediction
      val next_top = Mux(revert.original_top =/= (depth -1).U, revert.original_top + 1.U, 0.U)
      top := next_top
    } .otherwise {
      top := revert.original_top
    }
  }

  // update and revert share one write port
  val update_next_top = inc(top)
  val revert_next_top = inc(revert.original_top)
  val next_top = Mux(io.revert.valid, revert_next_top, update_next_top)
  when (io.update.valid || io.revert.valid) {
    stack(next_top) := Mux(io.revert.valid, revert.call_pc, update.call_pc)
  }
}
