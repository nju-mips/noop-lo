//**************************************************************************
// NPC Processor Tile
//--------------------------------------------------------------------------
//

package NPC

import chisel3._
import chisel3.util._

import NPCConstants._
import Common._   
import Common.Util._   

case class PlatformParams(
  xprlen: Int = 32,
  extAXI4MemoryIdWidth: Int = 5,
  extAXI4MemoryBusWidth: Int = 64,
  extAXI4MMIOIdWidth: Int = 5,
  extAXI4MMIOBusWidth: Int = 64,
  useSim: Boolean = false,
  memportDebug: Boolean = false,
  axi4Debug: Boolean = false,
  ilaDebug: Boolean = false,
  tlbSize: Int = 64,
  )

case class PlatformConfig(
  platform: PlatformParams = PlatformParams(),
  core: CoreParams = CoreParams(),
  icache: L1CacheParams = L1CacheParams(),
  dcache: L1CacheParams = L1CacheParams())

class ILAHash(param: PlatformConfig) extends Bundle {
  val overall_hash = Output(UInt(param.platform.xprlen.W))
  override def cloneType = { new ILAHash(param).asInstanceOf[this.type] }
}

class NPCTile(param: PlatformConfig) extends Module
{
  val platform = param.platform
  val xprlen = platform.xprlen
  val useSim = platform.useSim

  val io = IO(new Bundle {
    val dmem = new AXI4IO(id_width = platform.extAXI4MemoryIdWidth - 1,
      data_width = platform.extAXI4MemoryBusWidth)
    val imem = new AXI4IO(id_width = platform.extAXI4MemoryIdWidth - 1,
      data_width = platform.extAXI4MemoryBusWidth)
    val mmio = new AXI4IO(id_width = platform.extAXI4MMIOIdWidth - 1,
      data_width = platform.extAXI4MMIOBusWidth)
    val mul = new MultiplierIO
    val div = new DividerIO
    val interrupt = Input(new Interrupt)
    val ila_debug = new ILAHash(param)
    val loongson_debug = new LoongsonCommit(param.core)

    val nemu = new NEMUCommit(param.core)
    val nemu_cpr = new NEMUCPR(param.core)
  })

  val core   = Module(new Core(param))
  val dcache = Module(new DCache(param.dcache))
  val icache = Module(new ICache(param.icache))
  val perf_counter = Module(new PerfCounter(param.core))

  val crossbar = Module(new MemCrossbar(param.core, xprlen, xprlen))
  crossbar.io.out(0) <> dcache.io.in
  crossbar.io.out(2) <> perf_counter.io.rw

  core.io.icache_control <> icache.io.control
  core.io.dcache_control <> dcache.io.control

  // mmio
  if (useSim) {
    /* device mmio */
    val dev = Module(new Device())
    crossbar.io.out(1) <> dev.io.in
    dev.io.clk := clock
    dev.io.reset := reset
    io.mmio := DontCare

    /* 1fc00000 - 1fcFFFFF: send to block ram */
    val bram = Module(new SimBramFilter(xprlen, xprlen))
    core.io.imem <> bram.io.in(0)
    core.io.dmem <> bram.io.in(1)
    bram.io.out(0) <> icache.io.in
    bram.io.out(1) <> crossbar.io.in

    if(platform.memportDebug) {
      when (TraceTrigger()) {
        bram.dump()
      }
    }
  } else {
    val axiBridge = Module(new MemPort2AXIBridge(xprlen, xprlen, platform.extAXI4MMIOIdWidth - 1,
      platform.extAXI4MMIOBusWidth))
    crossbar.io.out(1) <> axiBridge.io.in
    io.mmio <> axiBridge.io.out
    core.io.imem <> icache.io.in
    core.io.dmem <> crossbar.io.in
  }

  core.io.interrupt <> io.interrupt

  dcache.io.out <> io.dmem
  icache.io.out <> io.imem

  if (platform.axi4Debug) {
    when (TraceTrigger()) {
      io.dmem.dump("dmem axi ")
      io.imem.dump("imem axi ")
    }
  }
  if (platform.memportDebug) {
    when (TraceTrigger()) {
      core.io.dmem.dump("dmem memport ")
      core.io.imem.dump("imem memport ")
      core.io.icache_control.dump("icache control ")
      core.io.dcache_control.dump("dcache control ")
    }
  }

  core.io.mul <> io.mul
  core.io.div <> io.div

  // perf interface
  perf_counter.io.perf.ifu <> core.io.perf.ifu
  perf_counter.io.perf.isu <> core.io.perf.isu
  perf_counter.io.perf.lsu <> core.io.perf.lsu
  perf_counter.io.perf.wbu <> core.io.perf.wbu
  perf_counter.io.perf.icache <> icache.io.perf
  perf_counter.io.perf.dcache <> dcache.io.perf

  // nemu commit
  io.nemu <> core.io.nemu
  io.nemu_cpr <> core.io.nemu_cpr

  if(param.core.useLoongson) {
    io.loongson_debug <> core.io.loongson_debug
  } else {
    io.loongson_debug <> DontCare
  }

  // ila debug
  if (platform.ilaDebug) {
    val wbu_ila = core.io.ila_debug.wbu
    val isu_ila = core.io.ila_debug.isu
    val dcache_ila = dcache.io.ila_debug
    io.ila_debug.overall_hash := wbu_ila.curr_pc_hash ^ isu_ila.gpr_current_hash ^ dcache_ila.overall_hash
    when (wbu_ila.commit) {
      printf("time: %d ninstr: %x npc: %x overall_hash: %x npc_hash: %x instr_hash: %x instr: %x gpr_current_hash: %x gpr_history_hash: %x dcache_overall_hash: %x\n",
        GTimer(), wbu_ila.ninstr, wbu_ila.curr_pc, io.ila_debug.overall_hash, wbu_ila.curr_pc_hash, wbu_ila.instr_hash, wbu_ila.instr, isu_ila.gpr_current_hash, isu_ila.gpr_history_hash, dcache_ila.overall_hash)
      printf("time: %d ninstr: %x npc: %x req_hash: %x resp_hash: %x data_hash: %x tag_hash: %x vb_hash: %x db_hash: %x\n",
        GTimer(), wbu_ila.ninstr, wbu_ila.curr_pc, dcache_ila.req_hash, dcache_ila.resp_hash, dcache_ila.data_hash, dcache_ila.tag_hash, dcache_ila.vb_hash, dcache_ila.db_hash)
    }
    when (isu_ila.reg_write) {
      printf("time: %d reg_write: %d wb_rd: %x wb_write_val: %x wb_rd_history_hash: %x wb_rd_value_history_hash: %x\n",
        GTimer(), isu_ila.reg_write, isu_ila.wb_rd, isu_ila.wb_write_val, isu_ila.wb_rd_history_hash, isu_ila.wb_rd_value_history_hash)
    }
  }
  else {
    io.ila_debug := DontCare
  }
}
