package NPC

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

import NPCConstants._
import Common._
import Common.Util._
import ReferenceChipBackend._
import scala.collection.mutable.ArrayBuffer
import scala.collection.mutable.HashMap


object ReferenceChipBackend {
  val initMap = new HashMap[Module, Bool]()
}

trait CommonConfig {
  // platform
  val xprlen = 32
  val useSim = false
  val memportDebug = false
  val axi4Debug = false
  val tlbSize = 64

  // core
  val nBHT1Entries = 128
  val bht1CounterIndexWidth = 7
  val bht1CounterWidth = 2
  val bht1HistoryLength = 1

  val nBHT2Entries = 128
  val bht2CounterIndexWidth = 7
  val bht2CounterWidth = 2
  val bht2HistoryLength = 4

  val btbNSets = 16
  val btbNWays = 4
  val btbTagBits = 16
  val rasStackDepth = 8
  val nScoreboardEntries = 32
  val nROBEntries = 8
  val nIQEntries = 4
  val nBROBEntries = 32
  val nLSQEntries = 4
  val pipelineDebug = false
  val commitLog = false

  // L1 ICache
  val icacheNSets = 256
  val icacheNWays = 4
  val icacheDebug = false

  // L1 Dcache
  val dcacheNSets = 256
  val dcacheNWays = 4
  val dcacheDebug = false

  val useAXI4Splitter = false

  // L2 cache
  val l2NSets = 128
  val l2NWays = 16
  val l2Debug = false
  val useL2Cache = false

  val innerIdWidth = 2
  val innerAXI4DataWidth = 64

  // loongson debug
  val useLoongson = false
}

trait SimConfig extends CommonConfig {
  // platform
  val extAXI4MemoryIdWidth = 5
  val extAXI4MemoryBusWidth = 64
  val extAXI4MMIOIdWidth = 5
  val extAXI4MMIOBusWidth = 64

  override val useSim = true
  override val memportDebug = false
  override val axi4Debug = false

  // core
  override val pipelineDebug = false
  val ilaDebug = false
  override val commitLog = false
  val usePerfCounter = true

  // L1 ICache
  override val icacheDebug = false

  // L1 Dcache
  override val dcacheDebug = false

  override val useAXI4Splitter = false
  override val useL2Cache = false

  // SimAXIMem
  val simMemReadLatency = 1
  val simMemWriteLatency = 1
}

class SimTop extends Module with SimConfig
{
  val bht1Params = BHTParams(xprlen, pipelineDebug, nBHT1Entries,
    bht1CounterIndexWidth, bht1CounterWidth, bht1HistoryLength)
  val bht2Params = BHTParams(xprlen, pipelineDebug, nBHT2Entries,
    bht2CounterIndexWidth, bht2CounterWidth, bht2HistoryLength)

  val idWidth = if (useL2Cache) innerIdWidth else extAXI4MemoryIdWidth
  val dataWidth = if (useL2Cache) innerAXI4DataWidth else extAXI4MemoryBusWidth
  val platformParam = PlatformParams(xprlen, idWidth,
    dataWidth, extAXI4MMIOIdWidth, extAXI4MMIOBusWidth,
    useSim, memportDebug, axi4Debug, ilaDebug, tlbSize)
  val coreParam = CoreParams(xprlen, pipelineDebug, ilaDebug, useLoongson, commitLog,
    bht1Params, bht2Params,
    btbNSets, btbNWays, btbTagBits, rasStackDepth,
    nScoreboardEntries, nROBEntries, nIQEntries, nBROBEntries, nLSQEntries, usePerfCounter)
  val icacheParam = L1CacheParams(icacheNSets, icacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, icacheDebug, ilaDebug)
  val dcacheParam = L1CacheParams(dcacheNSets, dcacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, dcacheDebug, ilaDebug)
  val platformConfig = PlatformConfig(platformParam, coreParam, icacheParam, dcacheParam)
  val l2CacheParam = L2CacheParams(l2NSets, l2NWays, xprlen,
    innerIdWidth, innerAXI4DataWidth, extAXI4MemoryIdWidth, extAXI4MemoryBusWidth, l2Debug)

  val io = IO(new Bundle {
    val nemu = new NEMUCommit(coreParam)
    val nemu_cpr = new NEMUCPR(coreParam)
  })

  val tile = Module(new NPCTile(platformConfig))
  val axi4Arb = Module(new NaiveAXI4XArbiter(2, innerIdWidth - 1, innerAXI4DataWidth))
  val simAXIMem = Module(new SimAXIMem())

