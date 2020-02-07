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

case class CoreParams(
  xprlen: Int = 32,
  pipelineDebug: Boolean = false,
  ilaDebug: Boolean = false,
  useLoongson: Boolean = false,
  commitLog: Boolean = true,
  bht1Param: BHTParams = BHTParams(
    32, false, 32, 5, 2, 6
  ),
  bht2Param: BHTParams = BHTParams(
    32, false, 32, 5, 2, 6
  ),
  // BTB
  btbNSets: Int = 8,
  btbNWays: Int = 4,
  btbTagBits: Int = 8,
  // RAS
  rasStackDepth: Int = 8,
  // ROB
  nScoreboardEntries: Int = 32,
  nROBEntries: Int = 8,
  // instruction queue
  nIQEntries: Int = 4,
  // inflight branches
  nBROBEntries: Int = 4,
  nLSQEntries: Int = 4,
  usePerfCounter: Boolean = true
  )

class CoreIO(param: CoreParams) extends Bundle
{
  val imem = new MemPortIO(param.xprlen, param.xprlen)
  val dmem = new MemPortIO(param.xprlen, param.xprlen)
  val icache_control = new CacheControlPortIO(param.xprlen, param.xprlen)
  val dcache_control = new CacheControlPortIO(param.xprlen, param.xprlen)
  val mul = new MultiplierIO
  val div = new DividerIO
  val interrupt = Input(new Interrupt)
  val perf = new Bundle {
    val ifu = new IFUPerfIO
    val isu = new ISUPerfIO
    val lsu = new LSUPerfIO
    val wbu = new WBUPerfIO
  }
  val ila_debug = new Bundle {
    val isu = new ILARegWrite(param)
    val wbu = new ILACommit(param)
  }
  val loongson_debug = new LoongsonCommit(param)
  val nemu = new NEMUCommit(param)
  val nemu_cpr = new NEMUCPR(param)
}

class Core(platConfig: PlatformConfig) extends Module
{
  val param = platConfig.core

  val io = IO(new CoreIO(param))
  val ifu = Module(new IFU(param))
  val idu = Module(new IDU(param))
  val isu = Module(new ISU(param))
  val sboard = Module(new Scoreboard(param))
  val alu = Module(new ALU(param))
  val bru = Module(new BRU(param))
  val lsu = Module(new LSU(param))
  val mdu = Module(new MDU(param))
  val wbu = Module(new WBU(param))
  val cp0 = Module(new CP0(platConfig))
  val bht_1 = Module(new BHT(param.bht1Param))
  val bht_2 = Module(new BHT(param.bht2Param))

  val btb = Module(new BTB(param))
  val ras = Module(new RAS(param))
  val rob = Module(new ROB(param))
  // val iq = Module(new IQ(param))
  val brob = Module(new BROB(param))
  val lsq = Module(new LSQ(param))

  // interrupt signals
  io.interrupt <> cp0.io.interrupt

  // virtual address conversion
  ifu.io.iaddr <> cp0.io.iaddr
  lsu.io.daddr <> cp0.io.daddr

  // main data path
  io.imem <> ifu.io.imem
  ifu.io.instr <> idu.io.instr
  /*
  idu.io.decode <> iq.io.in
  iq.io.out <> isu.io.decode
  */
  idu.io.decode <> isu.io.decode
  isu.io.alu_datain <> alu.io.in
  isu.io.bru_datain <> bru.io.in
  isu.io.lsu_datain <> lsu.io.in
  isu.io.mdu_datain <> mdu.io.in
  isu.io.pru_datain <> cp0.io.in
  wbu.io.wb <> isu.io.wb

  cp0.io.icache_control <> io.icache_control
  cp0.io.dcache_control <> io.dcache_control

  // pipeline forwarding data path
  alu.io.bypass <> isu.io.alu_bypass
  bru.io.bypass <> isu.io.bru_bypass
  mdu.io.bypass <> isu.io.mdu_bypass
  lsq.io.bypass <> isu.io.lsu_bypass

