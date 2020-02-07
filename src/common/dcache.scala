//**************************************************************************
// L1 I/DCache
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

class DCachePerfIO extends Bundle
{
  val access = Output(Bool())
  val miss = Output(Bool())
}

class DCacheILA(param: L1CacheParams) extends Bundle {
  val overall_hash = Output(UInt(param.dataWidth.W))
  val req_hash = Output(UInt(param.dataWidth.W))
  val resp_hash = Output(UInt(param.dataWidth.W))
  val data_hash = Output(UInt(param.dataWidth.W))
  val tag_hash = Output(UInt(param.dataWidth.W))
  val vb_hash = Output(UInt(param.dataWidth.W))
  val db_hash = Output(UInt(param.dataWidth.W))
  override def cloneType = { new DCacheILA(param).asInstanceOf[this.type] }
}

// ============================== DCache ==============================
class DCache(param: L1CacheParams) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new MemPortIO(param.addrWidth, param.dataWidth))
    val control = Flipped(new CacheControlPortIO(param.addrWidth, param.dataWidth))
    val out = new AXI4IO(param.idWidth, param.axi4DataWidth)
    val perf = new DCachePerfIO
    val ila_debug = new DCacheILA(param)
  })

  require(isPow2(param.nSets))
  require(isPow2(param.nWays))
  require(param.axi4DataWidth == 32 || param.axi4DataWidth == 64 || param.axi4DataWidth == 128)
  val beatSize = param.axi4DataWidth
  val beatBytes = beatSize / 8
  val blockSize = 64 * 8
  val blockBytes = blockSize / 8
  val refillCycles = blockSize / beatSize
  val wordBits = param.dataWidth
  val wordBytes = wordBits / 8
  val wordPerBlock = blockSize / wordBits
  val indexBits = log2Ceil(param.nSets)
  val wayBits = log2Ceil(param.nWays)
  val blockOffsetBits = log2Ceil(blockBytes)
  val tagBits = param.addrWidth - indexBits - blockOffsetBits
  val wordLSB = 0
  val wordMSB = log2Ceil(wordBytes) - 1
  val offsetLSB = 0
  val offsetMSB = blockOffsetBits - 1
  val indexLSB = offsetMSB + 1
  val indexMSB = indexLSB + indexBits - 1
  val tagLSB = indexMSB + 1
  val tagMSB = tagLSB + tagBits - 1
  val wayLSB = indexMSB + 1
  val wayMSB = wayLSB + wayBits - 1

  val s0_valid = io.in.req.fire() || io.control.req.fire()
  val s0_control = io.control.req.valid
  // access/control port addr
  val s0_addr = Mux(s0_control, io.control.req.bits.addr, io.in.req.bits.addr)
  // access port
  val s0_ren = io.in.req.bits.fcn === M_XRD
  val s0_wen = io.in.req.bits.fcn === M_XWR
  val s0_wstrb = io.in.req.bits.wstrb
  val s0_wdata = io.in.req.bits.data
  val s0_control_data = io.control.req.bits.data
  val s0_control_fcn = io.control.req.bits.fcn

  val s1_stall = Wire(Bool())
  val s1_addr = RegEnable(next = s0_addr, enable = s0_valid)
  val s1_ren = RegEnable(next = s0_ren, enable = s0_valid)
  val s1_wen = RegEnable(next = s0_wen, enable = s0_valid)
  val s1_wstrb = RegEnable(next = s0_wstrb, enable = s0_valid)
  val s1_wdata = RegEnable(next = s0_wdata, enable = s0_valid)
  val s1_control_fcn = RegEnable(next = s0_control_fcn, enable = s0_valid)
  val s1_control_way = Reg(UInt(wayBits.W))
  val s1_kill = io.in.req.bits.s1_kill

  // ***************************** access state machine *****************************
  val s1_idle :: s1_tag_read :: s1_wait_ram_arready :: s1_wait_read_finish :: s1_wait_ram_awready :: s1_do_ram_write :: s1_wait_write_finish :: s1_wait_cache_write :: s1_wait_lsu_ready :: Nil = Enum(UInt(), 9)
  val s1_status = RegInit(s1_idle)
  def tag_to_beat(addr: UInt) = addr(tagMSB, indexLSB - log2Ceil(refillCycles))
  val s0_conflict = io.in.req.valid && s1_status =/= s1_idle && s1_wen && (tag_to_beat(s0_addr) === tag_to_beat(s1_addr))
  val s1_use_bypass = RegEnable(next = s0_conflict, init = false.B, enable = io.in.req.fire())

  def tag_to_set(addr: UInt) = addr(tagMSB, indexLSB)
  val s0_db_conflict = io.in.req.valid && s1_status =/= s1_idle && s1_wen && (tag_to_set(s0_addr) === tag_to_set(s1_addr))
  val s1_db_use_bypass = RegEnable(next = s0_db_conflict, init = false.B, enable = io.in.req.fire())
  val s1_bypassed_db = Reg(Bits(width = param.nWays.W))

  val out = io.out

  // valid bit array
  val vb_array = SeqMem(param.nSets, Bits(width = param.nWays.W))
  val vb_array_wen = Wire(Bool())
  // dirty bit array
  val db_array = SeqMem(param.nSets, Bits(width = param.nWays.W))
  val db_array_wen = Wire(Bool())

  val tag_array = SeqMem(param.nSets, Vec(param.nWays, UInt(width = tagBits.W)))
  val tag_raddr = Mux(!s1_stall && s0_valid, s0_addr, s1_addr)
  val tag_wen = Wire(Bool())

  val tag_ridx = tag_raddr(indexMSB, indexLSB)
  val vb_rdata = vb_array.read(tag_ridx, !vb_array_wen)
  val db_rdata = Mux(s1_db_use_bypass, s1_bypassed_db,
    db_array.read(tag_ridx, s0_valid && !s0_db_conflict))
  val tag_rdata = tag_array.read(tag_ridx, !tag_wen)
  val data_arrays = Seq.fill(beatSize / wordBits) { SeqMem(param.nSets * refillCycles, Vec(param.nWays, UInt(width = wordBits.W))) }

  // cache is a giant sequential logic
  // if we wish to debug or verify that the cache is correct
  // we need to track all its internal states(all internal registers and memory): vb, db, tag_array, data_arrays, etc
  // but we can not dump them all due to their size
  // so we choose another way: record the updates to these internal states and hash them to keep the output size small
  // we can then compare these hash values with the correct value(from emulator)
  val vb_hash = RegInit(UInt(0, width = wordBits))
  val db_hash = RegInit(UInt(0, width = wordBits))
  val tag_array_hash = RegInit(UInt(0, width = wordBits))
  val data_arrays_hash = Seq.fill(beatSize / wordBits) { RegInit(UInt(0, width = wordBits)) }

  val s1_idx = s1_addr(indexMSB, indexLSB)
  val s1_tag = s1_addr(tagMSB, tagLSB)
  def wayMap[T <: Data](f: Int => T) = Vec((0 until param.nWays).map(f))
  val s1_tag_eq_way = wayMap((w: Int) => tag_rdata(w) === s1_tag)
  val s1_tag_match_way = wayMap((w: Int) => s1_tag_eq_way(w) && vb_rdata(w)).asUInt
  val s1_hit = s1_tag_match_way.orR
  val s1_read_hit = s1_hit && s1_ren
  val s1_write_hit = s1_hit && s1_wen
  val s1_hit_way = Wire(Bits())
  s1_hit_way := Bits(0)
  (0 until param.nWays).foreach(i => when (s1_tag_match_way(i)) { s1_hit_way := Bits(i) })


  // use random replacement
  val lfsr = LFSR16(s1_status === s1_wait_cache_write)
  val s1_repl_way = RegEnable(next = if(param.nWays == 1) UInt(0) else lfsr(log2Ceil(param.nWays) - 1, 0), init = 0.U, enable = s0_valid)
  // valid and dirty
  val s1_need_writeback = vb_rdata(s1_repl_way) && db_rdata(s1_repl_way)
  val s1_writeback_tag = tag_rdata(s1_repl_way)
  val s1_writeback_addr = Cat(s1_writeback_tag, Cat(s1_idx, 0.U(blockOffsetBits.W)))
  val s1_target_word = Reg(UInt(wordBits.W))
  val s1_do_miss = RegInit(false.B)
  // we don't have to wait for anything, reqs can be pipelined
  // we can only accept new reqs under read hit
  // if it's a write hit, we need to do cache write in stage 1, thus occupying the only rw port.
  // so we can not accept new req on write hit.
  // but if it's a write hit and there is no new cache req, we can set req ready
  // so that the entire core pipeline will not be stalled
  val s1_read_flowthrough = s1_read_hit && io.in.resp.ready
  val s1_write_flowthrough = s1_write_hit && io.in.resp.ready
  s1_stall := s1_status =/= s1_idle && !(s1_status === s1_tag_read && (s1_read_flowthrough || s1_write_flowthrough))
  val refill_one_beat = s1_status === s1_wait_read_finish && out.r.fire()
  val refill_cnt = RegInit(0.asUInt(log2Ceil(refillCycles).W))
  val wb_cnt = RegInit(0.asUInt(log2Ceil(refillCycles).W))

  val s1_dout = Wire(Vec(param.nWays, UInt(wordBits.W)))
  s1_dout := Vec.fill(param.nWays) {0.U}
  val s1_dout_target_way = Wire(Vec(beatSize / wordBits, UInt(wordBits.W)))

  val s1_wb_data = Wire(Vec(beatSize / wordBits, UInt(wordBits.W)))
  val control_wb_data = Wire(Vec(beatSize / wordBits, UInt(wordBits.W)))

  def beatMatch(addr: UInt) = addr.extract(offsetMSB, offsetMSB - log2Ceil(refillCycles) + 1) === refill_cnt
  // one beat holds several words, this returns the word index in this beat
  // it tells this addr is in the first word or second word of a beat
  def wordIndexInBeat(addr: UInt) = addr.extract(log2Ceil(beatBytes) - 1, wordMSB + 1)

  // bypass wdata to deal with WAW and RAW
  val s1_wdata_bypass = Wire(Vec(beatSize / wordBits, UInt(wordBits.W)))
  val s1_bypassed_wdata = Reg(Vec(beatSize / wordBits, UInt(wordBits.W)))
  when (s0_valid && s0_conflict) {
    for (i <- 0 until (beatSize / wordBits)) {
      s1_bypassed_wdata(i) := s1_wdata_bypass(i)
    }
  }

  val s1_in_writeback = s1_status === s1_do_ram_write
  val control_in_writeback = Wire(Bool())
  for ((data_array, i) <- data_arrays zipWithIndex) {
    def row(addr: UInt) = addr(indexMSB, indexLSB - log2Ceil(refillCycles))
    def wordMatch(addr: UInt) = wordIndexInBeat(addr) === i.U
    val s0_ren = (s0_valid && wordMatch(s0_addr))

    // write hit
    val hit_wen = (wordMatch(s1_addr) && s1_write_hit && s1_status === s1_tag_read) && !s1_kill
    val hit_idx = row(s1_addr)
    val hit_ov = Mux(s1_use_bypass, s1_bypassed_wdata(wordIndexInBeat(s1_addr)), s1_dout(s1_hit_way))
    val hit_target_way = s1_hit_way
    val hit_wdata = wordStrb(hit_ov, s1_wdata, s1_wstrb)
    s1_wdata_bypass(i) := Mux(hit_wen, hit_wdata, s1_dout_target_way(i))

    // write miss
    // we merge wdata and correspoinding refill data
    val refill_wen = refill_one_beat
    val refill_idx = s1_idx << log2Ceil(refillCycles) | refill_cnt
    val refill_merge = s1_wen && wordMatch(s1_addr) && beatMatch(s1_addr)
    val refill_ov = out.r.bits.data(wordBits * (i + 1) - 1, wordBits * i)
    val refill_target_way = s1_repl_way
    val refill_wdata = Mux(refill_merge,
      wordStrb(refill_ov, s1_wdata, s1_wstrb), refill_ov)

    val wen = hit_wen || refill_wen
    val data = Mux(hit_wen, hit_wdata, refill_wdata)
    val way = Mux(hit_wen, hit_target_way, refill_target_way)
    val idx = Mux(hit_wen, hit_idx, refill_idx)
    when (wen) {
      if (param.debug) {
        printf("time: %d [DCache] write data array: %d idx: %d way: %d data: %x\n",
          GTimer(), i.U, idx, way, data)
      }
      if (param.ilaDebug) {
        data_arrays_hash(i) := data_arrays_hash(i) ^ data ^ way ^ idx
      }
      data_array.write(idx, Vec.fill(param.nWays)(data), (0 until param.nWays).map(way === _))
    }
    // enable pipelined write back
    val writeback_idx = Cat(s1_idx, Mux(io.out.w.fire(), wb_cnt + 1.U, wb_cnt))
    val in_writeback = s1_in_writeback || control_in_writeback
    val ridx = Mux(in_writeback, writeback_idx, row(s0_addr))
    val dout = data_array.read(ridx, (s0_valid && !s0_conflict) || in_writeback)
    when (wordMatch(s1_addr)) {
      s1_dout := dout
    }
    s1_dout_target_way(i) := dout(s1_hit_way)
    s1_wb_data(i) := dout(s1_repl_way)
    control_wb_data(i) := dout(s1_control_way)
  }

  // state machine
  when (io.in.req.fire()) {
    s1_status := s1_tag_read
    if (param.debug) {
      printf("time: %d [DCache] s0 ", GTimer())
      when (s0_ren) {
        printf("read addr: %x\n", s0_addr)
      }
      when (s0_wen) {
        printf("write addr: %x wdata: %x wstrb: %x\n",
          s0_addr, s0_wdata, s0_wstrb)
      }
    }
  }

  when (s1_status === s1_tag_read) {
    if (param.debug) {
      when (s1_ren) {
        printf("time: %d [DCache] s1 read addr: %x s1_kill: %d  use_bypass: %d idx: %d tag: %x hit: %d ",
          GTimer(), s1_addr, s1_kill, s1_use_bypass, s1_idx, s1_tag, s1_hit)
      }
      when (s1_wen) {
        printf("time: %d [DCache] s1 write addr: %x s1_kill: %d wdata: %x wstrb: %x use_bypass: %d idx: %d tag: %x hit: %d ",
          GTimer(), s1_addr, s1_kill, s1_wdata, s1_wstrb, s1_use_bypass, s1_idx, s1_tag, s1_hit)
      }
      when (s1_hit) {
        printf("hit_way: %d\n", s1_hit_way)
      } .elsewhen (s1_need_writeback) {
        printf("repl_way: %d wb_addr: %x\n", s1_repl_way, s1_writeback_addr)
      } .otherwise {
        printf("repl_way: %d repl_addr: %x\n", s1_repl_way, s1_writeback_addr)
      }
      printf("time: %d [DCache] s1 tags: ", GTimer())
      for (i <- 0 until param.nWays) {
        printf("%x ", tag_rdata(i))
      }
      printf("\n")
      printf("time: %d [DCache] s1 vb: %x db: %x\n", GTimer(), vb_rdata, db_rdata)
    }

    when (!s1_kill) {
      when (!s1_hit && !s1_need_writeback) {
        s1_do_miss := true.B
        when (out.ar.fire()) {
          s1_status := s1_wait_read_finish
          } .otherwise {
            s1_status := s1_wait_ram_arready
          }
      }

      when (!s1_hit && s1_need_writeback) {
        s1_do_miss := true.B
        when (out.aw.fire()) {
          s1_status := s1_do_ram_write
          } .otherwise {
            s1_status := s1_wait_ram_awready
          }
      }

      when (s1_hit && !io.in.resp.ready) {
        s1_status := s1_wait_lsu_ready
      }

      when (s1_hit && io.in.resp.ready && !io.in.req.fire()) {
        s1_status := s1_idle
      }
    } .otherwise {
      // in our simple in order pipeline, if a req is killed in fu s1
      // it can not be delayslot instr
      // so any instruction following it must be killed as well
      // so, there should be no new req pass down
      when (!reset.toBool) {
        assert(!io.in.req.valid)
      }
      s1_status := s1_idle
    }
  }

  when (s1_status === s1_wait_ram_awready && out.aw.fire()) {
    s1_status := s1_do_ram_write
  }

  when (s1_status === s1_do_ram_write) {
    when (out.w.fire()) {
      wb_cnt := wb_cnt + 1.U;
      when (wb_cnt === (refillCycles - 1).U) {
        s1_status := s1_wait_write_finish
      }
    }
  }

  when (s1_status === s1_wait_write_finish && io.out.b.fire()) {
    // finish write back, start refill
    s1_status := s1_wait_ram_arready
  }

  when (s1_status === s1_wait_ram_arready && out.ar.fire()) {
    s1_status := s1_wait_read_finish
  }

  val axi_rdata_words = Wire(Vec(beatSize / wordBits, UInt(wordBits.W)))
  for ((axi_rdata_word, i) <- axi_rdata_words zipWithIndex) {
    axi_rdata_word := out.r.bits.data(wordBits * (i + 1) - 1, wordBits * i)
  }
  when (s1_status === s1_wait_read_finish) {
    when (out.r.valid) {
      refill_cnt := refill_cnt + 1.U;
      when (beatMatch(s1_addr)) {
        // very naive code to get word from a beat? Need smarter ways!!!
        s1_target_word := axi_rdata_words(wordIndexInBeat(s1_addr))
      }
      when (out.r.bits.last) {
        s1_status := s1_wait_cache_write
      }
    }
  }

  when (s1_status === s1_wait_cache_write) {
    // refill done
    s1_status := s1_wait_lsu_ready
    if (param.debug) {
      printf("time: %d [DCache] refill addr: %x idx: %d tag: %x repl_way: %d\n",
        GTimer(), s1_addr, s1_idx, s1_tag, s1_repl_way)
    }
    if (param.debug) {
      printf("time: %d [DCache] write_tag_array: idx: %d way: %d tag: %x\n",
        GTimer(), s1_idx, s1_repl_way, s1_tag)
    }
    tag_array.write(s1_idx, Vec.fill(param.nWays)(s1_tag), Seq.tabulate(param.nWays)(s1_repl_way === _))
  }
  tag_wen := s1_status === s1_wait_cache_write

  when (s1_status === s1_wait_lsu_ready) {
    when (io.in.resp.fire()) {
      s1_status := s1_idle
      s1_do_miss := false.B
      refill_cnt := 0.U
      wb_cnt := 0.U
    }
  }

  // ***************************** control state machine *****************************
  val control_idle :: control_tag_read :: control_wait_ram_awready :: control_do_ram_write :: control_invalidate_index :: control_wait_write_finish :: control_wait_resp_ready :: Nil = Enum(UInt(), 7)
  val control_status = RegInit(control_idle)

  // state machine
  when (io.control.req.fire()) {
    control_status := control_tag_read
    if (param.debug) {
      printf("time: %d [DCache control] s0 addr: %x fcn: %x\n", GTimer(), s0_addr, s0_control_fcn)
    }
  }

  val control_writeback_tag = tag_rdata(s1_control_way)
  val control_writeback_addr = Cat(control_writeback_tag, Cat(s1_idx, 0.U(blockOffsetBits.W)))
  val control_need_writeback = vb_rdata(s1_control_way) && db_rdata(s1_control_way)
  val hit_need_writeback = vb_rdata(s1_hit_way) && db_rdata(s1_hit_way)
  when (control_status === control_tag_read) {
    if (param.debug) {
      printf("time: %d [DCache control] s1 addr: %x fcn: %x idx: %d s1_hit: %d hit_way: %d control_way: %d\n",
        GTimer(), s1_addr, s1_control_fcn, s1_idx, s1_hit, s1_hit_way, s1_addr(wayMSB, wayLSB))
    }
    when (s1_control_fcn === CACHECONTROL_INVALIDATE_INDEX) {
      s1_control_way := s1_addr(wayMSB, wayLSB)
      when (control_need_writeback) {
        control_status := control_wait_ram_awready
      } .otherwise {
        control_status := control_invalidate_index
      }
    } .elsewhen (s1_control_fcn === CACHECONTROL_HIT_WRITEBACK_INVALIDATE) {
      when (!s1_hit) {
        control_status := control_wait_resp_ready
      } .elsewhen (hit_need_writeback) {
        s1_control_way := s1_hit_way
        control_status := control_wait_ram_awready
      } .otherwise {
        s1_control_way := s1_hit_way
        control_status := control_invalidate_index
      }
    } .otherwise {
      assert(false.B)
    }
  }
  control_in_writeback := control_status === control_do_ram_write
  when (control_status === control_wait_ram_awready && out.aw.fire()) {
    control_status := control_do_ram_write
  }

  when (control_status === control_do_ram_write) {
    when (out.w.fire()) {
      wb_cnt := wb_cnt + 1.U;
      when (wb_cnt === (refillCycles - 1).U) {
        control_status := control_wait_write_finish
      }
    }
  }

  when (control_status === control_wait_write_finish && io.out.b.fire()) {
    control_status := control_wait_resp_ready
  }

  when (control_status === control_invalidate_index) {
    control_status := control_wait_resp_ready
  }

  when (control_status === control_wait_resp_ready && io.control.resp.ready) {
    wb_cnt := 0.U
    control_status := control_idle
  }

  // ***************************** modify tag/valid bits *****************************
  val rst_cnt = RegInit(0.asUInt(log2Up(2 * param.nSets + 1).W))
  val rst = (rst_cnt < 2 * param.nSets.U) && !reset.toBool
  val rst_vb_wdata = Bits(0, param.nWays)
  val rst_db_wdata = Bits(0, param.nWays)

  val access_vb_wen = s1_status === s1_wait_cache_write
  val access_vb_wdata = vb_rdata.bitSet(s1_repl_way, true.B)
  val control_vb_wen = control_status === control_invalidate_index
  val control_vb_wdata = vb_rdata.bitSet(s1_control_way, false.B)

  vb_array_wen := rst || control_vb_wen || access_vb_wen
  val vb_array_widx = Mux(rst, rst_cnt, s1_idx)
  val vb_array_wdata = Mux(rst, rst_vb_wdata,
    Mux(control_vb_wen, control_vb_wdata, access_vb_wdata))
  when (vb_array_wen) {
    when (rst) { rst_cnt := rst_cnt + 1.U }
    if (param.debug) {
      printf("time: %d [DCache] write_vb_array: idx: %d data: %x\n",
        GTimer(), vb_array_widx, vb_array_wdata)
    }
    vb_array.write(vb_array_widx, vb_array_wdata)
  }

  val control_db_wen = control_status === control_invalidate_index
  val control_db_wdata = vb_rdata.bitSet(s1_control_way, false.B)

  val write_hit_db_wen = (s1_status === s1_tag_read) && s1_write_hit && !s1_kill
  val write_hit_db_data = db_rdata.bitSet(s1_hit_way, true.B)

  val refill_db_wen = s1_status === s1_wait_cache_write
  val refill_db_data = db_rdata.bitSet(s1_repl_way, s1_wen)

  db_array_wen := rst || control_db_wen || write_hit_db_wen || refill_db_wen
  val db_array_widx = Mux(rst, rst_cnt, s1_idx)
  val db_array_wdata = Mux(rst, rst_db_wdata,
    Mux(control_db_wen, control_db_wdata,
      Mux(write_hit_db_wen, write_hit_db_data,
        refill_db_data)))
  when (write_hit_db_wen) {
    s1_bypassed_db := write_hit_db_data
  }
  when (db_array_wen) {
    if (param.debug) {
      printf("time: %d [DCache] write_db_array: idx: %d data: %d\n",
        GTimer(), db_array_widx, db_array_wdata)
    }
    db_array.write(db_array_widx, db_array_wdata)
  }

  // memport interface
  io.in.req.ready := !rst && (control_status === control_idle) && !io.control.req.valid && !s1_stall
  io.in.resp.valid := (s1_status === s1_tag_read && s1_hit && io.in.resp.ready && !s1_kill) || (s1_status === s1_wait_lsu_ready)
  io.in.resp.bits.data := Mux(s1_do_miss, s1_target_word,
    Mux(s1_use_bypass, s1_bypassed_wdata(wordIndexInBeat(s1_addr)), s1_dout(s1_hit_way)))

  // control interface
  io.control.req.ready := !rst && (control_status === control_idle) && (s1_status === s1_idle)
  io.control.resp.valid := (control_status === control_wait_resp_ready)
  io.control.resp.bits.data := 0.U

  // axi interface
  // external memory bus width is 64/128bits
  // so each memport read/write is mapped into a whole axi bus width read/write
  val axi4_size = log2Up(param.axi4DataWidth / 8).U
  val mem_addr = Cat(s1_addr(tagMSB, indexLSB), 0.asUInt(blockOffsetBits.W))

  // write address channel signals
  val s1_aw_valid = (s1_status === s1_tag_read && !s1_hit && s1_need_writeback && !s1_kill) || (s1_status === s1_wait_ram_awready)
  val control_aw_valid = control_status === control_wait_ram_awready

  out.aw.bits.id := 0.asUInt(param.idWidth.W)
  out.aw.bits.addr := Mux(control_aw_valid, control_writeback_addr, s1_writeback_addr)
  out.aw.bits.len := (refillCycles - 1).asUInt(8.W)
  out.aw.bits.size := axi4_size
  out.aw.bits.burst := "b01".U       // normal sequential memory
  out.aw.bits.lock := 0.asUInt(1.W)
  out.aw.bits.cache := "b1111".U
  out.aw.bits.prot := 0.asUInt(3.W)
  out.aw.bits.region := 0.asUInt(4.W)
  out.aw.bits.qos := 0.asUInt(4.W)
  out.aw.bits.user := 0.asUInt(5.W)
  out.aw.valid := control_aw_valid || s1_aw_valid

  // write data channel signals
  val s1_wb_valid = RegNext(next = s1_status === s1_do_ram_write, init = false.B)
  val control_wb_valid = RegNext(next = control_status === control_do_ram_write, init = false.B)
  out.w.bits.id := 0.asUInt(param.idWidth.W)
  out.w.bits.data := Mux(control_wb_valid, control_wb_data.asUInt, s1_wb_data.asUInt)
  out.w.bits.strb := Fill(beatBytes, 1.asUInt(1.W))
  out.w.bits.last := wb_cnt === (refillCycles - 1).U
  out.w.bits.user := 0.asUInt(5.W)
  out.w.valid := control_wb_valid || s1_wb_valid

  // write response channel signals
  out.b.ready := (s1_status === s1_wait_write_finish) || (control_status === control_wait_write_finish)

  // read address channel signals
  out.ar.bits.id := 0.asUInt(param.idWidth.W)
  out.ar.bits.addr := mem_addr
  out.ar.bits.len := (refillCycles - 1).asUInt(8.W)
  out.ar.bits.size := axi4_size
  out.ar.bits.burst := "b01".U // normal sequential memory
  out.ar.bits.lock := 0.asUInt(1.W)
  out.ar.bits.cache := "b1111".U
  out.ar.bits.prot := 0.asUInt(3.W)
  out.ar.bits.region := 0.asUInt(4.W)
  out.ar.bits.qos := 0.asUInt(4.W)
  out.ar.bits.user := 0.asUInt(5.W)
  out.ar.valid := (s1_status === s1_tag_read && !s1_hit && !s1_need_writeback && !s1_kill) || (s1_status === s1_wait_ram_arready)

  // read data channel signals
  out.r.ready := true.B

  // perf interface
  io.perf.access := io.in.req.fire()
  io.perf.miss := io.in.resp.fire() && s1_do_miss

  // ILA debug interface
  if (param.ilaDebug) {
    val ila = io.ila_debug
    val req_hash = RegInit(0.asUInt(param.dataWidth.W))
    val resp_hash = RegInit(0.asUInt(param.dataWidth.W))
    when (io.in.req.fire()) {
      when (s0_wen) {
        req_hash := req_hash ^ s0_addr ^ s0_wdata
      } .otherwise { req_hash := req_hash ^ s0_addr }
    }
    when (io.in.resp.fire() && s1_ren) {
      resp_hash := resp_hash ^ io.in.resp.bits.data
    }
    ila.req_hash := req_hash
    ila.resp_hash := resp_hash
    ila.vb_hash := vb_hash
    ila.db_hash := db_hash
    ila.tag_hash := tag_array_hash
    ila.data_hash := data_arrays_hash(0) ^ data_arrays_hash(1)
    ila.overall_hash := ila.req_hash ^ ila.resp_hash ^ ila.vb_hash ^ ila.db_hash ^ ila.tag_hash ^ ila.data_hash
  }
  else {
    io.ila_debug := DontCare
  }
}
