//**************************************************************************
// AXI4 beat splitter
//--------------------------------------------------------------------------
//
// Zhigang Liu
// 2018 Sep 2

package Common

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

import Constants._
import Common._
import Common.Util._

case class AXIBeatSpliterParams(
  innerIdWidth: Int = 4,
  innerAXI4DataWidth: Int = 64,
  debug: Boolean = false)

// ============================== DCache ==============================
class AXIBeatSpliter(param: L2CacheParams) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new AXI4IO(param.innerIdWidth, param.innerAXI4DataWidth))
    val out = new AXI4IO(param.innerIdWidth, param.innerAXI4DataWidth)
  })

  require(param.innerAXI4DataWidth == 32 || param.innerAXI4DataWidth == 64 || param.innerAXI4DataWidth == 128)

  val Y = true.B
  val N = false.B

  val blockSize = 64 * 8
  val blockBytes = blockSize / 8
  val innerBeatSize = param.innerAXI4DataWidth
  val innerBeatBytes = innerBeatSize / 8
  val innerDataBeats = blockSize / innerBeatSize
  val innerBeatBits = log2Ceil(innerBeatBytes)
  val innerBeatIndexBits = log2Ceil(innerDataBeats)

  val blockOffsetBits = log2Ceil(blockBytes)
  val offsetLSB = 0
  val offsetMSB = blockOffsetBits - 1

  val s_idle :: s_gather_write_data :: s_send_bresp :: s_get_random_beat :: s_wait_ram_awready :: s_do_ram_write :: s_wait_ram_bresp :: s_wait_ram_arready :: s_do_ram_read :: s_wait_remaining_beat :: s_data_resp :: Nil = Enum(UInt(), 11)

  val state = Reg(init = s_idle)

  val in = io.in
  val in_ar = in.ar.bits
  val in_aw = in.aw.bits
  val in_r = in.r.bits
  val in_w = in.w.bits
  val in_b = in.b.bits

  val out = io.out
  val out_ar = out.ar.bits
  val out_aw = out.aw.bits
  val out_r = out.r.bits
  val out_w = out.w.bits
  val out_b = out.b.bits

  val addr = Reg(UInt(32.W))
  val id = Reg(UInt(param.innerIdWidth.W))
  val ren = RegInit(N)
  val wen = RegInit(N)

  val beat_read = Reg(UInt(32.W))
  val beat_written = Reg(UInt(32.W))

  val next_state = Reg(UInt(32.W))
  val random_beat = Reg(UInt(32.W))

  // state transitions:
  // s_idle: idle state
  // capture requests
  checkOneHot(Seq(io.in.ar.fire(), io.in.aw.fire(), io.in.r.fire(), io.in.w.fire(), io.in.b.fire()))
  when (state === s_idle) {
    when (io.in.ar.fire) {
      ren := Y
      wen := N
      addr := in_ar.addr
      id := in_ar.id
      state := s_get_random_beat
      next_state := s_wait_ram_arready
      beat_read := 0.U
    } .elsewhen (io.in.aw.fire) {
      ren := N
      wen := Y
      addr := in_aw.addr
      id := in_aw.id
      state := s_gather_write_data
      beat_written := 0.U
    } .elsewhen (io.in.r.fire() || io.in.w.fire() || io.in.b.fire()) {
      assert(N, "Inner axi Unexpected handshake")
    }
  }
  in.ar.ready := state === s_idle
  // fox axi, ready can depend on valid
  // deal with do not let ar, aw fire at the same time
  in.aw.ready := state === s_idle && !io.in.ar.valid

  // s_gather_write_data:
  // gather write data
  val data_buf = Reg(Vec(innerDataBeats, UInt(innerBeatSize.W)))
  val (gather_cnt, gather_done) = Counter(io.in.w.fire() && state === s_gather_write_data, innerDataBeats)
  io.in.w.ready := state === s_gather_write_data
  when (state === s_gather_write_data) {
    when (io.in.w.fire()) {
      data_buf(gather_cnt) := in_w.data
      bothHotOrNoneHot(gather_done, in_w.last, "gather beat error")
    }
    when (gather_done) { state := s_send_bresp }
  }

  // s_send_bresp:
  // send bresp, end write transaction
  io.in.b.valid := state === s_send_bresp
  in_b.id := id
  in_b.resp := 0.asUInt(2.W)
  in_b.user := 0.asUInt(5.W)

  when (state === s_send_bresp && io.in.b.fire()) {
    state := s_get_random_beat
    next_state := s_wait_ram_awready
  }

  val lfsr = LFSR16(state === s_get_random_beat)
  when (state === s_get_random_beat) {
    // +1 in case random_beat becomes zero
    random_beat := Cat(Fill(29, 0.U), lfsr(2, 0)) + 1.U
    state := next_state
  }


  // outer axi interface
  // external memory bus width is 32/64/128bits
  // so each memport read/write is mapped into a whole axi bus width read/write
  val axi4_size = log2Up(param.outerAXI4DataWidth / 8).U
  val mem_addr = Cat(addr(31, blockOffsetBits), 0.asUInt(blockOffsetBits.W))

  // #########################################################
  // #                  write back path                      #
  // #########################################################
  // s_wait_ram_awready
  val beat_to_write = Mux(beat_written + random_beat <= innerDataBeats.U,
    random_beat, innerDataBeats.U - beat_written)
  val wb_cnt = RegInit(0.asUInt(32.W))
  val beat_remaining = (beat_written + beat_to_write) < innerDataBeats.U
  when (state === s_wait_ram_awready && out.aw.fire()) {
    wb_cnt := 0.U
    state := s_do_ram_write
  }

  val last_wb_beat = wb_cnt === beat_to_write - 1.U
  when (state === s_do_ram_write) {
    when (out.w.fire()) {
      wb_cnt := wb_cnt + 1.U
      when (out_w.last) { state := s_wait_ram_bresp }
    }
  }

  // write address channel signals
  val write_addr = Cat(addr(31, blockOffsetBits),
    beat_written(innerBeatIndexBits - 1, 0),
    Fill(innerBeatBits, 0.U))
  out_aw.id := 0.asUInt(param.outerIdWidth.W)
  out_aw.addr := write_addr
  out_aw.len := beat_to_write - 1.U
  out_aw.size := axi4_size
  out_aw.burst := "b01".U       // normal sequential memory
  out_aw.lock := 0.asUInt(1.W)
  out_aw.cache := "b1111".U
  out_aw.prot := 0.asUInt(3.W)
  out_aw.region := 0.asUInt(4.W)
  out_aw.qos := 0.asUInt(4.W)
  out_aw.user := 0.asUInt(5.W)
  out.aw.valid := state === s_wait_ram_awready

  // write data channel signals
  out_w.id := 0.asUInt(param.outerIdWidth.W)
  out_w.data := data_buf(beat_written + wb_cnt)
  out_w.strb := Fill(innerBeatBytes, 1.U)
  out_w.last := last_wb_beat
  out_w.user := 0.asUInt(5.W)
  out.w.valid := state === s_do_ram_write

  when (state === s_wait_ram_bresp && io.out.b.fire()) {
    beat_written := beat_written + beat_to_write
    when (beat_remaining) {
      state := s_get_random_beat
      next_state := s_wait_ram_awready
    } .otherwise {
      state := s_idle
    }
  }

  // write response channel signals
  out.b.ready := state === s_wait_ram_bresp

  // #####################################################
  // #                  refill path                      #
  // #####################################################
  val beat_to_read = Mux(beat_read + random_beat <= innerDataBeats.U,
    random_beat, innerDataBeats.U - beat_read)

  val read_cnt = RegInit(0.asUInt(32.W))
  val read_beat_remaining = (beat_read + beat_to_read) < innerDataBeats.U
  when (state === s_wait_ram_arready && out.ar.fire()) {
    read_cnt := 0.U
    state := s_do_ram_read
  }

  // write address channel signals
  val read_addr = Cat(addr(31, blockOffsetBits),
    beat_read(innerBeatIndexBits - 1, 0),
    Fill(innerBeatBits, 0.U))
  out_ar.id := 0.asUInt(param.outerIdWidth.W)
  out_ar.addr := read_addr
  out_ar.len := beat_to_read - 1.U
  out_ar.size := axi4_size
  out_ar.burst := "b01".U       // normal sequential memory
  out_ar.lock := 0.asUInt(1.W)
  out_ar.cache := "b1111".U
  out_ar.prot := 0.asUInt(3.W)
  out_ar.region := 0.asUInt(4.W)
  out_ar.qos := 0.asUInt(4.W)
  out_ar.user := 0.asUInt(5.W)
  out.ar.valid := state === s_wait_ram_arready

  val last_read_beat = read_cnt === beat_to_read - 1.U
  when (state === s_do_ram_read) {
    when (out.r.fire()) {
      data_buf(beat_read + read_cnt) := out_r.data
      read_cnt := read_cnt + 1.U
      bothHotOrNoneHot(last_read_beat, out_r.last, "read beat error")
      when (out_r.last) { state := s_wait_remaining_beat }
    }
  }

  // read data channel signals
  out.r.ready := state === s_do_ram_read

  when (state === s_wait_remaining_beat) {
    beat_read := beat_read + beat_to_read
    when (read_beat_remaining) {
      state := s_get_random_beat
      next_state := s_wait_ram_arready
    } .otherwise {
      state := s_data_resp
    }
  }


  // ########################################################
  // #                  data resp path                      #
  // ########################################################
  val (resp_cnt, resp_done) = Counter(io.in.r.fire() && state === s_data_resp, innerDataBeats)
  when (state === s_data_resp && resp_done) {
    state := s_idle
  }
  in_r.id := id
  in_r.data := data_buf(resp_cnt)
  in_r.resp := 0.asUInt(2.W)
  in_r.last := resp_done
  in_r.user := 0.asUInt(5.W)
  io.in.r.valid := state === s_data_resp
}
