package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._
import Common.CP0Regs._
import scala.collection.mutable.LinkedHashMap

import ExtOperation._

class CP0_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(DecoupledIO(new ISU_PRU_DATAIN(param)))
  val rob = ValidIO(new ROBWPort(param))
  val flush = Flipped(ValidIO(new Flush(param)))

  val icache_control = new CacheControlPortIO(param.xprlen, param.xprlen)
  val dcache_control = new CacheControlPortIO(param.xprlen, param.xprlen)

  val cp0_res = new CP0_RES(param)
  val wbu_datain = Flipped(ValidIO(new ExceptionInfo(param)))

  val interrupt = Input(new Interrupt)

  val iaddr = Flipped(new TLBTransaction(param))
  val daddr = Flipped(new TLBTransaction(param))

  val nemu_cpr = new NEMUCPR(param)

  override def cloneType = { new CP0_IO(param).asInstanceOf[this.type] }
}

class TLBPhyn extends Bundle {
  val pfn = UInt(25.W)
  val c   = UInt(2.W)  // cache coherency
  val d   = Bool()  // dirty bit
  val v   = Bool()  // valid bit
}

// stored in CAM
class TLBEntry extends Bundle {
  // the only support paging mode is 4KB page
  // which corresponding to 00000000.U
  def pagemask = Fill(19, 0.U(1.W)).asUInt

  val vpn  = UInt(19.W)
  val g    = Bool()
  val asid = UInt(8.W)
}

// stored in RAM
class TLBPhynEntry extends Bundle {
  val p0 = new TLBPhyn
  val p1 = new TLBPhyn
}

class TLBVaddrMapped extends Bundle {
  val vpn = UInt(19.W)  // 31...13
  val odd = Bool()      // should be caculated, may not at here
  val off = UInt(12.W)
}

class CP0(platConfig: PlatformConfig) extends Module
{
  val param = platConfig.core
  val io = IO(new CP0_IO(param))

  val tlbSize = platConfig.platform.tlbSize

  // map to CAM
  val tlb = Mem(tlbSize, new TLBEntry)

  // map to RAM, 2r, 1w
  val tlb_phyn = Mem(tlbSize, new TLBPhynEntry)

  val tlbIndexBits = log2Up(tlbSize)
  val tlb_rport_addr = Wire(Vec(2, UInt(width = tlbIndexBits.W)))
  val tlb_rport_val = Wire(Vec(2, new TLBPhynEntry))
  (0 until 2).foreach(i => tlb_rport_val(i) := tlb_phyn(tlb_rport_addr(i)))

  // translation read ports
  val tlb_translate_rport_addr = Wire(Vec(2, UInt(width = tlbIndexBits.W)))

  val cp0_tlb_ren = Wire(Bool())
  val cp0_tlb_raddr = Wire(UInt(width = tlbIndexBits.W))
  cp0_tlb_ren := N
  cp0_tlb_raddr := 0.U

  tlb_rport_addr(0) := tlb_translate_rport_addr(0)
  tlb_rport_addr(1) := Mux(cp0_tlb_ren,
    cp0_tlb_raddr, tlb_translate_rport_addr(1))

  val tlb_wport_wen = Wire(Bool())
  val tlb_wport_addr = Wire(UInt(width = tlbIndexBits.W))
  val tlb_wport_val = Wire(new TLBPhynEntry)
  when (tlb_wport_wen) {
    tlb_phyn(tlb_wport_addr) := tlb_wport_val
  }

  val rst_tlb_wen = Wire(Bool())
  val rst_tlb_waddr = Wire(UInt(width = tlbIndexBits.W))
  val rst_tlb_wval = Wire(new TLBPhynEntry)
  val cp0_tlb_wen = Wire(Bool())
  val cp0_tlb_waddr = Wire(UInt(width = tlbIndexBits.W))
  val cp0_tlb_wval = Wire(new TLBPhynEntry)

  cp0_tlb_wen := N
  cp0_tlb_waddr := 0.U
  cp0_tlb_wval := 0.U.asTypeOf(new TLBPhynEntry)

  tlb_wport_wen := rst_tlb_wen || cp0_tlb_wen
  tlb_wport_addr := Mux(rst_tlb_wen, rst_tlb_waddr, cp0_tlb_waddr)
  tlb_wport_val := Mux(rst_tlb_wen, rst_tlb_wval, cp0_tlb_wval)

