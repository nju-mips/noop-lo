//**************************************************************************
// L2 Cache
//--------------------------------------------------------------------------
//
// Zhigang Liu
// 2018 Aug 15

package Common

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

import Constants._
import Common._
import Common.Util._

case class L2CacheParams(
  nSets: Int = 32,
  nWays: Int = 16,
  addrWidth: Int = 32,
  innerIdWidth: Int = 4,
  innerAXI4DataWidth: Int = 64,
  outerIdWidth: Int = 4,
  outerAXI4DataWidth: Int = 64,
  debug: Boolean = false)

// ============================== DCache ==============================
class SimpleL2(param: L2CacheParams) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new AXI4IO(param.innerIdWidth, param.innerAXI4DataWidth))
    val out = new AXI4IO(param.outerIdWidth, param.outerAXI4DataWidth)
  })

  require(isPow2(param.nSets))
  require(isPow2(param.nWays))
  require(param.outerAXI4DataWidth == 32 || param.outerAXI4DataWidth == 64 || param.outerAXI4DataWidth == 128)

  val Y = true.B
  val N = false.B

  val blockSize = 64 * 8
  val blockBytes = blockSize / 8
  val innerBeatSize = param.innerAXI4DataWidth
  val innerBeatBytes = innerBeatSize / 8
  val innerDataBeats = blockSize / innerBeatSize
  val innerBeatBits = log2Ceil(innerBeatBytes)
  val innerBeatIndexBits = log2Ceil(innerDataBeats)
  val innerBeatLSB = innerBeatBits
  val innerBeatMSB = innerBeatLSB + innerBeatIndexBits - 1

  val outerBeatSize = param.outerAXI4DataWidth
  val outerBeatBytes = outerBeatSize / 8
  val outerDataBeats = blockSize / outerBeatSize

  // to keep L1 miss & L2 hit penalty small, inner axi bus width should be as large as possible
  // on loongson and zedboard, outer axi bus width are usually 32bit
  // so we require that innerBeatSize to be multiples of outerBeatSize
  val split = innerBeatSize / outerBeatSize
  val splitBits = log2Ceil(split)
  require(isPow2(split))

  val indexBits = log2Ceil(param.nSets)
  val blockOffsetBits = log2Ceil(blockBytes)
  val tagBits = param.addrWidth - indexBits - blockOffsetBits
  val offsetLSB = 0
  val offsetMSB = blockOffsetBits - 1
  val indexLSB = offsetMSB + 1
  val indexMSB = indexLSB + indexBits - 1
  val tagLSB = indexMSB + 1
  val tagMSB = tagLSB + tagBits - 1

  val rst_cnt = RegInit(0.asUInt(log2Up(2 * param.nSets + 1).W))
  val rst = (rst_cnt < 2 * param.nSets.U) && !reset.toBool

  val s_idle :: s_gather_write_data :: s_send_bresp :: s_update_meta :: s_tag_read :: s_merge_put_data :: s_data_read :: s_data_write :: s_wait_ram_awready :: s_do_ram_write :: s_wait_ram_bresp :: s_wait_ram_arready :: s_do_ram_read :: s_data_resp :: Nil = Enum(UInt(), 14)

  val state = Reg(init = s_idle)

  // state transitions for each case
  // read hit: s_idle -> s_tag_read -> s_data_read -> s_data_resp -> s_idle
  // read miss no writeback : s_idle -> s_tag_read -> s_wait_ram_arready -> s_do_ram_read -> s_data_write -> s_update_meta -> s_idle
  // read miss writeback : s_idle -> s_tag_read -> s_data_read -> s_wait_ram_awready -> s_do_ram_write -> s_wait_ram_bresp
  //                              -> s_wait_ram_arready -> s_do_ram_read -> s_data_write -> s_update_meta -> s_idle
  // write hit: s_idle -> s_gather_write_data ->  s_send_bresp -> s_tag_read -> s_data_read -> s_merge_put_data -> s_data_write -> s_update_meta -> s_idle
  // write miss no writeback : s_idle -> s_gather_write_data ->  s_send_bresp -> s_tag_read -> s_wait_ram_arready -> s_do_ram_read
  //                                  -> s_merge_put_data -> s_data_write -> s_update_meta -> s_idle
  // write miss writeback : s_idle -> s_gather_write_data ->  s_send_bresp -> s_tag_read -> s_data_read -> s_wait_ram_awready -> s_do_ram_write -> s_wait_ram_bresp
  //                               -> s_wait_ram_arready -> s_do_ram_read -> s_merge_put_data -> s_data_write -> s_update_meta -> s_idle

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
  val inner_end_beat = Reg(UInt(4.W))
  val ren = RegInit(N)
  val wen = RegInit(N)

  val gather_curr_beat = RegInit(0.asUInt(log2Ceil(innerDataBeats).W))
  val gather_last_beat = gather_curr_beat === inner_end_beat
  val merge_curr_beat = RegInit(0.asUInt(log2Ceil(innerDataBeats).W))
  val merge_last_beat = merge_curr_beat === inner_end_beat
  val resp_curr_beat = RegInit(0.asUInt(log2Ceil(innerDataBeats).W))
  val resp_last_beat = resp_curr_beat === inner_end_beat

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

      val start_beat = in_ar.addr(innerBeatMSB, innerBeatLSB)
      gather_curr_beat := start_beat
      merge_curr_beat := start_beat
      resp_curr_beat := start_beat
      inner_end_beat := start_beat + in_ar.len

      state := s_tag_read
    } .elsewhen (io.in.aw.fire) {
      ren := N
      wen := Y
      addr := in_aw.addr
      id := in_aw.id

      val start_beat = in_aw.addr(innerBeatMSB, innerBeatLSB)
      gather_curr_beat := start_beat
      merge_curr_beat := start_beat
      resp_curr_beat := start_beat
      inner_end_beat := start_beat + in_aw.len

      state := s_gather_write_data
    } .elsewhen (io.in.r.fire() || io.in.w.fire() || io.in.b.fire()) {
      assert(N, "Inner axi Unexpected handshake")
    }
  }
  in.ar.ready := state === s_idle && !rst
  // fox axi, ready can depend on valid
  // deal with do not let ar, aw fire at the same time
  in.aw.ready := state === s_idle && !io.in.ar.valid && !rst

  // s_gather_write_data:
  // gather write data
  val put_data_buf = Reg(Vec(outerDataBeats, UInt(outerBeatSize.W)))
  val put_data_mask = Reg(init=Vec.fill(outerDataBeats)(Fill(outerBeatBytes, 0.U)))
  io.in.w.ready := state === s_gather_write_data
  when (state === s_gather_write_data && io.in.w.fire()) {
    gather_curr_beat := gather_curr_beat + 1.U
    for (i <- 0 until split) {
      put_data_buf((gather_curr_beat << splitBits) + i.U) := in_w.data(outerBeatSize * (i + 1) - 1, outerBeatSize * i)
      put_data_mask((gather_curr_beat << splitBits) + i.U) := in_w.strb(outerBeatBytes * (i + 1) - 1, outerBeatBytes * i)
    }
    when (gather_last_beat) {
      state := s_send_bresp
    }
    bothHotOrNoneHot(gather_last_beat, in_w.last, "L2 gather beat error")
  }

  // s_send_bresp:
  // send bresp, end write transaction
  io.in.b.valid := state === s_send_bresp
  in_b.id := id
  in_b.resp := 0.asUInt(2.W)
  in_b.user := 0.asUInt(5.W)

  when (state === s_send_bresp && io.in.b.fire()) {
    state := s_tag_read
  }

  // s_tag_read: inspecting meta data
  // valid bit array
  val vb_array = SeqMem(param.nSets, Bits(width = param.nWays.W))
  val vb_array_wen = Wire(Bool())
  // dirty bit array
  val db_array = SeqMem(param.nSets, Bits(width = param.nWays.W))
  val db_array_wen = Wire(Bool())

  val tag_array = SeqMem(param.nSets, Vec(param.nWays, UInt(width = tagBits.W)))
  val tag_raddr = Mux(io.in.ar.fire(), in_ar.addr, addr)
  val tag_wen = Wire(Bool())
  val tag_ridx = tag_raddr(indexMSB, indexLSB)

  val vb_rdata = vb_array.read(tag_ridx, !vb_array_wen)
  val db_rdata = db_array.read(tag_ridx, !db_array_wen)
  val tag_rdata = tag_array.read(tag_ridx, !tag_wen)

  val idx = addr(indexMSB, indexLSB)
  val tag = addr(tagMSB, tagLSB)

  def wayMap[T <: Data](f: Int => T) = Vec((0 until param.nWays).map(f))
  val tag_eq_way = wayMap((w: Int) => tag_rdata(w) === tag)
  val tag_match_way = wayMap((w: Int) => tag_eq_way(w) && vb_rdata(UInt(w))).asUInt
  val hit = tag_match_way.orR
  val read_hit = hit && ren
  val write_hit = hit && wen
  val read_miss = !hit && ren
  val write_miss = !hit && wen
  val hit_way = Wire(Bits())
  hit_way := Bits(0)
  (0 until param.nWays).foreach(i => when (tag_match_way(i)) { hit_way := Bits(i) })

  // use random replacement
  val lfsr = LFSR16(state === s_update_meta && !hit)
  val repl_way_enable = (state === s_idle && io.in.ar.fire()) || (state === s_send_bresp && io.in.b.fire())
  val repl_way = RegEnable(next = if(param.nWays == 1) UInt(0) else lfsr(log2Ceil(param.nWays) - 1, 0),
    init = 0.U, enable = repl_way_enable)

  // valid and dirty
  val need_writeback = vb_rdata(repl_way) && db_rdata(repl_way)
  val writeback_tag = tag_rdata(repl_way)
  val writeback_addr = Cat(writeback_tag, Cat(idx, 0.U(blockOffsetBits.W)))

  val read_miss_writeback = read_miss && need_writeback
  val read_miss_no_writeback = read_miss && !need_writeback
  val write_miss_writeback = write_miss && need_writeback
  val write_miss_no_writeback = write_miss && !need_writeback

  val need_data_read = read_hit || write_hit || read_miss_writeback || write_miss_writeback

  when (state === s_tag_read) {
    if (param.debug) {
      when (ren) {
        printf("time: %d [L2] read addr: %x idx: %d tag: %x hit: %d ",
          GTimer(), addr, idx, tag, hit)
      }
      when (wen) {
        printf("time: %d [L2] write addr: %x idx: %d tag: %x hit: %d ",
          GTimer(), addr, idx, tag, hit)
      }
      when (hit) {
        printf("hit_way: %d\n", hit_way)
      } .elsewhen (need_writeback) {
        printf("repl_way: %d wb_addr: %x\n", repl_way, writeback_addr)
      } .otherwise {
        printf("repl_way: %d\n", repl_way)
      }
    }

    // check for cross cache line bursts
    assert(inner_end_beat < innerDataBeats.U, "cross cache line bursts detected")

    when (read_hit || write_hit || read_miss_writeback || write_miss_writeback) {
      state := s_data_read
    } .elsewhen (read_miss_no_writeback || write_miss_no_writeback) {
      // no need to write back, directly refill data
      state := s_wait_ram_arready
    } .otherwise {
      assert(N, "Unexpected condition in s_tag_read")
    }
  }

  // ###############################################################
  // #                  data array read/write                      #
  // ###############################################################
  val data_read_way = Mux(read_hit || write_hit, hit_way, repl_way)
  // incase it overflows
  val data_read_cnt = RegInit(0.asUInt((log2Ceil(innerDataBeats) + 1).W))
  val data_read_valid = (state === s_tag_read && need_data_read) || (state === s_data_read && data_read_cnt =/= innerDataBeats.U)
  val data_read_idx = idx << log2Ceil(innerDataBeats) | data_read_cnt
  val dout = Wire(Vec(split, UInt(outerBeatSize.W)))

  val data_write_way = Mux(write_hit, hit_way, repl_way)
  val data_write_cnt = Wire(UInt())
  val data_write_valid = state === s_data_write
  val data_write_idx = idx << log2Ceil(innerDataBeats) | data_write_cnt
  val din = Wire(Vec(split, UInt(outerBeatSize.W)))

  val data_arrays = Seq.fill(split) { SeqMem(param.nSets * innerDataBeats, Vec(param.nWays, UInt(width = outerBeatSize.W))) }
  for ((data_array, i) <- data_arrays zipWithIndex) {
    when (data_write_valid) {
      if (param.debug) {
        printf("time: %d [L2 Cache] write data array: %d idx: %d way: %d data: %x\n",
          GTimer(), i.U, data_write_idx, data_write_way, din(i))
      }
      data_array.write(data_write_idx, Vec.fill(param.nWays)(din(i)), (0 until param.nWays).map(data_write_way === _))
    }
    dout(i) := data_array.read(data_read_idx, data_read_valid)(data_read_way)
    if (param.debug) {
      when (RegNext(data_read_valid, N)) {
        printf("time: %d [L2 Cache] read data array: %d idx: %d way: %d data: %x\n",
          GTimer(), i.U, RegNext(data_read_idx), RegNext(data_read_way), dout(i))
      }
    }
  }

  // s_data_read
  // read miss or need write back
  val data_buf = Reg(Vec(outerDataBeats, UInt(outerBeatSize.W)))
  when (data_read_valid) {
    data_read_cnt := data_read_cnt + 1.U
  }
  when (state === s_data_read) {
    for (i <- 0 until split) {
      data_buf(((data_read_cnt - 1.U) << splitBits) + i.U) := dout(i)
    }
    when (data_read_cnt === innerDataBeats.U) {
      data_read_cnt := 0.U
      when (read_hit) {
        state := s_data_resp
      } .elsewhen (read_miss_writeback || write_miss_writeback) {
        state := s_wait_ram_awready
      } .elsewhen (write_hit) {
        state := s_merge_put_data
      } .otherwise {
        assert(N, "Unexpected condition in s_data_read")
      }
    }
  }

  // s_merge_put_data
  // s_merge_put_data: merge data_buf and put_data_buf, and store the final result in data_buf
  // the old data(either read from data array or from refill) resides in data_buf
  // the new data(gathered from inner write) resides in put_data_buf
  def mergePutData(old_data: UInt, new_data: UInt, wmask: UInt): UInt = {
    val full_wmask = FillInterleaved(8, wmask)
    ((~full_wmask & old_data) | (full_wmask & new_data))
  }

  when (state === s_merge_put_data) {
    merge_curr_beat := merge_curr_beat + 1.U
    for (i <- 0 until split) {
      val idx = (merge_curr_beat << splitBits) + i.U
      data_buf(idx) := mergePutData(data_buf(idx), put_data_buf(idx), put_data_mask(idx))
    }
    when (merge_last_beat) {
      state := s_data_write
    }
  }

  // s_data_write
  val (write_cnt, write_done) = Counter(state === s_data_write, innerDataBeats)
  data_write_cnt := write_cnt
  for (i <- 0 until split) {
    val idx = (data_write_cnt << splitBits) + i.U
    din(i) := data_buf(idx)
  }
  when (state === s_data_write && write_done) {
    state := s_update_meta
  }

  // s_update_meta
  val way = Mux(write_hit, hit_way, repl_way)

  vb_array_wen := rst || state === s_update_meta
  val vb_array_widx = Mux(rst, rst_cnt, idx)
  val vb_array_wdata = Mux(rst, Bits(0, param.nWays), vb_rdata.bitSet(way, true.B))

  when (vb_array_wen) {
    when (rst) { rst_cnt := rst_cnt + 1.U }
    vb_array.write(vb_array_widx, vb_array_wdata)
  }

  db_array_wen := rst || state === s_update_meta
  val db_array_widx = Mux(rst, rst_cnt, idx)
  val db_array_wdata = Mux(rst, Bits(0, param.nWays), db_rdata.bitSet(way, wen))
  when (db_array_wen) {
    db_array.write(db_array_widx, db_array_wdata)
  }

  tag_wen := state === s_update_meta
  when (state === s_update_meta) {
    // refill done
    when (ren) {
      state := s_data_resp
    } .otherwise {
      state := s_idle
    }
    val way = Mux(write_hit, hit_way, repl_way)
    when (!hit) {
      if (param.debug) {
        printf("update_tag: idx: %d tag: %x repl_way: %d\n", idx, tag, repl_way)
      }
      tag_array.write(idx, Vec.fill(param.nWays)(tag), Seq.tabulate(param.nWays)(repl_way === _))
    }
  }

  // outer axi interface
  // external memory bus width is 32/64/128bits
  // so each memport read/write is mapped into a whole axi bus width read/write
  val axi4_size = log2Up(param.outerAXI4DataWidth / 8).U
  val mem_addr = Cat(addr(tagMSB, indexLSB), 0.asUInt(blockOffsetBits.W))

  // #########################################################
  // #                  write back path                      #
  // #########################################################
  // s_wait_ram_awready
  when (state === s_wait_ram_awready && out.aw.fire()) {
    state := s_do_ram_write
  }

  val (wb_cnt, wb_done) = Counter(io.out.w.fire() && state === s_do_ram_write, outerDataBeats)
  when (state === s_do_ram_write && wb_done) {
    state := s_wait_ram_bresp
  }
  when (!reset.toBool && io.out.w.fire()) {
    bothHotOrNoneHot(wb_done, out_w.last, "L2 write back error")
  }

  // write address channel signals
  out_aw.id := 0.asUInt(param.outerIdWidth.W)
  out_aw.addr := writeback_addr
  out_aw.len := (outerDataBeats - 1).asUInt(8.W)
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
  out_w.data := data_buf(wb_cnt)
  out_w.strb := Fill(outerBeatBytes, 1.asUInt(1.W))
  out_w.last := wb_cnt === (outerDataBeats - 1).U
  out_w.user := 0.asUInt(5.W)
  out.w.valid := state === s_do_ram_write

  when (state === s_wait_ram_bresp && io.out.b.fire()) {
    when (read_miss_writeback || write_miss_writeback) {
      // do refill
      state := s_wait_ram_arready
    } .otherwise {
      assert(N, "Unexpected condition in s_wait_ram_bresp")
    }
  }

  // write response channel signals
  out.b.ready := state === s_wait_ram_bresp

  // #####################################################
  // #                  refill path                      #
  // #####################################################
  when (state === s_wait_ram_arready && out.ar.fire()) {
    state := s_do_ram_read
  }
  val (refill_cnt, refill_done) = Counter(io.out.r.fire() && state === s_do_ram_read, outerDataBeats)
  when (state === s_do_ram_read && io.out.r.fire()) {
    data_buf(refill_cnt) := out_r.data
    when (refill_done) {
      when (ren) {
        state := s_data_write
      } .otherwise {
        state := s_merge_put_data
      }
    }
    bothHotOrNoneHot(refill_done, out_r.last, "L2 refill error")
  }

  // read address channel signals
  out_ar.id := 0.asUInt(param.outerIdWidth.W)
  out_ar.addr := mem_addr
  out_ar.len := (outerDataBeats - 1).asUInt(8.W)
  out_ar.size := axi4_size
  out_ar.burst := "b01".U // normal sequential memory
  out_ar.lock := 0.asUInt(1.W)
  out_ar.cache := "b1111".U
  out_ar.prot := 0.asUInt(3.W)
  out_ar.region := 0.asUInt(4.W)
  out_ar.qos := 0.asUInt(4.W)
  out_ar.user := 0.asUInt(5.W)
  out.ar.valid := state === s_wait_ram_arready

  // read data channel signals
  out.r.ready := state === s_do_ram_read


  // ########################################################
  // #                  data resp path                      #
  // ########################################################

  when (state === s_data_resp && io.in.r.fire()) {
    resp_curr_beat := resp_curr_beat + 1.U
    when (resp_last_beat) {
      state := s_idle
    }
  }

  val resp_data = Wire(Vec(split, UInt(outerBeatSize.W)))
  for (i <- 0 until split) {
    resp_data(i) := data_buf((resp_curr_beat << splitBits) + i.U)
  }
  in_r.id := id
  in_r.data := resp_data.asUInt
  in_r.resp := 0.asUInt(2.W)
  in_r.last := resp_last_beat
  in_r.user := 0.asUInt(5.W)
  io.in.r.valid := state === s_data_resp
}