  idu.io.pru_instr_commit := wbu.io.pru_instr_commit
  ifu.io.decode_pru_stall_frontend := idu.io.decode_pru_stall_frontend
  ifu.io.decode_pru_stall_frontend_pc := idu.io.decode_pru_stall_frontend_pc

  // rob
  idu.io.rob_allocate <> rob.io.allocate
  isu.io.rports <> rob.io.rports
  alu.io.rob <> rob.io.alu_wport
  bru.io.rob <> rob.io.bru_wport
  lsu.io.rob <> rob.io.lsu_wport
  mdu.io.rob <> rob.io.mdu_wport
  cp0.io.rob <> rob.io.pru_wport
  lsq.io.rob <> rob.io.lsq_wport
  wbu.io.commit <> rob.io.commit
  wbu.io.free_rob_head <> rob.io.free_rob_head

  // exception and interrupt
  wbu.io.cp0_dataout <> cp0.io.wbu_datain
  wbu.io.cp0_res <> cp0.io.cp0_res

  // flush data path
  wbu.io.flush <> ifu.io.flush
  wbu.io.flush <> idu.io.flush
  // wbu.io.delayed_flush <> iq.io.flush
  wbu.io.flush <> isu.io.flush
  wbu.io.flush <> brob.io.flush

  wbu.io.flush <> alu.io.flush
  wbu.io.flush <> bru.io.flush
  wbu.io.flush <> lsu.io.flush
  wbu.io.flush <> mdu.io.flush
  wbu.io.flush <> rob.io.flush
  wbu.io.flush <> cp0.io.flush

  // mulplier and divider
  mdu.io.mul <> io.mul
  mdu.io.div <> io.div

  // bht upate
  idu.io.bht_1 <> bht_1.io.query
  idu.io.bht_2 <> bht_2.io.query
  idu.io.btb <> btb.io.query
  idu.io.ras <> ras.io.peek
  ras.io.update <> idu.io.ras_update
  ras.io.revert <> wbu.io.ras_revert
  bht_1.io.update <> wbu.io.bht_1_update
  bht_2.io.update <> wbu.io.bht_2_update
  btb.io.update <> wbu.io.btb_update

  // brob allocate and flush
  brob.io.allocate <> idu.io.brob_allocate
  brob.io.free <> wbu.io.branch_retire

  // lsq
  lsq.io.lq_allocate <> idu.io.lq_allocate
  lsq.io.sq_allocate <> idu.io.sq_allocate
  lsq.io.lq_wport <> lsu.io.lq_wport
  lsq.io.sq_wport <> lsu.io.sq_wport
  lsq.io.retire <> wbu.io.retire
  lsq.io.dmem <> io.dmem
  lsq.io.rob_rport <> rob.io.lsq_rport
  lsq.io.flush <> wbu.io.flush
  sboard.io.flush <> wbu.io.flush

  // branch prediction
  ifu.io.bp <> idu.io.bp
  ifu.io.delayslot <> idu.io.delayslot

  // scoreboard
  sboard.io.rs <> idu.io.rs_rport
  sboard.io.rt <> idu.io.rt_rport
  sboard.io.rename <> idu.io.rename

  sboard.io.alu_wake_up <> alu.io.bypass
  sboard.io.bru_wake_up <> bru.io.bypass
  sboard.io.mdu_wake_up <> mdu.io.bypass
  sboard.io.lsu_wake_up <> lsq.io.bypass

  sboard.io.free <> wbu.io.wb

  // performance counter interfaces
  io.perf.ifu <> ifu.io.perf
  io.perf.isu <> isu.io.perf
  io.perf.lsu <> lsq.io.perf
  io.perf.wbu <> wbu.io.perf

  io.ila_debug.isu <> isu.io.ila_debug
  io.ila_debug.wbu <> wbu.io.ila_debug

  io.loongson_debug <> wbu.io.loongson_debug
  io.nemu <> isu.io.nemu
  io.nemu_cpr <> cp0.io.nemu_cpr
}