  val index     = Reg(new CP0Index(platConfig))
  def random    = Reg(new CP0Random(platConfig))
  val entry_lo0 = Reg(new CP0EntryLO)
  val entry_lo1 = Reg(new CP0EntryLO)
  val entry_hi  = Reg(new CP0EntryHI)
  val context   = Reg(new CP0Context)
  val pagemask  = Reg(new CP0PageMask)
  val wired     = Reg(new CP0Wired(platConfig))

  val base      = RegInit(0.U(param.xprlen.W))       // 7, 0
  val badvaddr  = RegInit(0.U(param.xprlen.W))       // 8, 0
  val count0    = RegInit(1.U(param.xprlen.W))       // 9, 0
  val count1    = RegInit(0.U(param.xprlen.W))       // 9, 1
  val compare   = RegInit("hFFFFFFFF".U(param.xprlen.W)) // 11, 0

  // 12, 0
  // val status    = RegInit(0x1000FF02.U.asTypeOf(new CP0Status))
  val status    = Reg(new CP0Status)
  // 13, 0
  val cause     = Reg(new CP0Cause)
  val epc       = RegInit(0.U)       // 14, 0
  val prid      = Reg(new CP0Prid)
  val config    = Reg(new CP0Config)
  val config1   = Reg(new CP0Config1)

  // assertions
  require(status.getWidth == 32)
  require(cause.getWidth == 32)

  // do some initializations
  when(reset.toBool) {
    index.init(platConfig)
    random.init(platConfig)
    entry_lo0.init(platConfig)
    entry_lo1.init(platConfig)
    context.init(platConfig)
    pagemask.init(platConfig)
    wired.init(platConfig)
    status.init(platConfig)
    cause.init(platConfig)
    prid.init(platConfig)
    config.init(platConfig)
    config1.init(platConfig)

    for(i <- 0 until tlbSize) {
      tlb(i) := 0.U.asTypeOf(new TLBEntry)
    }
  }
  // ***************************** reset TLBPhyn valid dirty *****************************
  val rst_cnt = RegInit(0.asUInt(log2Up(2 * tlbSize + 1).W))
  val rst = (rst_cnt < (2 * tlbSize).U) && !reset.toBool
  when (rst) { rst_cnt := rst_cnt + 1.U }

  rst_tlb_wen := rst
  rst_tlb_waddr := rst_cnt
  rst_tlb_wval := 0.U.asTypeOf(new TLBPhynEntry)

  val vs_valid = WireInit(N)

  // update random register per cycle
  random.index := LFSR16(io.in.asUInt.xorR)

