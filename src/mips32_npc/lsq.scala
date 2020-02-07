package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class LSQEntry(param: CoreParams) extends Bundle
{
  // is this entry valid
  val valid = Output(Bool())
  // is the req fired?
  val fired = Output(Bool())
  // does this entry supports speculative load/store
  // only speculative to memory is allowed
  // mmio load/store and memory store must be executed on retire
  val speculative = Output(Bool())
  // bad load store
  // should not execute it
  val bad_ls = Output(Bool())

  // not the original addr
  // this is the word aligned addr
  val addr = Output(UInt(param.xprlen.W))
  val data = Output(UInt(param.xprlen.W))
  val fcn  = Output(UInt(M_X.getWidth.W))  // memory function code
  val is_cached = Output(Bool())
  val fu_op = Output(UInt(5.W))
  val wstrb = Output(UInt((param.xprlen / 8).W))
  // 0: 1byte, 1:2bytes, 2:3bytes, 3:4bytes
  val len = Output(UInt((param.xprlen / 8).W))
  val byte_sel = Output(UInt(3.W))

  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new LSQEntry(param).asInstanceOf[this.type] }
}

class LSQAllocatePort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nLSQEntries))
  // resp
  val valid = Output(Bool())
  val ready = Input(Bool())
  val idx = Input(UInt(log2Up(param.nLSQEntries).W))
  override def cloneType = { new LSQAllocatePort(param).asInstanceOf[this.type] }
}

class LSQWPort(param: CoreParams) extends Bundle
{
  require(isPow2(param.nLSQEntries))
  // req
  val idx = Output(UInt(log2Up(param.nLSQEntries).W))
  // resp
  val entry = new LSQEntry(param)
  override def cloneType = { new LSQWPort(param).asInstanceOf[this.type] }
}

class LSQRetirePortIO(param: CoreParams) extends Bundle 
{
  val req    = new DecoupledIO(new LSQRetireReq(param))
  val resp   = Flipped(new ValidIO(new LSQRetireResp(param)))
  override def cloneType = { new LSQRetirePortIO(param).asInstanceOf[this.type] }
  def dump() = {
    req match { case x => {
      when (x.fire()) {
        printf("time: %d ", GTimer())
        x.bits.dump()
      }
    }}
    resp match { case x => {
      when (x.valid) {
        printf("time: %d ", GTimer())
        x.bits.dump()
      }
    }}
  }
}

class LSQRetireReq(param: CoreParams) extends Bundle
{
  // req
  // if true, retire lq
  // if false, retire sq
  val retire_lq = Output(Bool())
  val idx = Output(UInt(log2Up(param.nLSQEntries).W))
  // should the retired lsq entry be executed?
  val execute = Output(Bool())
  def dump() = {
    when (retire_lq) {
      printf("LQ Retire Req")
    } .otherwise {
      printf("SQ Retire Req")
    }
    printf(" idx: %d execute: %d\n", idx, execute)
  }
  override def cloneType = { new LSQRetireReq(param).asInstanceOf[this.type] }
}

class LSQRetireResp(param: CoreParams) extends Bundle
{
  val data = Output(UInt(param.xprlen.W))
  val flush = Output(Bool())
  def dump() = {
    printf("LSQRetireResp: data: %x\n", data)
  }
  override def cloneType = { new LSQRetireResp(param).asInstanceOf[this.type] }
}

class LSQ_IO(param: CoreParams) extends Bundle
{
  val lq_allocate = Flipped(new LSQAllocatePort(param))
  val sq_allocate = Flipped(new LSQAllocatePort(param))

  val lq_wport = Flipped(ValidIO(new LSQWPort(param)))
  val sq_wport = Flipped(ValidIO(new LSQWPort(param)))

  val retire = Flipped(new LSQRetirePortIO(param))

  val dmem = new MemPortIO(param.xprlen, param.xprlen)
  val rob = ValidIO(new ROBWPort(param))
  val rob_rport = new ROBRPort(param)
  val bypass = ValidIO(new LSU_ISU_BYPASS(param))
  val flush = Flipped(ValidIO(new Flush(param)))
  val perf = new LSUPerfIO
}

