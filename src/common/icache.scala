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

case class L1CacheParams(
  nSets: Int = 32,
  nWays: Int = 16,
  addrWidth: Int = 32,
  dataWidth: Int = 32,
  idWidth: Int = 4,
  axi4DataWidth: Int = 64,
  debug: Boolean = false,
  ilaDebug: Boolean = false)

class ICachePerfIO extends Bundle
{
  val access = Output(Bool())
  val miss = Output(Bool())
  val in_miss = Output(Bool())
}

// ============================== ICache ==============================
class ICache(param:L1CacheParams) extends Module
{
  val io = IO(new Bundle {
    val in = Flipped(new MemPortIO(param.addrWidth, param.dataWidth))
    val control = Flipped(new CacheControlPortIO(param.addrWidth, param.dataWidth))
    val out = new AXI4IO(param.idWidth, param.axi4DataWidth)
    val perf = new ICachePerfIO
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
  // read/control port addr
  val s0_addr = Mux(s0_control, io.control.req.bits.addr, io.in.req.bits.addr)
  // control port data and fcn
  val s0_data = io.control.req.bits.data
  val s0_control_fcn = io.control.req.bits.fcn
  val s1_stall = Wire(Bool())
  val s1_addr = RegEnable(next = s0_addr, enable = s0_valid)
  val s1_data = RegEnable(next = s0_data, enable = s0_valid)
  val s1_control_fcn = RegEnable(next = s0_control_fcn, enable = s0_valid)
  val s1_kill = io.in.req.bits.s1_kill

  val out = io.out

  // valid bit array
  val vb_array = SeqMem(param.nSets, Bits(width = param.nWays.W))
  val vb_array_wen = Wire(Bool())

  val tag_array = SeqMem(param.nSets, Vec(param.nWays, UInt(width = tagBits.W)))
  val tag_raddr = Mux(!s1_stall && s0_valid, s0_addr, s1_addr)
  val tag_wen = Wire(Bool())

  val tag_ridx = tag_raddr(indexMSB, indexLSB)
  val vb_rdata = vb_array.read(tag_ridx, !vb_array_wen)
  val tag_rdata = tag_array.read(tag_ridx, !tag_wen)

  val data_arrays = Seq.fill(beatSize / wordBits) { SeqMem(param.nSets * refillCycles, Vec(param.nWays, UInt(width = wordBits.W))) }
  if (param.debug) {
    printf("time: %d [ICache] read_tag_array addr: %x set: %d tag_rdata: ", GTimer(), tag_raddr, tag_raddr(indexMSB, indexLSB))
    tag_rdata.map(d => printf("%x ", d))
    printf("\n")
  }


  val s1_idx = s1_addr(indexMSB, indexLSB)
  val s1_tag = s1_addr(tagMSB, tagLSB)
  // for control port
  val control_way = Reg(UInt(wayBits.W))
  def wayMap[T <: Data](f: Int => T) = Vec((0 until param.nWays).map(f))
  val s1_tag_eq_way = wayMap((w: Int) => tag_rdata(w) === s1_tag)
  val s1_tag_match_way = wayMap((w: Int) => s1_tag_eq_way(w) && vb_rdata(w)).asUInt
  val s1_hit = s1_tag_match_way.orR
  val s1_hit_way = Wire(Bits())
  s1_hit_way := Bits(0)
  (0 until param.nWays).foreach(i => when (s1_tag_match_way(i)) { s1_hit_way := Bits(i) })


  // ***************************** access state machine *****************************
  val s1_idle :: s1_tag_read  :: s1_wait_ram_arready :: s1_wait_read_finish :: s1_wait_cache_write :: s1_wait_ifu_ready :: Nil = Enum(UInt(), 6)
  val s1_status = RegInit(s1_idle)


  // use random replacement
  val lfsr = LFSR16(s1_status === s1_wait_cache_write)
  val s1_repl_way = RegEnable(next = if(param.nWays == 1) UInt(0) else lfsr(log2Ceil(param.nWays) - 1, 0), init = 0.U, enable = s0_valid)
  val s1_target_word = Reg(UInt(wordBits.W))
  val s1_do_miss = RegInit(false.B)
  // we don't have to wait for anything, reqs can be pipelined
  val s1_flowthrough = s1_hit && io.in.resp.ready
  s1_stall := s1_status =/= s1_idle && !(s1_status === s1_tag_read && s1_flowthrough) && !(s1_status === s1_wait_ifu_ready && io.in.resp.ready)

  val refill_one_beat = s1_status === s1_wait_read_finish && out.r.fire()
  val refill_cnt = RegInit(0.asUInt(log2Ceil(refillCycles).W))

  val s1_dout = Wire(Vec(param.nWays, UInt(wordBits.W)))
  s1_dout := Vec.fill(param.nWays) {0.U}

  for ((data_array, i) <- data_arrays zipWithIndex) {
    def wordMatch(addr: UInt) = addr.extract(log2Ceil(beatBytes) - 1, wordMSB + 1) === i.U
    def row(addr: UInt) = addr(indexMSB, indexLSB - log2Ceil(refillCycles))
    val s0_ren = (s0_valid && wordMatch(s0_addr))
    val wen = refill_one_beat
    val mem_idx = s1_idx << log2Ceil(refillCycles) | refill_cnt
    when (wen) {
      val data = out.r.bits.data(wordBits * (i + 1) - 1, wordBits * i)
      val way = s1_repl_way
      data_array.write(mem_idx, Vec.fill(param.nWays)(data), (0 until param.nWays).map(way === _))
    }
    // when s1 stalls, we have to make sure we still read the correct data from data_array
    // if not, dout will be incorrect when s1 stalls due to in.resp not ready
    val ridx = Mux(s1_stall, row(s1_addr), row(s0_addr))
    val dout = data_array.read(ridx, !wen)
    when (wordMatch(s1_addr)) {
      s1_dout := dout
    }
  }

  // state machine
  when (io.in.req.fire()) {
    s1_status := s1_tag_read
    if (param.debug) {
      printf("time: %d [ICache] s0 addr: %x\n", GTimer(), s0_addr)
    }
  }

  when (s1_status === s1_tag_read) {
    if (param.debug) {
      printf("time: %d [ICache] s1 addr: %x s1_kill: %d idx: %d tag: %x hit: %d ",
        GTimer(), s1_addr, s1_kill, s1_idx, s1_tag, s1_hit)
      when (s1_hit) {
        printf("hit_way: %d data: %x\n", s1_hit_way, s1_dout(s1_hit_way))
      } .otherwise { printf("repl_way: %d\n", s1_repl_way) }
    }
    when (!s1_kill) {
      when (!s1_hit) {
        s1_do_miss := true.B
        when (out.ar.fire()) {
          s1_status := s1_wait_read_finish
        } .otherwise {
          s1_status := s1_wait_ram_arready
        }
      }

      when (s1_hit && !io.in.resp.ready) {
        s1_status := s1_wait_ifu_ready
      }

      when (s1_flowthrough && !io.in.req.fire()) {
        s1_status := s1_idle
      }
    } .otherwise {
      s1_status := s1_idle
    }
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
      when (s1_addr(offsetMSB, offsetMSB - log2Ceil(refillCycles) + 1) === refill_cnt) {
        s1_target_word := axi_rdata_words(s1_addr.extract(log2Ceil(beatBytes) - 1, wordMSB + 1))
      }
      when (out.r.bits.last) {
        s1_status := s1_wait_cache_write
      }
    }
  }

  when (s1_status === s1_wait_cache_write) {
    // refill done
    s1_status := s1_wait_ifu_ready

    if (param.debug) {
      printf("time: %d [ICache] refill addr: %x idx: %d tag: %x repl_way: %d",
        GTimer(), s1_addr, s1_idx, s1_tag, s1_repl_way)
    }
    tag_array.write(s1_idx, Vec.fill(param.nWays)(s1_tag), Seq.tabulate(param.nWays)(s1_repl_way === _))
  }

  tag_wen := s1_status === s1_wait_cache_write

  when (s1_status === s1_wait_ifu_ready) {
    when (io.in.resp.fire()) {
      s1_do_miss := false.B
      refill_cnt := 0.U
      when (!io.in.req.fire()) {
        s1_status := s1_idle
      } .otherwise {
        s1_status := s1_tag_read
      }
    }
  }

  // ***************************** control state machine *****************************
  val control_idle :: control_tag_read  :: control_invalidate_index :: control_wait_resp_ready :: Nil = Enum(UInt(), 4)
  val control_status = RegInit(control_idle)

  // state machine
  when (io.control.req.fire()) {
    control_status := control_tag_read
    if (param.debug) {
      printf("time: %d [ICache control] s0 addr: %x fcn: %x\n", GTimer(), s0_addr, s0_control_fcn)
    }
  }

  when (control_status === control_tag_read) {
    if (param.debug) {
      printf("time: %d [ICache control] s1 addr: %x fcn: %x idx: %d s1_hit: %d hit_way: %d control_way: %d\n",
        GTimer(), s1_addr, s1_control_fcn, s1_idx, s1_hit, s1_hit_way, s1_addr(wayMSB, wayLSB))
    }
    when (s1_control_fcn === CACHECONTROL_INVALIDATE_INDEX) {
      control_way := s1_addr(wayMSB, wayLSB)
      control_status := control_invalidate_index
    } .elsewhen (s1_control_fcn === CACHECONTROL_HIT_INVALIDATE) {
      control_way := s1_hit_way
      when (s1_hit) {
        control_status := control_invalidate_index
      } .otherwise {
        control_status := control_wait_resp_ready
      }
    } .otherwise {
      assert(false.B)
    }
  }

  when (control_status === control_invalidate_index) {
    control_status := control_wait_resp_ready
  }

  when (control_status === control_wait_resp_ready && io.control.resp.ready) {
    control_status := control_idle
  }


  // ***************************** modify tag/valid bits *****************************
  val rst_cnt = RegInit(0.asUInt(log2Up(2 * param.nSets+1).W))
  val rst = (rst_cnt < 2 * param.nSets.U) && !reset.toBool
  val rst_vb_wdata = Bits(0, param.nWays)

  val access_vb_wen = s1_status === s1_wait_cache_write
  val access_vb_wdata = vb_rdata.bitSet(s1_repl_way, true.B)
  val control_vb_wen = control_status === control_invalidate_index
  val control_vb_wdata = vb_rdata.bitSet(control_way, false.B)

  vb_array_wen := rst || control_vb_wen || access_vb_wen
  val vb_array_widx = Mux(rst, rst_cnt, s1_idx)
  val vb_array_wdata = Mux(rst, rst_vb_wdata,
    Mux(control_vb_wen, control_vb_wdata, access_vb_wdata))
  when (vb_array_wen) {
    if (param.debug) {
      printf("time: %d [ICache] write_vb_array: idx: %d data: %x\n",
        GTimer(), vb_array_widx, vb_array_wdata)
    }
    when (rst) { rst_cnt := rst_cnt + 1.U }
    vb_array.write(vb_array_widx, vb_array_wdata)
  }

  // ***************************** interfaces *****************************
  // memport interface
  io.in.req.ready := !rst && (control_status === control_idle) && !io.control.req.valid && !s1_stall
  io.in.resp.valid := ((s1_status === s1_tag_read && s1_flowthrough && !s1_kill) || (s1_status === s1_wait_ifu_ready))
  io.in.resp.bits.data := Mux(s1_do_miss, s1_target_word, s1_dout(s1_hit_way))

  // control interface
  io.control.req.ready := !rst && (control_status === control_idle) && (s1_status === s1_idle)
  io.control.resp.valid := (control_status === control_wait_resp_ready)
  io.control.resp.bits.data := 0.U

  // perf interface
  io.perf.access := io.in.req.fire()
  io.perf.miss := io.in.resp.fire() && s1_do_miss
  io.perf.in_miss := s1_do_miss

  // axi interface
  // external memory bus width is 64/128bits
  // so each memport read/write is mapped into a whole axi bus width read/write
  val axi4_size = log2Up(param.axi4DataWidth / 8).U
  val mem_addr = Cat(s1_addr(tagMSB, indexLSB), 0.asUInt(blockOffsetBits.W))

  // write address channel signals
  out.aw.bits.id := 0.asUInt(param.idWidth.W)
  out.aw.bits.addr := mem_addr
  out.aw.bits.len := 0.asUInt(8.W)  // write once
  out.aw.bits.size := axi4_size
  out.aw.bits.burst := "b01".U       // normal sequential memory
  out.aw.bits.lock := 0.asUInt(1.W)
  out.aw.bits.cache := "b1111".U
  out.aw.bits.prot := 0.asUInt(3.W)
  out.aw.bits.region := 0.asUInt(4.W)
  out.aw.bits.qos := 0.asUInt(4.W)
  out.aw.bits.user := 0.asUInt(5.W)
  out.aw.valid := false.B

  // write data channel signals
  out.w.bits.id := 0.asUInt(param.idWidth.W)
  out.w.bits.data := 0.U
  out.w.bits.strb := 0.U
  out.w.bits.last := out.w.valid
  out.w.bits.user := 0.asUInt(5.W)
  out.w.valid := false.B

  // write response channel signals
  out.b.ready := false.B

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
  out.ar.valid := (s1_status === s1_tag_read && !s1_hit && !s1_kill) || (s1_status === s1_wait_ram_arready);

  // read data channel signals
  out.r.ready := true.B
}