  // vpn: virtual page no
  def tlb_match(entry:TLBEntry, vpn:UInt):Bool = {
    val match_vpn = ((entry.vpn & ~entry.pagemask) ===
        (vpn & ~entry.pagemask))
    val match_asid = (entry.g || entry.asid === entry_hi.asid)
    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        // when(match_vpn && match_asid && vs_valid) {
        when(vs_valid) {
          printf("time %d: [TLB_MATCH] entry.vpn %x, entry.mask %x, vpn %x, g %x, asid %x <> %x, matched %x\n",
            GTimer(), entry.vpn, entry.pagemask, vpn, entry.g, entry.asid, entry_hi.asid, match_vpn && match_asid)
        }
      }
    }
    match_vpn && match_asid
  }

  def tlb_fetch_phyn(tlb_rport: Int, hit_way:UInt, entry:TLBEntry, vaddr:UInt):TLBPhyn = {
    val ext_mask = Cat(entry.pagemask, "b1".U(1.W))
    val mask = (Cat(0.U(1.W), ext_mask >> 1)) ^ ext_mask
    val tmask = Cat(mask, 0.U(12.W))
    tlb_translate_rport_addr(tlb_rport) := hit_way
    val pentry = tlb_rport_val(tlb_rport)
    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        when(vs_valid) {
          printf("time %d: [TLB_FETCH_PHYN] ext_mask %x, mask %x, tmask %x, vaddr %x, p.sel %x, d %x %x\n",
            GTimer(), ext_mask, mask, tmask, vaddr, (vaddr & tmask)(31, 12).orR, pentry.p0.d, pentry.p1.d)
        }
      }
    }
    Mux((vaddr & tmask)(31, 12).orR, pentry.p1, pentry.p0)
  }

  /* valid pagemask
   * 2#0000000000000000: EvenOddBit <- 12
   * 2#0000000000000011: EvenOddBit <- 14
   * 2#0000000000001111: EvenOddBit <- 16
   * 2#0000000000111111: EvenOddBit <- 18
   * 2#0000000011111111: EvenOddBit <- 20
   * 2#0000001111111111: EvenOddBit <- 22
   * 2#0000111111111111: EvenOddBit <- 24
   * 2#0011111111111111: EvenOddBit <- 26
   * 2#1111111111111111: EvenOddBit <- 28
   */
  def tlb_to_paddr(mask:UInt, p:TLBPhyn, vaddr:UInt):UInt = {
    val m_12_0 = 0.U(12.W)
    val m_12_1 = ((1 << 12) - 1).U(12.W)
    val pfn_mask = ~(mask.ZExt(p.pfn.getWidth))
    val addr_mask = Cat(mask.ZExt(20), m_12_1)
    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        when(vs_valid) {
          printf("time %d: [TLB_TO_PADDR] p.pfn:%x, vaddr %x\n", GTimer(), p.pfn, vaddr)
        }
      }
    }
    ((Cat(p.pfn & pfn_mask, m_12_0)) | (vaddr & addr_mask))(31, 0)
  }

  /* virtual address to physical address translation */
  case class TLB_RES(etw:UInt, paddr:UInt)
  def tlb_translate(req:TLBRequest, tlb_rport: Int) = {
    val is_store = req.fcn === M_XWR
    val vaddr = req.vaddr
    val maddr = vaddr.asTypeOf(new TLBVaddrMapped)
    val matched = Vec((0 until tlbSize).map(i => tlb_match(tlb(i), maddr.vpn)))
    val hit_way = Wire(Bits())
    hit_way := Bits(0)
    (0 until tlbSize).foreach(i => when (matched(i)) { hit_way := Bits(i) })
    val vaddr_missed = !(matched.asUInt.orR)
    val entry = tlb(hit_way)
    val is_unmapped = VAddr(vaddr).isUnmapped.orR /* || (
      VAddr(vaddr).isUserMapped.orR && status.ERL.orR) */
    val p = tlb_fetch_phyn(tlb_rport, hit_way, entry, vaddr)
    val paddr = Mux(is_unmapped, VAddr(vaddr).toPhsical,
      tlb_to_paddr(entry.pagemask, p, vaddr))
    val tlb_etw = Mux(vaddr_missed,
      Mux(is_store, ET_TLBS, ET_TLBL),
      Mux(is_store && p.d === 0.U, ET_Mod, 0.U))
    val etw = Mux(is_unmapped, 0.U, tlb_etw)
    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        when(vs_valid) {
          printf("time %d: [TLB_TRANSLATE] matched:%x, p.d %x\n", GTimer(), matched.asUInt, p.d)
          printf("time %d: [TLB_TRANSLATE] vaddr:%x, paddr:%x, matched.orR: %x, vaddr_missed: %x, is_unmapped: %x, etw:%x, d %x\n",
            GTimer(), vaddr, paddr, matched.asUInt.orR, vaddr_missed, is_unmapped, etw, p.d)
        }
      }
    }
    new TLB_RES(etw, paddr)
  }

  def tlb_present():Unit = {
    val matched = Cat(
      for(i <- 0 until tlbSize) yield tlb_match(tlb(i), entry_hi.vpn)
    )
    index.p := !(matched.orR) // 0: matched, 1: unmatched
    index.index := Mux1H(for(i <- 0 until tlbSize) yield
      matched(i) -> i.U)
  }

  def tlb_read(i:UInt):Unit = {
    // index registers
    val entry = tlb(i)
    pagemask.write(entry.pagemask)
    entry_hi.vpn := entry.vpn & ~entry.pagemask
    entry_hi.asid := entry.asid

    cp0_tlb_raddr := i
    val pentry = tlb_rport_val(1)
    entry_lo0.pfn := pentry.p0.pfn & ~entry.pagemask
    entry_lo0.c := pentry.p0.c
    entry_lo0.d := pentry.p0.d
    entry_lo0.v := pentry.p0.v
    entry_lo0.g := entry.g

    entry_lo1.pfn := pentry.p1.pfn & ~entry.pagemask
    entry_lo1.c := pentry.p1.c
    entry_lo1.d := pentry.p1.d
    entry_lo1.v := pentry.p1.v
    entry_lo1.g := entry.g
  }

  def tlb_write(i:UInt):Unit = {
    val entry = tlb(i)
    val mask = ~(pagemask.mask.ZExt(32))
    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        printf("time %d: tlb write, vpn %x, 0.pfn %x, 1.pfn %x, mask %x -> %x\n", GTimer(), entry_hi.vpn, entry_lo0.pfn, entry_lo1.pfn, pagemask.mask, mask)
        printf("time %d: tlb write, 0(v %x, c %x, d %x), 1(v %x, c %x, d %x)\n", GTimer(), entry_lo0.v, entry_lo0.c, entry_lo0.d,
          entry_lo1.v, entry_lo1.c, entry_lo1.d)
      }
    }
    // entry.pagemask := pagemask.mask
    entry.vpn := entry_hi.vpn & mask
    entry.asid := entry_hi.asid

    entry.g := entry_lo0.g & entry_lo1.g

    tlb_wport_addr := i
    val pentry = cp0_tlb_wval
    pentry.p0.pfn := entry_lo0.pfn & mask
    pentry.p0.c := entry_lo0.c
    pentry.p0.d := entry_lo0.d
    pentry.p0.v := entry_lo0.v

    pentry.p1.pfn := entry_lo1.pfn & mask
    pentry.p1.c := entry_lo1.c
    pentry.p1.d := entry_lo1.d
    pentry.p1.v := entry_lo1.v
  }

  if(param.pipelineDebug) {
    when (TraceTrigger()) {
      when(io.iaddr.req.fire() && VAddr(io.iaddr.req.bits.vaddr).isUserMapped) {
        printf("time %d: iaddr req: %x, fcn:%x\n", GTimer(), io.iaddr.req.bits.vaddr, io.iaddr.req.bits.fcn);
      }

      when(io.iaddr.resp.valid && VAddr(io.iaddr.req.bits.vaddr).isUserMapped) {
        printf("time %d: iaddr resp: %x, etw:%x\n", GTimer(), io.iaddr.resp.bits.paddr, io.iaddr.resp.bits.etw);
      }

      when(io.daddr.req.fire() && VAddr(io.daddr.req.bits.vaddr).isUserMapped) {
        printf("time %d: daddr req: %x, fcn:%x\n", GTimer(), io.daddr.req.bits.vaddr, io.daddr.req.bits.fcn);
      }

      when(io.daddr.resp.valid && VAddr(io.daddr.req.bits.vaddr).isUserMapped) {
        printf("time %d: daddr resp: %x, etw:%x\n", GTimer(), io.daddr.resp.bits.paddr, io.daddr.resp.bits.etw);
      }
    }
  }

  val ires = tlb_translate(io.iaddr.req.bits, 0)
  val ireq_valid = io.iaddr.req.valid
  io.iaddr.req.ready := Y
  io.iaddr.resp.valid := ireq_valid
  io.iaddr.resp.bits.etw := Mux(ireq_valid, ires.etw, 0.U)
  io.iaddr.resp.bits.paddr := ires.paddr

  if(param.pipelineDebug) {
    when (TraceTrigger()) {
      printf("---------------------------\n");
    }
  }


  // multiplex cache instructions address translation with dcache's address translation port
  // this works, because when we are executing pru instrs,
  // rob is empty, there are no dcache address translation going on
  // Priority is given to lower producer(cache instruction)
  val daddr_arb = Module(new Arbiter(new TLBRequest(param), 2))
  daddr_arb.io.out.ready := io.daddr.req.ready
  daddr_arb.io.in(1) <> io.daddr.req

  val dres = tlb_translate(daddr_arb.io.out.bits, 1)
  val dreq_valid = daddr_arb.io.out.valid
  io.daddr.req.ready := Y
  io.daddr.resp.valid := dreq_valid
  io.daddr.resp.bits.etw := Mux(dreq_valid, dres.etw, 0.U)
  io.daddr.resp.bits.paddr := dres.paddr

  val iaddr_tlb_req = io.iaddr.req.valid && VAddr(io.iaddr.req.bits.vaddr).isUserMapped
  val daddr_tlb_req = dreq_valid && VAddr(daddr_arb.io.out.bits.vaddr).isUserMapped
  vs_valid := iaddr_tlb_req || daddr_tlb_req

  // timer interrupt, disable it for loongson test
  val compare_valid = compare === count0

  io.nemu_cpr.count0 := count0

  /*---------software interrupt wires---------*/
  // cause.IP(0) := N & status.IM(0)
  // cause.IP(1) := N & status.IM(1)
  /*-----------hardware interrupts------------*/
  for(i <- 0 until io.interrupt.getWidth - 1) {
    when(io.interrupt.bits(i) && status.IE) {
      cause.IP(i + 2) := Y
    }
  }

  /* enable timer interrupt */
  when((io.interrupt.bits(io.interrupt.bits.getWidth - 1)
    || compare_valid) && status.IE) {
    cause.IP(7) := Y
  }


  // interrupt and exception
  val has_hw_intr = Cat(for(i <- 2 until 8) yield cause.IP(i) & status.IM(i)).orR
  val has_sw_intr = Cat(for(i <- 0 until 2) yield cause.IP(i) & status.IM(i)).orR
  val intr_valid = (has_hw_intr || has_sw_intr) && status.IE && !status.EXL
  val etw = io.wbu_datain.bits.etw | (intr_valid << ETB_INT)
  val has_exception = io.wbu_datain.valid && etw.orR
  val code = MuxCase(0.U, Array(
    etw(ETB_INT) -> EXC_INTR,
    etw(ETB_AdEL_IF) -> EXC_AdEL,
    etw(ETB_SYSCALL) -> EXC_SYSCALL,
    etw(ETB_INVOP) -> EXC_RI,
    etw(ETB_OV) -> EXC_OV,
    etw(ETB_TRAP) -> EXC_TRAP,
    etw(ETB_BP) -> EXC_BP,
    etw(ETB_AdEL_LD) -> EXC_AdEL,
    etw(ETB_AdES) -> EXC_AdES,
    etw(ETB_TLBL) -> EXC_TLBL,
    etw(ETB_TLBS) -> EXC_TLBS,
    etw(ETB_Mod) -> EXC_Mod,
    etw(ETB_TRAP) -> EXC_TRAP))

  val tlb_except = etw(ETB_TLBL) | etw(ETB_TLBS) | etw(ETB_Mod)

  // user base is default to be 0 when in kernel mode
  io.cp0_res.spr_valid := etw.orR
  io.cp0_res.seg_base := Mux(etw(ETB_eret), base, 0.U)
  io.cp0_res.has_exception := has_exception
  io.cp0_res.flush_addr := Mux(etw(ETB_eret), epc,
    Mux(tlb_except, "hbfc00000".U, "hbfc00380".U)
  )

  when(has_exception && !etw(ETB_eret)) {
    val pc = io.wbu_datain.bits.pc
    epc := Mux(io.wbu_datain.bits.is_delayslot, pc - 4.U,
      Mux(has_sw_intr, pc + 4.U, pc))
    cause.ExcCode := code
    status.EXL := true.B
    when(io.wbu_datain.bits.is_delayslot) {
      cause.BD := true.B
    }

    val update_badvaddr = Mux1H(Array(
      etw(ETB_AdEL_IF) -> Y,
      etw(ETB_AdEL_LD) -> Y,
      etw(ETB_AdES) -> Y,
      etw(ETB_TLBL) -> Y,
      etw(ETB_TLBS) -> Y,
      etw(ETB_Mod) -> Y))

    // update badvaddr
    when(update_badvaddr) {
      badvaddr := io.wbu_datain.bits.badvaddr
    }

    if(param.pipelineDebug) {
      when (TraceTrigger()) {
        // some logs
        printf("time: %d [cp0]: exception valid, ip:%x, etw:%x, pc:%x, code:%x\n", GTimer(), cause.IP.asUInt, etw, io.wbu_datain.bits.pc, code)
        printf("time: %d [cp0]: etw:%x, epc:%x, badvaddr:%x\n", GTimer(), etw, io.wbu_datain.bits.pc, io.wbu_datain.bits.badvaddr)
        printf("time: %d [cp0]: compare:%x, count0:%x, timer_intr:%x\n", GTimer(), compare, count0, cause.IP(7))
        printf("time: %d [cp0]: IE:%x, EXL:%x, epc:%x\n",
          GTimer(), status.IE, status.EXL, io.wbu_datain.bits.pc)
        printf("\n");
      }
    }
  } .elsewhen(has_exception && etw(ETB_eret)) {
    status.EXL := false.B
    cause.BD := false.B
  }


  // read/write cp0 registers
  val read_mapping = LinkedHashMap[Int,Data](
    nr_index    -> index,
    nr_random   -> random,
    nr_entry_lo0-> entry_lo0,
    nr_entry_lo1-> entry_lo1,
    nr_entry_hi -> entry_hi,
    nr_context  -> context,
    nr_pagemask -> pagemask,
    nr_wired    -> wired,
    nr_base     -> base,
    nr_badvaddr -> badvaddr,
    nr_count0   -> count0,
    nr_count1   -> count1,
    nr_compare  -> compare,
    nr_status   -> status,
    nr_cause    -> cause,
    nr_epc      -> epc,
    nr_prid     -> prid,
    nr_config   -> config,
    nr_config1  -> config1,
    )

  val in_valid = RegInit(N)
  val in = Reg(new ISU_PRU_DATAIN(param))
  val s1_reg = Reg(new ISU_PRU_DATAIN(param))

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (in_valid) {
        printf("time: %d [isu_pru]: pc: %x rob_idx: %x etw: %x fu_op: %d a: %x b: %x\n",
          GTimer(), in.pc, in.rob_idx, in.etw, in.fu_op, in.a, in.b)
      }
    }
  }

  when (io.in.fire()) {
    in_valid := Y
    in := io.in.bits
  }

  val flush = io.flush.bits

  val s0_flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, in.is_delayslot, in.branch_id)
  val s1_flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, s1_reg.is_delayslot, s1_reg.branch_id)

  val s0_passdown = Wire(Bool())
  when (s0_passdown && !io.in.valid) {
    in_valid := N
  }

  val cp0_addr = Cat(in.reg, in.sel)
  val decoded_addr = read_mapping map { case (k, v) => k -> (cp0_addr === k.U) }
  val pru_op1 = in.a
  val pru_op2 = in.b
  val pru_op = in.fu_op

  val is_trap = Mux1H(Array(
    (pru_op === FU_OP_PRU_TEQ)   -> (pru_op1 === pru_op2),
    (pru_op === FU_OP_PRU_TNE)   -> (pru_op1 =/= pru_op2),
    (pru_op === FU_OP_PRU_TLTU)  -> (pru_op1 < pru_op2).asUInt,
    (pru_op === FU_OP_PRU_TGEU)  -> (pru_op1 >= pru_op2).asUInt,
    (pru_op === FU_OP_PRU_TLT)   -> (pru_op1.asSInt < pru_op2.asSInt).asUInt,
    (pru_op === FU_OP_PRU_TGE)   -> (pru_op1.asSInt >= pru_op2.asSInt).asUInt,
  ))

  // deal with cache instructions
  val is_cache_instr = in.fu_op === FU_OP_PRU_CACHE
  val cache_fcn = in.op(4, 2)
  val cache_select = in.op(1, 0)
  // primary instruction
  val s0_control_icache = is_cache_instr && (cache_select === "b00".asUInt(2.W))
  // Primary Data or Unified Primary
  val s0_control_dcache = is_cache_instr && (cache_select === "b01".asUInt(2.W))

  val control_base = RegInit(0.U(param.xprlen.W))
  // update control_base
  when(io.flush.valid && io.flush.bits.spr_valid) {
	control_base := io.flush.bits.seg_base
  }

  val icache_control_req = io.icache_control.req.bits
  val dcache_control_req = io.dcache_control.req.bits

  val cache_control_addr = in.base + in.offset + control_base

  // address translation
  daddr_arb.io.in(0).valid := in_valid && is_cache_instr
  daddr_arb.io.in(0).bits.fcn := M_XRD
  daddr_arb.io.in(0).bits.vaddr := cache_control_addr

  val s0_tlb_etw = io.daddr.resp.bits.etw
  val s0_bad_tlb = s0_tlb_etw.orR

  val cache_control_paddr = io.daddr.resp.bits.paddr

  io.icache_control.req.valid := in_valid && s0_control_icache && !s0_bad_tlb
  icache_control_req.addr := cache_control_paddr
  icache_control_req.data := 0.U
  icache_control_req.fcn := cache_fcn

  io.dcache_control.req.valid := in_valid && s0_control_dcache && !s0_bad_tlb
  dcache_control_req.addr := cache_control_paddr
  dcache_control_req.data := 0.U
  dcache_control_req.fcn := cache_fcn

  val s0_icache_stall = s0_control_icache && !io.icache_control.req.fire()
  val s0_dcache_stall = s0_control_dcache && !io.dcache_control.req.fire()
  val s0_cache_stall = (s0_icache_stall || s0_dcache_stall) && !s0_bad_tlb

  val new_etw = Mux1H(Array(
    (pru_op === FU_OP_PRU_SYS) -> ET_SYSCALL,
    (pru_op === FU_OP_PRU_ERET) -> ET_eret,
    (pru_op === FU_OP_PRU_BREAK) -> ET_BP,
    (pru_op === FU_OP_PRU_CACHE) -> s0_tlb_etw,
    is_trap.orR -> ET_TRAP,
  ))

  val s0_valid = in_valid
  s0_passdown := s0_valid && !s0_flush_valid && !s0_cache_stall
  val s0_value = Mux1H(for ((k, v) <- read_mapping) yield decoded_addr(k) -> v.asTypeOf(UInt(param.xprlen.W)))
  val s0_rd_wen = in.fu_op === FU_OP_PRU_MFC0
  val s0_etw = in.etw | new_etw
  val s0_reg = in

  io.icache_control.resp.ready := Y
  io.dcache_control.resp.ready := Y

  val s1_valid = RegEnable(next = s0_valid, init = N, enable = s0_passdown)
  val s1_value = RegEnable(s0_value, s0_passdown)
  val s1_rd_wen = RegEnable(s0_rd_wen, s0_passdown)
  val s1_etw = RegEnable(s0_etw, s0_passdown)
  val s1_bad_tlb = RegEnable(s0_bad_tlb, s0_passdown)
  val s1_cache_control_addr = RegEnable(cache_control_addr, s0_passdown)
  val s1_control_icache = RegEnable(s0_control_icache, s0_passdown)
  val s1_control_dcache = RegEnable(s0_control_dcache, s0_passdown)
  val s1_icache_stall = s1_control_icache && !io.icache_control.resp.fire()
  val s1_dcache_stall = s1_control_dcache && !io.dcache_control.resp.fire()
  val s1_cache_stall = (s1_icache_stall || s1_dcache_stall) && !s1_bad_tlb
  val s1_passdown = s1_valid && !s1_flush_valid && !s1_cache_stall
  when (s0_passdown) { s1_reg := s0_reg }
  when (s1_passdown && !s0_passdown) { s1_valid := N }

  io.in.ready := !in_valid && !s1_valid && !rst

  // val cp0_wen = in_valid && in.fu_op === FU_OP_PRU_MTC0 && !s0_flush_valid && !has_exception
  val cp0_wen = s1_valid && s1_reg.fu_op === FU_OP_PRU_MTC0 && !s1_flush_valid && !has_exception

  val tlbr_en = s1_valid && s1_reg.fu_op === FU_OP_PRU_TLBR && !s1_flush_valid && !has_exception
  val tlbp_en = s1_valid && s1_reg.fu_op === FU_OP_PRU_TLBP && !s1_flush_valid && !has_exception
  val tlbwi_en = s1_valid && s1_reg.fu_op === FU_OP_PRU_TLBWI && !s1_flush_valid && !has_exception
  val tlbwr_en = s1_valid && s1_reg.fu_op === FU_OP_PRU_TLBWR && !s1_flush_valid && !has_exception

  io.rob.valid := s1_passdown
  val rob = io.rob.bits
  rob.idx := in.rob_idx
  val robEntry = rob.entry
  // result ready, ready to be retired
  robEntry.ready := Y
  robEntry.fu_type := FU_TYPE_PRU

  robEntry.value := s1_value
  robEntry.rd := s1_reg.rd
  robEntry.rd_wen := s1_rd_wen
  robEntry.pc := s1_reg.pc
  robEntry.instr := s1_reg.instr
  robEntry.is_delayslot := s1_reg.is_delayslot
  robEntry.branch_id := s1_reg.branch_id
  robEntry.etw := s1_etw

  robEntry.target := DontCare
  robEntry.is_taken := DontCare
  robEntry.bp_info := DontCare

  robEntry.hi := DontCare
  robEntry.hi_wen := DontCare
  robEntry.lo := DontCare
  robEntry.lo_wen := DontCare

  robEntry.badvaddr := Mux((s1_control_icache || s1_control_dcache) && s1_bad_tlb,
    s1_cache_control_addr, s1_reg.pc)
  robEntry.lsq_idx := DontCare
  robEntry.is_load := DontCare
  robEntry.speculative := DontCare

  /*
  when(io.out.valid) {
    printf("time: %d [cp0]:  in: reg:%x, sel:%x, rd:%x, fu_op:%x, pc:%x\n", GTimer(), in.reg, in.sel, in.rd, in.fu_op, in.pc)
    printf("time: %d [cp0]: out: pc:%x, instr:%x, etw:%x, value:%x\n", GTimer(), out.pc, out.instr, out.etw, out.value)
    printf("time: %d [cp0]: cpr: epc:%x, status:%x, cause:%x, badvaddr:%x\n", GTimer(), epc, status.asUInt, cause.asUInt, badvaddr)
    printf("\n");
  }
  */

  when (cp0_wen) {
    when(decoded_addr(nr_base)) { base := s1_reg.b }
    // when(decoded_addr(nr_badvaddr)) { badvaddr := s1_reg.b }
    /*********** write counter is permitted *************/
    when(decoded_addr(nr_count0)) { count0 := s1_reg.b }
    when(decoded_addr(nr_count1)) { count1 := s1_reg.b }
    /*********** write counter is permitted *************/
    when(decoded_addr(nr_compare)) {
      compare := s1_reg.b
      cause.IP(7) := N
    }
    when(decoded_addr(nr_status)) { status.write(s1_reg.b) }
    when(decoded_addr(nr_cause)) { cause.write(s1_reg.b) }
    when(decoded_addr(nr_epc)) { epc := s1_reg.b }

    // tlb related registers
    when(decoded_addr(nr_wired)) { wired.write(s1_reg.b) }
    when(decoded_addr(nr_context)) { context.write(s1_reg.b) }

  }

  /* TLBP:
   *    write(index)
   * TLBR:
   *    read(index)
   *    write(pagemask, entry_hi, entry_lo0, entry_lo1)
   * TLBWI:
   *    read(index,  pagemask, entry_hi, entry_lo0, entry_lo1)
   * TLBWR:
   *    read(random, pagemask, entry_hi, entry_lo0, entry_lo1)
   */
  when(cp0_wen) {
    // registers which can be write by other instr
    when(decoded_addr(nr_entry_lo0)) { entry_lo0.write(s1_reg.b) }
    when(decoded_addr(nr_entry_lo1)) { entry_lo1.write(s1_reg.b) }
    when(decoded_addr(nr_entry_hi)) { entry_hi.write(s1_reg.b) }
    when(decoded_addr(nr_pagemask)) { pagemask.write(s1_reg.b) }
  } .elsewhen(tlbr_en) {
    cp0_tlb_ren := Y
    tlb_read(index.index)
  }

  when(cp0_wen) {
    when(decoded_addr(nr_index)) { index.write(s1_reg.b) }
  } .elsewhen(tlbp_en) {
    tlb_present()
  }

  when(tlbwi_en || tlbwr_en) {
    tlb_wport_wen := Y
    tlb_write(Mux(tlbwi_en, index.index, random.index))
  }

  // update cycle counter
  val count_wen = cp0_wen && (decoded_addr(nr_count0) || decoded_addr(nr_count1))

  when(!count_wen) {
    // add 1 per cycles
    val newCounter = Cat(count1, count0) + 1.U
    count0 := newCounter(param.xprlen - 1, 0)
    count1 := newCounter(2 * param.xprlen - 1, param.xprlen)
  }

  // ******************** flush logic ********************
  // flush signal
  when (s0_flush_valid && !io.in.valid) { in_valid := N }
  when (s1_flush_valid && !s0_passdown) { s1_valid := N }
}