class LSQ(param: CoreParams) extends Module
{
  val io = IO(new LSQ_IO(param))

  val nLSQEntries = param.nLSQEntries
  val lsqIdxBits = log2Up(param.nLSQEntries)

  val lq = Reg(Vec(nLSQEntries, new LSQEntry(param)))
  val sq = Reg(Vec(nLSQEntries, new LSQEntry(param)))

  val lq_allocated_slot = Reg(Vec(nLSQEntries, Bool()))
  val sq_allocated_slot = Reg(Vec(nLSQEntries, Bool()))

  // for now, branch misprediction flush are triggered when branch delay slot retires
  // so all flush are in unconditional flushes
  val flush_valid = io.flush.valid

  // ******************** lsq allocate ********************
  val lq_full = lq_allocated_slot.reduce(_ && _)
  val sq_full = sq_allocated_slot.reduce(_ && _)

  val lq_allocate = io.lq_allocate
  val lq_alloc_slot = PriorityEncoder(~lq_allocated_slot.asUInt)
  lq_allocate.ready := !lq_full && !flush_valid
  lq_allocate.idx := lq_alloc_slot

  val sq_allocate = io.sq_allocate
  val sq_alloc_slot = PriorityEncoder(~sq_allocated_slot.asUInt)
  sq_allocate.ready := !sq_full && !flush_valid
  sq_allocate.idx := sq_alloc_slot

  when (lq_allocate.valid && lq_allocate.ready) {
    lq_allocated_slot(lq_alloc_slot) := Y
  }

  when (sq_allocate.valid && sq_allocate.ready) {
    sq_allocated_slot(sq_alloc_slot) := Y
  }

  // dump load store queue
  /*
  if (param.pipelineDebug) {
    printf("time: %d Load Queue:\n", GTimer())
    printf("time: %d allocated: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq_allocated_slot(i))
    }
    printf("\n")
    printf("time: %d valid: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).valid)
    }
    printf("\n")
    printf("time: %d fired: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).fired)
    }
    printf("\n")
    printf("time: %d speculative: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).speculative)
    }
    printf("\n")
    printf("time: %d bad_ls: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).bad_ls)
    }
    printf("\n")
    printf("time: %d addr: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", lq(i).addr)
    }
    printf("\n")
    printf("time: %d data: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", lq(i).data)
    }
    printf("\n")
    printf("time: %d fcn: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).fcn)
    }
    printf("\n")
    printf("time: %d fu_op: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).fu_op)
    }
    printf("\n")
    printf("time: %d wstrb: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", lq(i).wstrb)
    }
    printf("\n")
    printf("time: %d len: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).len)
    }
    printf("\n")
    printf("time: %d rob_idx: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", lq(i).rob_idx)
    }
    printf("\n")

    printf("time: %d Store Queue:\n", GTimer())
    printf("time: %d allocated: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq_allocated_slot(i))
    }
    printf("\n")
    printf("time: %d valid: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).valid)
    }
    printf("\n")
    printf("time: %d fired: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).fired)
    }
    printf("\n")
    printf("time: %d speculative: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).speculative)
    }
    printf("\n")
    printf("time: %d bad_ls: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).bad_ls)
    }
    printf("\n")
    printf("time: %d addr: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", sq(i).addr)
    }
    printf("\n")
    printf("time: %d data: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", sq(i).data)
    }
    printf("\n")
    printf("time: %d fcn: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).fcn)
    }
    printf("\n")
    printf("time: %d fu_op: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).fu_op)
    }
    printf("\n")
    printf("time: %d wstrb: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%x ", sq(i).wstrb)
    }
    printf("\n")
    printf("time: %d len: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).len)
    }
    printf("\n")
    printf("time: %d rob_idx: ", GTimer())
    for (i <- 0 until nLSQEntries) {
      printf("%d ", sq(i).rob_idx)
    }
    printf("\n")
  }
  */

  // ******************** lsq write ports ********************
  val lq_wport = io.lq_wport.bits
  when (io.lq_wport.valid) {
    lq(lq_wport.idx) := lq_wport.entry
  }

  val sq_wport = io.sq_wport.bits
  when (io.sq_wport.valid) {
    sq(sq_wport.idx) := sq_wport.entry
  }