  io.nemu <> tile.io.nemu
  io.nemu_cpr <> tile.io.nemu_cpr

  tile.io.interrupt := 0.U.asTypeOf(tile.io.interrupt)

  tile.io.dmem <> axi4Arb.io.in(0)
  tile.io.imem <> axi4Arb.io.in(1)
  tile.io.mmio <> DontCare

  val axi4Splitter = if (useAXI4Splitter) Some(Module(new AXIBeatSpliter(l2CacheParam))) else None
  val l2Cache = if (useL2Cache) Some(Module(new SimpleL2(l2CacheParam))) else None

  val tile_axi = if (useAXI4Splitter) axi4Splitter.get.io.out else axi4Arb.io.out
  val system_axi = if (useL2Cache) l2Cache.get.io.out else tile_axi

  if (useAXI4Splitter) {
    axi4Arb.io.out <> axi4Splitter.get.io.in
    if (axi4Debug) {
      axi4Splitter.get.io.out.dump("splitter axi ")
    }
  }

  if (useL2Cache) {
    if (axi4Debug) {
      l2Cache.get.io.out.dump("l2 out axi ")
    }
    l2Cache.get.io.in <> tile_axi
  }

  simAXIMem.io.clock := clock
  simAXIMem.io.reset := reset

  simAXIMem.io.axi.ar <> system_axi.ar
  simAXIMem.io.axi.aw <> system_axi.aw
  simAXIMem.io.axi.w  <> system_axi.w
  system_axi.r <> LatencyPipe(simAXIMem.io.axi.r, simMemReadLatency)
  system_axi.b <> LatencyPipe(simAXIMem.io.axi.b, simMemWriteLatency)

  val mul = Module(new Multiplier())
  val div = Module(new Divider())

  mul.io.clk := clock
  div.io.clk := clock

  mul.io.data <> tile.io.mul
  div.io.data <> tile.io.div
}

trait FPGAConfig extends CommonConfig {
  val extAXI4MemoryIdWidth = 3
  val extAXI4MemoryBusWidth = 64
  val extAXI4MMIOIdWidth = 3
  val extAXI4MMIOBusWidth = 64

  // L1 Icache
  override val icacheNSets = 64
  override val icacheNWays = 4
  override val icacheDebug = false

  // L1 Dcache
  override val dcacheNSets = 64
  override val dcacheNWays = 4
  override val dcacheDebug = false

  // L2 cache
  override val l2NSets = 64
  override val l2NWays = 16
  override val l2Debug = false

  // core
  override val useL2Cache = true
  val ilaDebug = false
  val usePerfCounter = false
}

class FPGATop extends Module with FPGAConfig
{
  val io = IO(new Bundle {
    val mem = new AXI4IO(id_width = extAXI4MemoryIdWidth, data_width = extAXI4MemoryBusWidth)
    val imem = new AXI4IO(id_width = extAXI4MemoryIdWidth - 1, data_width = extAXI4MemoryBusWidth)
    val dmem = new AXI4IO(id_width = extAXI4MemoryIdWidth - 1, data_width = extAXI4MemoryBusWidth)
    val mmio = new AXI4IO(id_width = extAXI4MMIOIdWidth - 1, data_width = extAXI4MMIOBusWidth)
    val mul = new MultiplierIO
    val div = new DividerIO
  })

  // on FPGA, we can not printf
  // so only ilaDebug works, all other Debugs are useless
  // turning on Debug will consume significantly more hardware resources
  require(!useSim)
  require(!memportDebug)
  require(!axi4Debug)
  require(!pipelineDebug)
  require(!commitLog)
  require(!icacheDebug)
  require(!dcacheDebug)

  val bht1Params = BHTParams(xprlen, pipelineDebug, nBHT1Entries,
    bht1CounterIndexWidth, bht1CounterWidth, bht1HistoryLength)
  val bht2Params = BHTParams(xprlen, pipelineDebug, nBHT2Entries,
    bht2CounterIndexWidth, bht2CounterWidth, bht2HistoryLength)

