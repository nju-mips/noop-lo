package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._
import scala.collection.mutable.LinkedHashMap

class PerfCounterIO(param: CoreParams) extends Bundle
{

  val rw = Flipped(new MemPortIO(param.xprlen, param.xprlen))
  val perf = Flipped(new Bundle {
    val ifu = new IFUPerfIO
    val isu = new ISUPerfIO
    val lsu = new LSUPerfIO
    val wbu = new WBUPerfIO
    val icache = new ICachePerfIO
    val dcache = new DCachePerfIO
  })
}

class PerfCounter(param: CoreParams) extends Module
{
  val io = IO(new PerfCounterIO(param))

  val rw = io.rw
  val s1_kill = rw.req.bits.s1_kill
  val perf = io.perf

  // current inflight req stored here
  val reg_valid = RegInit(false.B)
  val req = Reg(new MemReq(param.xprlen, param.xprlen))
  val wen = reg_valid && (req.fcn === M_XWR) && !s1_kill
  when (!reset.toBool) {
    // does not accept partial write
    assert(!wen || ~req.wstrb === 0.U)
  }

  when (rw.req.fire()) {
    reg_valid := true.B
    req := rw.req.bits
  }

  // assume that resp is always ready!!!
  when (rw.resp.valid || s1_kill) {
    reg_valid := false.B
  }

  val addr = req.addr(7, 0) // 256 counters is sufficient
  val idx = req.addr(param.xprlen - 1, 3)
  rw.req.ready := !reg_valid
  rw.resp.valid := reg_valid && !s1_kill

  if (param.usePerfCounter) {
    val nPerfCounters = 36
    // how to write this elegently?
    // I would like C-like Enum.
    // overall performance
    val instr = 0
    val frontend_stall_cycles = 1
    val backend_stall_cycles = 2
    val frontend_backend_stall_cycles = 3
    // frontend performance
    // branch prediction
    val branch = 4
    val branch_misprediction = 5
    val branch_btb_miss = 6
    val br = 7
    val br_misprediction = 8
    val br_btb_miss = 9
    val j = 10
    val j_misprediction = 11
    val j_btb_miss = 12
    val call = 13
    val call_misprediction = 14
    val call_btb_miss = 15
    val ret = 16
    val ret_misprediction = 17
    val ret_btb_miss = 18
    // icache performance
    val icache_access = 19
    val icache_miss = 20
    val icache_miss_cycles = 21
    val icache_miss_backend_busy_cycles = 22
    // backend performance
    val backend_starving = 23
    val operand_not_ready = 24
    val rd_busy = 25
    val backend_mdu_busy = 26
    val backend_lsu_busy = 27
    // dcache performance
    val dcache_access = 28
    val dcache_miss = 29
    val lsu_wait_dcache = 30
    val dcache_load = 31
    val dcache_load_miss = 32
    val dcache_store = 33
    val dcache_store_miss = 34
    val cycles = 35

    val perf_counters = RegInit(Vec.fill(nPerfCounters)(0.asUInt((2 * param.xprlen).W)))
    val counter_update = Wire(Vec(nPerfCounters, Bool()))
    // ISU
    counter_update(backend_starving) := perf.isu.backend_starving
    counter_update(operand_not_ready) := perf.isu.operand_not_ready
    counter_update(rd_busy) := perf.isu.rd_busy
    counter_update(backend_mdu_busy) := perf.isu.backend_mdu_busy
    counter_update(backend_lsu_busy) := perf.isu.backend_lsu_busy

    // WBU
    counter_update(instr) := perf.wbu.instr_commit
    counter_update(branch) := perf.wbu.branch_commit
    counter_update(branch_misprediction) := perf.wbu.branch_misprediction
    counter_update(branch_btb_miss) := perf.wbu.branch_btb_miss
    counter_update(br) := perf.wbu.br_commit
    counter_update(br_misprediction) := perf.wbu.br_misprediction
    counter_update(br_btb_miss) := perf.wbu.br_btb_miss
    counter_update(j) := perf.wbu.j_commit
    counter_update(j_misprediction) := perf.wbu.j_misprediction
    counter_update(j_btb_miss) := perf.wbu.j_btb_miss
    counter_update(call) := perf.wbu.call_commit
    counter_update(call_misprediction) := perf.wbu.call_misprediction
    counter_update(call_btb_miss) := perf.wbu.call_btb_miss
    counter_update(ret) := perf.wbu.ret_commit
    counter_update(ret_misprediction) := perf.wbu.ret_misprediction
    counter_update(ret_btb_miss) := perf.wbu.ret_btb_miss

    // IFU & ICache
    counter_update(icache_access) := perf.icache.access
    counter_update(icache_miss) := perf.icache.miss
    counter_update(icache_miss_cycles) := perf.icache.in_miss
    counter_update(icache_miss_backend_busy_cycles) := perf.icache.in_miss && perf.ifu.backend_busy_cycles
    counter_update(frontend_stall_cycles) := perf.ifu.frontend_stall_cycles
    counter_update(backend_stall_cycles) := perf.ifu.backend_stall_cycles
    counter_update(frontend_backend_stall_cycles) := perf.ifu.frontend_backend_stall_cycles
    // LSU & DCache
    counter_update(dcache_access) := perf.dcache.access
    counter_update(dcache_miss) := perf.dcache.miss
    counter_update(lsu_wait_dcache) := perf.lsu.wait_dcache
    counter_update(dcache_load) := perf.lsu.load
    counter_update(dcache_load_miss) := perf.lsu.load_miss
    counter_update(dcache_store) := perf.lsu.store
    counter_update(dcache_store_miss) := perf.lsu.store_miss

    // cycles
    counter_update(cycles) := true.B

    for (i <- 0 until nPerfCounters) {
      // further latched to avoid being critical path
      when (RegNext(counter_update(i)) && !(wen && idx === i.U)) {
        perf_counters(i) := perf_counters(i) + 1.U
      }
    }
    val is_high = addr(2)
    val counter = perf_counters(idx)
    rw.resp.bits.data := Mux(is_high, counter(2 * param.xprlen - 1, param.xprlen), counter(param.xprlen - 1, 0))
    when (wen) {
      val new_value = Mux(is_high, Cat(req.data, counter(param.xprlen - 1, 0)),
        Cat(counter(2 * param.xprlen - 1, param.xprlen), req.data))
      counter := new_value
    }
  } else {
    rw.resp.bits.data := 0.asUInt(param.xprlen.W)
  }
}