  if (param.pipelineDebug) {
    val lq_entry = lq_wport.entry
    when (TraceTrigger()) {
      when (io.lq_wport.valid) {
        printf("time: %d [Load Queue]: idx: %d rob_idx: %d valid: %d fired: %d speculative: %d addr: %x data: %x fcn: %x wstrb: %x len: %d\n",
          GTimer(), lq_wport.idx, lq_entry.rob_idx, lq_entry.valid, lq_entry.fired, lq_entry.speculative,
          lq_entry.addr, lq_entry.data, lq_entry.fcn, lq_entry.wstrb, lq_entry.len)
      }
    }

    val sq_entry = sq_wport.entry
    when (TraceTrigger()) {
      when (io.sq_wport.valid) {
        printf("time: %d [Store Queue]: idx: %d rob_idx: %d valid: %d fired: %d speculative: %d addr: %x data: %x fcn: %x wstrb: %x len: %d\n",
          GTimer(), sq_wport.idx, sq_entry.rob_idx, sq_entry.valid, sq_entry.fired, sq_entry.speculative,
          sq_entry.addr, sq_entry.data, sq_entry.fcn, sq_entry.wstrb, sq_entry.len)
      }
    }
  }

  // ******************** reset and flush ********************
  def clear_lsq = {
    for (i <- 0 until nLSQEntries) {
      lq_allocated_slot(i) := N
      sq_allocated_slot(i) := N
      lq(i).valid := N
      lq(i).fired := N
      lq(i).speculative := N
      sq(i).valid := N
      sq(i).fired := N
      sq(i).speculative := N
    }
  }

  when (reset.toBool || flush_valid) {
    clear_lsq
  }

  // ******************** lsq core logic ********************
  val dmem_arb = Module(new Arbiter(new MemReq(param.xprlen, param.xprlen), 3))
  dmem_arb.io.out <> io.dmem.req
  io.dmem.req.bits.s1_kill := N

  // Priority is given to lower producer
  val STORE_PORT = 0
  val MMIO_LOAD_PORT = 1
  val MEM_LOAD_PORT = 2

  // execute speculatively
  val mem_load_port = dmem_arb.io.in(MEM_LOAD_PORT)
  // execute on retire
  val mmio_load_port = dmem_arb.io.in(MMIO_LOAD_PORT)
  val store_port = dmem_arb.io.in(STORE_PORT)

  val s1_port = RegInit(0.asUInt(2.W))
  // speculative load can and should be flushed when flush happens
  val s1_speculative = RegInit(N)
  val s1_rob_idx = Reg(UInt(log2Up(param.nROBEntries).W))
  val s1_op = Reg(UInt(5.W))
  val s1_byte_sel = Reg(UInt(3.W))
  val s1_raw_dependency_violation = RegInit(N)

  // ******************** mem load ********************
  val lq_valid = Vec(lq.map(_.valid)).asUInt
  val lq_fired = Vec(lq.map(_.fired)).asUInt
  val lq_speculative = Vec(lq.map(_.speculative)).asUInt
  val lq_bad_ls = Vec(lq.map(_.bad_ls)).asUInt

  val sq_valid = Vec(sq.map(_.valid)).asUInt
  val sq_fired = Vec(sq.map(_.fired)).asUInt
  val sq_speculative = Vec(sq.map(_.speculative)).asUInt

  // speculatively issue memory load
  val lq_fireable_slot = lq_valid & ~lq_fired & lq_speculative & ~lq_bad_ls
  val lq_fire_idx = PriorityEncoder(lq_fireable_slot)
  val lq_fire_valid = lq_fireable_slot =/= 0.U
  val lq_fire_op = lq(lq_fire_idx).fu_op
  val lq_fire_byte_sel = lq(lq_fire_idx).byte_sel
  val lq_fire_rob_idx = lq(lq_fire_idx).rob_idx

  /*
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      printf("time: %d lq_fire_valid: %d lq_fire_idx: %d lq_fireable_slot: %x lq_valid: %x lq_fired: %x lq_speculative: %x lq_bad_ls: %x load_store_conflicts: %x\n",
        GTimer(),  lq_fire_valid, lq_fire_idx, lq_fireable_slot, lq_valid, lq_fired, lq_speculative, lq_bad_ls, load_store_conflicts)
    }
  }
  */