  val idWidth = if (useL2Cache) innerIdWidth else extAXI4MemoryIdWidth
  val dataWidth = if (useL2Cache) innerAXI4DataWidth else extAXI4MemoryBusWidth
  val platformParam = PlatformParams(xprlen, idWidth,
    dataWidth, extAXI4MMIOIdWidth, extAXI4MMIOBusWidth,
    useSim, memportDebug, axi4Debug, ilaDebug, tlbSize)
  val coreParam = CoreParams(xprlen, pipelineDebug, ilaDebug, useLoongson, commitLog,
    bht1Params, bht2Params,
    btbNSets, btbNWays, btbTagBits, rasStackDepth,
    nScoreboardEntries, nROBEntries, nIQEntries, nBROBEntries, nLSQEntries, usePerfCounter)
  val icacheParam = L1CacheParams(icacheNSets, icacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, icacheDebug, ilaDebug)
  val dcacheParam = L1CacheParams(dcacheNSets, dcacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, dcacheDebug, ilaDebug)
  val platformConfig = PlatformConfig(platformParam, coreParam, icacheParam, dcacheParam)
  val l2CacheParam = L2CacheParams(l2NSets, l2NWays, xprlen,
    innerIdWidth, innerAXI4DataWidth, extAXI4MemoryIdWidth, extAXI4MemoryBusWidth, l2Debug)

  val tile = Module(new NPCTile(platformConfig))
  if (useAXI4Splitter || useL2Cache) {
    val axi4Arb = Module(new NaiveAXI4XArbiter(2, innerIdWidth - 1, innerAXI4DataWidth))
    val axi4Splitter = if (useAXI4Splitter) Some(Module(new AXIBeatSpliter(l2CacheParam))) else None
    val l2Cache = if (useL2Cache) Some(Module(new SimpleL2(l2CacheParam))) else None

    val tile_axi = if (useAXI4Splitter) axi4Splitter.get.io.out else axi4Arb.io.out
    val system_axi = if (useL2Cache) l2Cache.get.io.out else tile_axi

    if (useAXI4Splitter) {
      axi4Arb.io.out <> axi4Splitter.get.io.in
      if (axi4Debug) {
        axi4Splitter.get.io.out.dump("splitter axi ")
      }
    }

    if (useL2Cache) {
      if (axi4Debug) {
        l2Cache.get.io.out.dump("l2 out axi ")
      }
      l2Cache.get.io.in <> tile_axi
    }

    tile.io.dmem <> axi4Arb.io.in(0)
    tile.io.imem <> axi4Arb.io.in(1)
    io.mem <> system_axi
    io.dmem <> DontCare
    io.imem <> DontCare
  } else {
    tile.io.dmem <> io.dmem
    tile.io.imem <> io.imem
    io.mem <> DontCare
  }

  tile.io.mul <> io.mul
  tile.io.div <> io.div
  tile.io.mmio <> io.mmio
  tile.io.interrupt := 0.U.asTypeOf(tile.io.interrupt)
}

trait LoongsonConfig extends CommonConfig {
  // platform
  val extAXI4IdWidth = 4
  val extAXI4MemoryIdWidth = 4
  val extAXI4MemoryBusWidth = 32
  val extAXI4MMIOIdWidth = 4
  val extAXI4MMIOBusWidth = 32

  // core
  // loongson perf tests' working sets are small enough to fit into a large dcache
  override val icacheNSets = 256
  override val dcacheNSets = 256

  // core
  override val commitLog = false
  val ilaDebug = false
  val usePerfCounter = false

  // loongson debug
  override val useLoongson = true
}

class LoongsonTop(useCache:Boolean=true) extends Module with LoongsonConfig {
  val bht1Params = BHTParams(xprlen, pipelineDebug, nBHT1Entries,
    bht1CounterIndexWidth, bht1CounterWidth, bht1HistoryLength)
  val bht2Params = BHTParams(xprlen, pipelineDebug, nBHT2Entries,
    bht2CounterIndexWidth, bht2CounterWidth, bht2HistoryLength)

  val idWidth = if (useL2Cache) innerIdWidth else extAXI4MemoryIdWidth
  val dataWidth = if (useL2Cache) innerAXI4DataWidth else extAXI4MemoryBusWidth
  val platformParam = PlatformParams(xprlen, idWidth,
    dataWidth, extAXI4MMIOIdWidth, extAXI4MMIOBusWidth,
    useSim, memportDebug, axi4Debug, ilaDebug, tlbSize)
  val coreParam = CoreParams(xprlen, pipelineDebug, ilaDebug, useLoongson, commitLog,
    bht1Params, bht2Params,
    btbNSets, btbNWays, btbTagBits, rasStackDepth,
    nScoreboardEntries, nROBEntries, nIQEntries, nBROBEntries, nLSQEntries, usePerfCounter)
  val icacheParam = L1CacheParams(icacheNSets, icacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, icacheDebug, ilaDebug)
  val dcacheParam = L1CacheParams(dcacheNSets, dcacheNWays, xprlen, xprlen,
    idWidth - 1, dataWidth, dcacheDebug, ilaDebug)
  val platformConfig = PlatformConfig(platformParam, coreParam, icacheParam, dcacheParam)
  val l2CacheParam = L2CacheParams(l2NSets, l2NWays, xprlen,
    innerIdWidth, innerAXI4DataWidth, extAXI4MemoryIdWidth, extAXI4MemoryBusWidth, l2Debug)