  // only mem load is speculative, and it can be flushed
  mem_load_port.valid := lq_fire_valid && !flush_valid
  mem_load_port.bits.addr := lq(lq_fire_idx).addr
  mem_load_port.bits.len := lq(lq_fire_idx).len
  mem_load_port.bits.data := lq(lq_fire_idx).data
  mem_load_port.bits.fcn := lq(lq_fire_idx).fcn
  mem_load_port.bits.wstrb := lq(lq_fire_idx).wstrb
  mem_load_port.bits.is_cached := lq(lq_fire_idx).is_cached
  mem_load_port.bits.s1_kill := N

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (mem_load_port.valid) {
        printf("time: %d mem_load_port addr: %x, fcn: %d data: %x wstrb: %x\n",
          GTimer(), mem_load_port.bits.addr, mem_load_port.bits.fcn, mem_load_port.bits.data, mem_load_port.bits.wstrb)
      }
    }
  }

  when (mem_load_port.fire()) {
    s1_port := MEM_LOAD_PORT.U
    s1_speculative := Y
    s1_rob_idx := lq_fire_rob_idx
    s1_op := lq_fire_op
    s1_byte_sel := lq_fire_byte_sel
    s1_raw_dependency_violation := N

    lq(lq_fire_idx).fired := Y
  }

  // ******************** retire port ********************
  val retire_req = io.retire.req.bits
  val lq_retire = retire_req.retire_lq
  val sq_retire = !retire_req.retire_lq

  // lq_retire and sq_retire uses the lower arbiter port
  // so when retire port and mem_load port are high in the same cycle
  // retire port is guaranteed to win
  //
  // what's more, if retire does need to be executed, it only needs to free lsq entry
  // let it execute immediately
  // so that it can free rob and lsq earlier
  io.retire.req.ready := !retire_req.execute || io.dmem.req.ready

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      io.retire.dump()
    }
  }

  val lq_retire_idx = retire_req.idx
  val lq_retire_op = lq(lq_retire_idx).fu_op
  val lq_retire_byte_sel = lq(lq_retire_idx).byte_sel
  val lq_retire_rob_idx = lq(lq_retire_idx).rob_idx
  mmio_load_port.valid := io.retire.req.valid && lq_retire && retire_req.execute
  mmio_load_port.bits.addr := lq(lq_retire_idx).addr
  mmio_load_port.bits.len := lq(lq_retire_idx).len
  mmio_load_port.bits.data := lq(lq_retire_idx).data
  mmio_load_port.bits.fcn := lq(lq_retire_idx).fcn
  mmio_load_port.bits.wstrb := lq(lq_retire_idx).wstrb
  mmio_load_port.bits.is_cached := lq(lq_retire_idx).is_cached
  mmio_load_port.bits.s1_kill := N

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (mmio_load_port.valid) {
        printf("time: %d mmio_load_port addr: %x, fcn: %d data: %x wstrb: %x\n",
          GTimer(), mmio_load_port.bits.addr, mmio_load_port.bits.fcn, mmio_load_port.bits.data, mmio_load_port.bits.wstrb)
      }
    }
  }

  when (mmio_load_port.fire()) {
    s1_port := MMIO_LOAD_PORT.U
    s1_speculative := N
    s1_rob_idx := lq_retire_rob_idx
    s1_op := lq_retire_op
    s1_byte_sel := lq_retire_byte_sel
    s1_raw_dependency_violation := N

    lq(lq_retire_idx).fired := Y
  }

  // free lq slot
  val free_lq_no_exec = io.retire.req.fire() && lq_retire && !retire_req.execute
  val free_lq_exec = mmio_load_port.fire()
  val free_lq = free_lq_no_exec || free_lq_exec
  when (free_lq) {
    lq_allocated_slot(lq_retire_idx) := N
    lq(lq_retire_idx).valid := N
  }

  // ******************** sq retire port ********************
  // retire a store slot and fire it
  val sq_retire_idx = retire_req.idx
  val sq_retire_op = sq(sq_retire_idx).fu_op
  val sq_retire_byte_sel = sq(sq_retire_idx).byte_sel
  val sq_retire_rob_idx = sq(sq_retire_idx).rob_idx
  store_port.valid := io.retire.req.valid && sq_retire && retire_req.execute
  store_port.bits.addr := sq(sq_retire_idx).addr
  store_port.bits.len := sq(sq_retire_idx).len
  store_port.bits.data := sq(sq_retire_idx).data
  store_port.bits.fcn := sq(sq_retire_idx).fcn
  store_port.bits.wstrb := sq(sq_retire_idx).wstrb
  store_port.bits.is_cached := sq(sq_retire_idx).is_cached
  store_port.bits.s1_kill := N
  val store_addr = store_port.bits.addr
  // check for RAW dependency violations
  val raw_dependency_violation = Vec(lq.map(l => l.valid && l.fired && l.addr === store_addr)).asUInt.orR

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (store_port.valid) {
        printf("time: %d store_port addr: %x, fcn: %d data: %x wstrb: %x\n",
          GTimer(), store_port.bits.addr, store_port.bits.fcn, store_port.bits.data, store_port.bits.wstrb)
      }
    }
  }

  when (store_port.fire()) {
    s1_port := STORE_PORT.U
    s1_speculative := N
    s1_rob_idx := sq_retire_rob_idx
    s1_op := sq_retire_op
    s1_byte_sel := sq_retire_byte_sel
    s1_raw_dependency_violation := raw_dependency_violation

    sq(sq_retire_idx).fired := Y
  }

  // free sq slot
  val free_sq_no_exec = io.retire.req.fire() && sq_retire && !retire_req.execute
  val free_sq_exec = store_port.fire()
  val free_sq = free_sq_no_exec || free_sq_exec
  when (free_sq) {
    sq_allocated_slot(sq_retire_idx) := N
    sq(sq_retire_idx).valid := N
  }

  // LSQ are seperated into two stages
  // stage 0 send req to dmem
  // stage 1 receive response

  val s0_passdown = io.dmem.req.fire()
  val s1_valid = RegEnable(next = Y, init = N, enable = s0_passdown)
  val s1_passdown = Wire(Bool())
  val s1_fcn = RegEnable(io.dmem.req.bits.fcn, s0_passdown)
  val s1_addr = RegEnable(io.dmem.req.bits.addr, s0_passdown)
  val s1_wdata = RegEnable(io.dmem.req.bits.data, s0_passdown)

  when (io.dmem.resp.fire() && !s0_passdown) { s1_valid := N }

  io.dmem.resp.ready := Y

  val s1_flush_valid = s1_valid && s1_speculative && flush_valid
  val s1_flush_pending = RegInit(N)
  val s1_need_flush = s1_flush_valid || s1_flush_pending

  when (s1_flush_valid && !io.dmem.resp.fire()) {
    s1_flush_pending := Y
  }

  when (io.dmem.resp.fire()) {
    s1_flush_pending := N
  }

  s1_passdown := s1_valid && io.dmem.resp.fire() && !s1_need_flush
  
  val rd_byte_wen = Mux1H(Array(
    (s1_op === FU_OP_LSU_LW)  ->  "b1111".U,
    (s1_op === FU_OP_LSU_LL)  ->  "b1111".U,
    (s1_op === FU_OP_LSU_LB)  ->  "b1111".U,
    (s1_op === FU_OP_LSU_LBU) ->  "b1111".U,
    (s1_op === FU_OP_LSU_LH)  ->  "b1111".U,
    (s1_op === FU_OP_LSU_LHU) ->  "b1111".U,
    (s1_op === FU_OP_LSU_LWL) ->  ("b1000".U.asSInt >> s1_byte_sel).asUInt,
    (s1_op === FU_OP_LSU_LWR) ->  ((1.U << (4.U - s1_byte_sel)) - 1.U)
  ))

  val s1_rdata = io.dmem.resp.bits.data
  val target_byte = (s1_rdata >> (s1_byte_sel << 3))(7, 0)
  val target_half_word = (s1_rdata >> (s1_byte_sel << 3))(15, 0)
  val data = Mux1H(Array(
    (s1_op === FU_OP_LSU_LW)  ->  s1_rdata,
    (s1_op === FU_OP_LSU_LL)  ->  s1_rdata,
    (s1_op === FU_OP_LSU_LB)  ->  Cat(Fill(24, target_byte(7)), target_byte),
    (s1_op === FU_OP_LSU_LBU) ->  Cat(Fill(24, 0.U), target_byte),
    (s1_op === FU_OP_LSU_LH)  ->  Cat(Fill(16, target_half_word(15)), target_half_word),
    (s1_op === FU_OP_LSU_LHU) ->  Cat(Fill(16, 0.U), target_half_word),
    (s1_op === FU_OP_LSU_LWL) ->  (s1_rdata << (24.U - (s1_byte_sel << 3))),
    (s1_op === FU_OP_LSU_LWR) ->  (s1_rdata >> (s1_byte_sel << 3))
  ))

  // rd's original data(neeed by LWL and LWR is passed down through wdata)
  val wbu_data = Util.wordStrb(s1_wdata, data, rd_byte_wen)

  io.retire.resp.valid := s1_valid && io.dmem.resp.fire() && !s1_speculative
  io.retire.resp.bits.data := wbu_data
  io.retire.resp.bits.flush := s1_raw_dependency_violation

  val robRport = io.rob_rport
  robRport.idx := s1_rob_idx
  val oldRobEntry = robRport.entry

  // only memory load needs to write to rob
  // mmio and store are executed after instruction retire
  io.rob.valid := s1_passdown && s1_speculative
  val rob = io.rob.bits
  rob.idx := s1_rob_idx
  val robEntry = rob.entry

  // now, it's ready to be retired
  robEntry.ready := Y
  robEntry.fu_type := FU_TYPE_LSU

  robEntry.value := wbu_data
  robEntry.rd := oldRobEntry.rd
  robEntry.rd_wen := oldRobEntry.rd_wen
  robEntry.pc := oldRobEntry.pc
  robEntry.instr := oldRobEntry.instr
  robEntry.is_delayslot := oldRobEntry.is_delayslot
  robEntry.branch_id := oldRobEntry.branch_id
  robEntry.etw := oldRobEntry.etw

  robEntry.target := oldRobEntry.target
  robEntry.is_taken := oldRobEntry.is_taken
  robEntry.bp_info := oldRobEntry.bp_info

  robEntry.hi := oldRobEntry.hi
  robEntry.hi_wen := oldRobEntry.hi_wen
  robEntry.lo := oldRobEntry.lo
  robEntry.lo_wen := oldRobEntry.lo_wen

  robEntry.badvaddr := oldRobEntry.badvaddr
  robEntry.lsq_idx := oldRobEntry.lsq_idx
  robEntry.is_load := oldRobEntry.is_load
  robEntry.speculative := oldRobEntry.speculative

  // bypass
  // lsq to isu bypass
  val bypass = io.bypass.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bypass.valid) {
        printf("time: %d [lsq_isu]: rd_wen: %d rd: %d rob_idx: %d val: %x\n",
          GTimer(), bypass.rd_wen, bypass.rd, bypass.rob_idx, bypass.value)
      }
    }
  }

  io.bypass.valid := io.rob.valid
  bypass.value := robEntry.value
  bypass.rd := robEntry.rd
  bypass.rob_idx := s1_rob_idx
  bypass.rd_wen := robEntry.rd_wen

  // ******************** perf logic ********************
  // there isn't a signal that explicitly tells us there is a dcache miss
  // but since dcache has one cycle latency for load/store hit
  // if we are already in stage 1 and resp is not yet valid, we know it's a miss
  val s1_miss = s1_valid && !io.dmem.resp.valid
  io.perf.wait_dcache := s1_valid && !io.dmem.resp.valid
  io.perf.load := s1_passdown && (s1_fcn === M_XRD)
  io.perf.load_miss := s1_passdown && (s1_fcn === M_XRD) && s1_miss
  io.perf.store := s1_passdown && (s1_fcn === M_XWR)
  io.perf.store_miss :=  s1_passdown && (s1_fcn === M_XWR) && s1_miss
}