  val io = IO(new Bundle {
    val mem = new AXI4IO(id_width = extAXI4MemoryIdWidth, data_width = extAXI4MemoryBusWidth)
    val imem = new AXI4IO(id_width = extAXI4MemoryIdWidth - 1, data_width = extAXI4MemoryBusWidth)
    val dmem = new AXI4IO(id_width = extAXI4MemoryIdWidth - 1, data_width = extAXI4MemoryBusWidth)
    val mmio = new AXI4IO(id_width = extAXI4MMIOIdWidth - 1, data_width = extAXI4MMIOBusWidth)
    val debug = new LoongsonCommit(coreParam)
    val mul = new MultiplierIO
    val div = new DividerIO
    val interrupt = Input(new Interrupt)
  })

  if(useCache) {
    val tile = Module(new NPCTile(platformConfig))
    // since the working set of Loongson benchmarks are small enough to fit in a large data cache(32K)
    // adding a L2 cache does not help much
    // if you do need a L2 cache
    // do not forget to modify the cpu block design
    if (useL2Cache) {
      val axi4Arb = Module(new NaiveAXI4XArbiter(2, innerIdWidth - 1, innerAXI4DataWidth))
      val l2Cache = Module(new SimpleL2(l2CacheParam))
      tile.io.dmem <> axi4Arb.io.in(0)
      tile.io.imem <> axi4Arb.io.in(1)
      l2Cache.io.in <> axi4Arb.io.out
      l2Cache.io.out <> io.mem
      io.dmem <> DontCare
      io.imem <> DontCare
    } else {
      tile.io.dmem <> io.dmem
      tile.io.imem <> io.imem
      io.mem <> DontCare
    }
    tile.io.mul <> io.mul
    tile.io.div <> io.div
    tile.io.mmio <> io.mmio
    tile.io.loongson_debug <> io.debug

    tile.io.interrupt := io.interrupt
  } else {
    val core = Module(new Core(platformConfig))
    val imem = Module(new LoongsonMemport2AXI4NaiveBridge(
      extAXI4MemoryIdWidth - 1, xprlen, extAXI4MemoryBusWidth))
    val dmem = Module(new LoongsonMemport2AXI4NaiveBridge(
      extAXI4MemoryIdWidth - 1, xprlen, extAXI4MemoryBusWidth))
    val mmio = Module(new MemPort2AXIBridge(xprlen, xprlen,
      extAXI4MMIOIdWidth - 1, extAXI4MMIOBusWidth))
    val perf = Module(new MemPort2AXIBridge(xprlen, xprlen,
      extAXI4MMIOIdWidth - 1, extAXI4MMIOBusWidth))
    val crossbar = Module(new MemCrossbar(coreParam, xprlen, xprlen))

    core.io.imem <> imem.io.in
    core.io.dmem <> crossbar.io.in
    crossbar.io.out(0) <> dmem.io.in
    crossbar.io.out(1) <> mmio.io.in
    crossbar.io.out(2) <> perf.io.in // for perfcounter

    perf.io.out <> DontCare

    io.mem  <> DontCare
    io.imem <> imem.io.out
    io.dmem <> dmem.io.out
    io.mmio <> mmio.io.out

    core.io.mul <> io.mul
    core.io.div <> io.div
    core.io.loongson_debug <> io.debug

    core.io.interrupt := io.interrupt
  }
}

object elaborate extends ChiselFlatSpec {
  def main(args: Array[String]): Unit = {
    // the first arguments tells which Top to use
    // remaining arguments are for chisel
    val top = args(0)
    val chiselArgs = args.slice(1, args.length)
    if (top == "SimTop")
      chisel3.Driver.execute(chiselArgs, () => new SimTop)
    else if (top == "FPGATop")
      chisel3.Driver.execute(chiselArgs, () => new FPGATop)
    else if (top == "LoongsonTop")
      chisel3.Driver.execute(chiselArgs, () => new LoongsonTop(true))
    else if (top == "LoongsonTopNoCache")
      chisel3.Driver.execute(chiselArgs, () => new LoongsonTop(false))
    else
      assert(0, "please specify a top");
  }
}
