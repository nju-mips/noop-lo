package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class IDU_IO(param: CoreParams) extends Bundle
{
  val instr = Flipped(DecoupledIO(new IFU_IDU_INSTR(param)))
  val decode = DecoupledIO(new IDU_ISU_DECODE(param))
  val flush = Flipped(ValidIO(new Flush(param)))
  val bht_1 = new BHTQuery(param.bht1Param)
  val bht_2 = new BHTQuery(param.bht2Param)
  val btb = new BTBQuery(param)
  val ras = Flipped(new RASPeek(param))
  val ras_update = ValidIO(new RASUpdate(param))
  val bp = ValidIO(new BranchPredictionIO(param))
  val delayslot = new DelayslotIO(param)
  val rob_allocate = new ROBAllocatePort(param)
  val brob_allocate = new BROBAllocate(param)
  val lq_allocate = new LSQAllocatePort(param)
  val sq_allocate = new LSQAllocatePort(param)
  val pru_instr_commit = Input(Bool())
  val decode_pru_stall_frontend = Output(Bool())
  val decode_pru_stall_frontend_pc = Output(UInt(param.xprlen.W))


  val rs_rport = new SBReadPort(param)
  val rt_rport = new SBReadPort(param)
  val rename = ValidIO(new SBRenamePort(param))
}

class IDU(param: CoreParams) extends Module
{
  val io = IO(new IDU_IO(param))

  // pipeline registers
  val instr_valid = RegInit(N)
  val instr = Reg(new IFU_IDU_INSTR(param))

  val is_delayslot = RegInit(N)
  val branch_id = Reg(UInt(log2Up(param.nBROBEntries).W))
  val flush = io.flush.bits
  val flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, is_delayslot, branch_id)

  val rob_allocate = io.rob_allocate
  val brob_allocate = io.brob_allocate
  val lq_allocate = io.lq_allocate
  val sq_allocate = io.sq_allocate
  val pru_stall_frontend = Wire(Bool())
  val lsu_stall = Wire(Bool())
  val mdu_stall = Wire(Bool())
  io.instr.ready := (!instr_valid || (io.decode.ready && brob_allocate.ready && rob_allocate.ready)) && !pru_stall_frontend && !lsu_stall && !mdu_stall

  when (io.instr.fire()) {
    instr_valid := Y
    instr := io.instr.bits
  }

  when (!io.instr.fire() && io.decode.fire()) {
    instr_valid := N
  }

  // ******************** decode logic ********************

  // instruction decode stage
  val csignals = ListLookup(instr.instr,
    List(N, FU_TYPE_PRU, FU_OP_PRU_X, B_SRC_X, EXT_TYPE_X, RD_SEL_X, A_SRC_X), Array(
      /* instr_valid  |  fu_type   |     fu_op       |  b_src   | ext_type |   rd_sel     |   a_src  |        */
     // ALU instructions
     ADD     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_ADD_OV, B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     ADDU    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_ADD,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     ADDI    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_ADD_OV, B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     ADDIU   -> List(Y, FU_TYPE_ALU, FU_OP_ALU_ADD,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SUB     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SUB_OV, B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SUBU    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SUB,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     AND     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_AND,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     ANDI    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_AND,    B_SRC_IMM, EXT_TYPE_ZERO, RD_SEL_RT,   A_SRC_RS),
     CLZ     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_CLZ,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     OR      -> List(Y, FU_TYPE_ALU, FU_OP_ALU_OR,     B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     ORI     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_OR,     B_SRC_IMM, EXT_TYPE_ZERO, RD_SEL_RT,   A_SRC_RS),
     XOR     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_XOR,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     XORI    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_XOR,    B_SRC_IMM, EXT_TYPE_ZERO, RD_SEL_RT,   A_SRC_RS),
     NOR     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_NOR,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SLT     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLT,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SLTU    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLTU,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SLTI    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLT,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SLTIU   -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLTU,   B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SLL     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLL,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_SA),
     SLLV    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SLL,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SRL     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SRL,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_SA),
     SRLV    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SRL,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     SRA     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SRA,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_SA),
     SRAV    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_SRA,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     LUI     -> List(Y, FU_TYPE_ALU, FU_OP_ALU_LUI,    B_SRC_IMM, EXT_TYPE_X,    RD_SEL_RT,   A_SRC_X),
     MOVN    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_MOVN,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     MOVZ    -> List(Y, FU_TYPE_ALU, FU_OP_ALU_MOVZ,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
   
     // BRU instructions
     BEQ     -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BEQ,     B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     BGTZ    -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BGTZ,    B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     BLEZ    -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BLEZ,    B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     BLTZ    -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BLTZ,    B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     BGEZ    -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BGEZ,    B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     BLTZAL  -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BLTZAL,  B_SRC_X,   EXT_TYPE_X,    RD_SEL_31,   A_SRC_RS),
     BGEZAL  -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BGEZAL,  B_SRC_X,   EXT_TYPE_X,    RD_SEL_31,   A_SRC_RS),
     BNE     -> List(Y, FU_TYPE_BRU, FU_OP_BRU_BNE,     B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     J       -> List(Y, FU_TYPE_BRU, FU_OP_BRU_J,       B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     JAL     -> List(Y, FU_TYPE_BRU, FU_OP_BRU_JAL,     B_SRC_REG, EXT_TYPE_X,    RD_SEL_31,   A_SRC_X),
     JALR    -> List(Y, FU_TYPE_BRU, FU_OP_BRU_JALR,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     JR      -> List(Y, FU_TYPE_BRU, FU_OP_BRU_JR,      B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),

     // MDU instructions
     MUL     -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MUL,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_RD,   A_SRC_RS),
     MULT    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MULT,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_HILO, A_SRC_RS),
     MULTU   -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MULTU,  B_SRC_REG, EXT_TYPE_X,    RD_SEL_HILO, A_SRC_RS),
     DIV     -> List(Y, FU_TYPE_MDU, FU_OP_MDU_DIV,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_HILO, A_SRC_RS),
     DIVU    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_DIVU,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_HILO, A_SRC_RS),
     MFHI    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MFHI,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_RD,   A_SRC_HI),
     MFLO    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MFLO,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_RD,   A_SRC_LO),
     MTHI    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MTHI,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_HI,   A_SRC_RS),
     MTLO    -> List(Y, FU_TYPE_MDU, FU_OP_MDU_MTLO,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_LO,   A_SRC_RS),

     // LSU instructions
     LB      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LB,     B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     LBU     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LBU,    B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     LH      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LH,     B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     LHU     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LHU,    B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     LW      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LW,     B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SB      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SB,     B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     SH      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SH,     B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     SW      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SW,     B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     // atomic memory operation
     LL      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LL,     B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SC      -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SC,     B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     // LWL and LWR needs to merge the loaded data with the original data in rd
     // to save one register file read port, we can read the original data using rt's read port
     // but since for LWL and LWR, RD takes the place of RT, we can simply use B_SRC_REG
     LWL     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LWL,    B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     LWR     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_LWR,    B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_RT,   A_SRC_RS),
     SWL     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SWL,    B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     SWR     -> List(Y, FU_TYPE_LSU, FU_OP_LSU_SWR,    B_SRC_REG, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),

     SYS     -> List(Y, FU_TYPE_PRU, FU_OP_PRU_SYS,    B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     TLBP    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLBP,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     TLBR    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLBR,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     TLBWI   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLBWI,  B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     TLBWR   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLBWR,  B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     CACHE   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_CACHE,  B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     PREF    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_PREF,   B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     SYNC    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_SYNC,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     ERET    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_ERET,   B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     MFC0    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_MFC0,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_RT,   A_SRC_X),
     MTC0    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_MTC0,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     BREAK   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_BREAK,  B_SRC_X,   EXT_TYPE_X,    RD_SEL_X,    A_SRC_X),
     // conditional trap instructions (seems meaningless)
     TLT     -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLT,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     TGE     -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TGE,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     TLTU    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLTU,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     TGEU    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TGEU,   B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     TLTI    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLT,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TEQI    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TEQ,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TGEI    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TGE,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TNEI    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TNE,    B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TLTIU   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TLTU,   B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TGEIU   -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TGEU,   B_SRC_IMM, EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     TNE     -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TNE,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     TEQ     -> List(Y, FU_TYPE_PRU, FU_OP_PRU_TEQ,    B_SRC_REG, EXT_TYPE_X,    RD_SEL_X,    A_SRC_RS),
     PREF    -> List(Y, FU_TYPE_PRU, FU_OP_PRU_PREF,   B_SRC_X,   EXT_TYPE_SIGN, RD_SEL_X,    A_SRC_RS),
     ))

  val (val_inst: Bool) :: fu_type :: fu_op :: b_src :: ext_type :: rd_sel :: a_src :: Nil = csignals


  // PRU instr should execute non-speculatively
  // so:
  // 1. we only send PRU instr down when ROB is empty
  // 2. as long as there are any pru instr in the pipeline,
  //    we stall and kill frontend instructions
  //    (but be careful not to conflict with flushes)
  val is_pru_instr = instr_valid && (fu_type === FU_TYPE_PRU)
  val pru_stall = is_pru_instr && !rob_allocate.empty

  val pru_instr_inflight = RegInit(N)
  val stall_pc = RegEnable(next=io.instr.bits.pc, init=0.U, enable=io.instr.fire())
  when(io.bp.valid) { stall_pc := io.bp.bits.npc - 4.U }

  pru_stall_frontend := (is_pru_instr || pru_instr_inflight) && !flush_valid
  io.decode_pru_stall_frontend := pru_stall_frontend
  io.decode_pru_stall_frontend_pc := stall_pc

  when (io.pru_instr_commit || flush_valid) { pru_instr_inflight := N }
  when (io.decode.fire() && is_pru_instr) {
    pru_instr_inflight := Y
  }

  /* some logs */
 if (param.pipelineDebug) {
   when (TraceTrigger()) {
     when (io.decode_pru_stall_frontend) {
       printf("time: %d is_pru_instr: %d pru_instr_inflight: %d\n",
         GTimer(), is_pru_instr, pru_instr_inflight)
     }
     when (io.pru_instr_commit) {
       printf("time: %d pru_instr_commit\n", GTimer())
     }
     when(io.bp.valid) {
       printf("time: %d [branch prediction] npc=%x\n", GTimer(), io.bp.bits.npc)
     }
   }
 }

  // for now, we do not have to LSQ
  // to avoid speculative load/store
  // lsu instr must execute non-speculatively
  val is_lsu_instr = instr_valid && (fu_type === FU_TYPE_LSU)
  val is_load = Mux1H(Array(
    (fu_op === FU_OP_LSU_LW)  ->  Y,
    (fu_op === FU_OP_LSU_LL)  ->  Y,
    (fu_op === FU_OP_LSU_LWL) ->  Y,
    (fu_op === FU_OP_LSU_LWR) ->  Y,
    (fu_op === FU_OP_LSU_LB)  ->  Y,
    (fu_op === FU_OP_LSU_LBU) ->  Y,
    (fu_op === FU_OP_LSU_LH)  ->  Y,
    (fu_op === FU_OP_LSU_LHU) ->  Y,
    (fu_op === FU_OP_LSU_SW)  ->  N,
    (fu_op === FU_OP_LSU_SC)  ->  N,
    (fu_op === FU_OP_LSU_SWL) ->  N,
    (fu_op === FU_OP_LSU_SWR) ->  N,
    (fu_op === FU_OP_LSU_SB)  ->  N,
    (fu_op === FU_OP_LSU_SH)  ->  N
  ))
  val is_store = !is_load

  val load_stall = is_lsu_instr && is_load && !lq_allocate.ready
  val store_stall = is_lsu_instr && is_store && !sq_allocate.ready

  lsu_stall := load_stall || store_stall
  lq_allocate.valid := io.decode.fire() && is_lsu_instr && is_load
  sq_allocate.valid := io.decode.fire() && is_lsu_instr && is_store

  val is_mdu_instr = instr_valid && (fu_type === FU_TYPE_MDU)
  mdu_stall := is_mdu_instr && !rob_allocate.empty

  val rs = instr.instr(RS_MSB, RS_LSB)
  val rt = instr.instr(RT_MSB, RT_LSB)
  val rd = instr.instr(RD_MSB, RD_LSB)
  val sa = instr.instr(SA_MSB, SA_LSB)
  val sel = instr.instr(SEL_MSB, SEL_LSB)

  val exception = !val_inst && instr_valid

  // the default value for final_rd is $zero
  // so that it will not create any wrong dependency on scoreboard
  // and it wont't mess up regfile
  val final_rd = Mux1H(Array(
    (rd_sel === RD_SEL_RD) -> rd,
    (rd_sel === RD_SEL_RT) -> rt,
    (rd_sel === RD_SEL_31) -> 31.U
  )).asUInt

  // rename part
  val rs_rport = io.rs_rport
  val rt_rport = io.rt_rport
  val rename = io.rename.bits

  io.rs_rport.valid := instr_valid
  rs_rport.reg := rs
  io.rt_rport.valid := instr_valid
  rt_rport.reg := rt
  io.rename.valid := io.decode.fire()
  rename.reg := final_rd
  rename.rob_idx := rob_allocate.idx

  // ******************** branch_prediction ********************
  val bht_1_req = io.bht_1.req
  val bht_1_resp = io.bht_1.resp
  bht_1_req.pc := instr.pc

  val bht_2_req = io.bht_2.req
  val bht_2_resp = io.bht_2.resp
  bht_2_req.pc := instr.pc

  val btb_req = io.btb.req
  val btb_resp = io.btb.resp
  btb_req.pc := instr.pc

  val partial_decode = ListLookup(instr.instr,
    List(N, N, N, N, N), Array(
      /* | branch | j | jal | jalr | jr | */
      // BRU instructions
      BEQ     -> List(Y, N, N, N, N),
      BGTZ    -> List(Y, N, N, N, N),
      BLEZ    -> List(Y, N, N, N, N),
      BLTZ    -> List(Y, N, N, N, N),
      BGEZ    -> List(Y, N, N, N, N),
      BLTZAL  -> List(Y, N, N, N, N),
      BGEZAL  -> List(Y, N, N, N, N),
      BNE     -> List(Y, N, N, N, N),
      J       -> List(N, Y, N, N, N),
      JAL     -> List(N, N, Y, N, N),
      JALR    -> List(N, N, N, Y, N),
      JR      -> List(N, N, N, N, Y)
      ))

  val (is_br: Bool) :: (is_j: Bool) :: (is_jal: Bool) :: (is_jalr: Bool) :: (is_jr: Bool) :: Nil = partial_decode

  val br_imm = instr.instr(15, 0)
  val br_ext_imm = Cat(Fill(14, br_imm(15)), Cat(br_imm, Fill(2, 0.U)))
  val br_target = instr.pc + 4.U + br_ext_imm
  val br_taken = is_br && Mux(bht_1_resp.mispredict_cnt < bht_2_resp.mispredict_cnt, bht_1_resp.taken, bht_2_resp.taken)

  // j and jr is always taken
  val j_target  = Cat(instr.pc(31, 28), Cat(instr.instr(25, 0), Fill(2, 0.U)))
  val j_taken = is_j || is_jal

  val ret_target = io.ras.top
  // ret uses jr $ra
  val is_ret = is_jr && instr.instr(RS_MSB, RS_LSB) === 31.U

  val jr_target = btb_resp.target
  val jr_taken = (is_jalr || (is_jr && !is_ret)) && btb_resp.hit

  val target_taken = br_taken || j_taken || jr_taken || is_ret
  val target = Mux1H(Array(
    br_taken -> br_target,
    j_taken  -> j_target,
    jr_taken -> jr_target,
    is_ret   -> ret_target
  ))

  // update BHT history speculatively
  // update history
  bht_1_req.speculative_update := io.decode.fire() && is_br
  bht_2_req.speculative_update := io.decode.fire() && is_br

  // whenever bru writes to $ra, we treat it as a call
  // I briefly readed gcc generated assembly of microbench
  // I found that:
  // most of calls uses jal
  // call of function pointers uses jalr
  val call = io.decode.fire() && is_jal || (is_jalr && rd === 31.U)
  val ret = io.decode.fire() && is_ret

  // ras update
  val ras_update = io.ras_update.bits
  io.ras_update.valid := call || ret
  ras_update.push := call
  ras_update.call_pc := instr.pc + 8.U
  ras_update.pop := ret

  // delay slot and branch id
  val is_branch = is_br || is_j || is_jal || is_jalr || is_jr
  brob_allocate.valid := io.decode.fire() && is_branch
  rob_allocate.valid := io.decode.fire()

  when (!reset.toBool) {
    assert(!(is_delayslot && instr_valid && is_branch), "Branch in branch delay slot!")
  }

  when (io.decode.fire()) {
    when (is_branch) {
      is_delayslot := Y
      branch_id := brob_allocate.branch_id
    }
    when (is_delayslot) { is_delayslot := N }
  }

  // output
  val decode_valid = instr_valid && brob_allocate.ready && rob_allocate.ready && !pru_stall && !lsu_stall && !mdu_stall && !flush_valid

  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (instr_valid) {
        printf("time: %d [ifu_idu]: pc: %x instr: %x etw: %x decode_valid: %d brob_allocate_ready: %d rob_allocate_ready: %d pru_stall: %d lsu_stall: %d\n",
          GTimer(), instr.pc, instr.instr, instr.etw, decode_valid, brob_allocate.ready, rob_allocate.ready, pru_stall, lsu_stall)
      }
    }
  }

  io.decode.valid := decode_valid
  val decode = io.decode.bits
  decode.pc := instr.pc
  decode.instr := instr.instr

  decode.rs := rs
  decode.rs_rob_idx:= rs_rport.rob_idx
  decode.rs_sb_status:= rs_rport.sb_status

  decode.rt:= rt
  decode.rt_rob_idx:= rt_rport.rob_idx
  decode.rt_sb_status:= rt_rport.sb_status

  // shift amount
  decode.sa := sa
  // this covers the immediate as [15:0]
  decode.offset := instr.instr(25, 0)
  decode.b_src := b_src
  decode.ext_type := ext_type

  decode.rd := rd
  decode.rd_rob_idx := rob_allocate.idx

  decode.rd_sel := rd_sel
  decode.fu_type := Mux(decode.etw.orR, FU_TYPE_PRU, fu_type)
  decode.fu_op := Mux(decode.etw.orR, FU_OP_PRU_X, fu_op)
  decode.a_src := a_src
  decode.sel := sel
  decode.is_delayslot := Mux(is_branch, N, is_delayslot)
  decode.branch_id := Mux(is_branch, brob_allocate.branch_id, branch_id)
  decode.rob_idx := rob_allocate.idx
  decode.lsq_idx := Mux(is_load, lq_allocate.idx, sq_allocate.idx)
  decode.etw := instr.etw | Mux(exception, ET_INVOP, 0.U)
  // pass down branch prediction information
  decode.bp_info.branch_predicted := is_branch
  decode.bp_info.predicted_taken := target_taken
  decode.bp_info.predicted_target := target
  decode.bp_info.original_top := io.ras.original_top
  decode.bp_info.btb_miss := (is_jalr || is_jr) && !btb_resp.hit

  // bht 1
  decode.bp_info.bht_1_info.predicted_taken := bht_1_resp.taken
  decode.bp_info.bht_1_info.original_history := bht_1_resp.history
  decode.bp_info.bht_1_info.counter_idx := bht_1_resp.counter_idx

  // bht 2
  decode.bp_info.bht_2_info.predicted_taken := bht_2_resp.taken
  decode.bp_info.bht_2_info.original_history := bht_2_resp.history
  decode.bp_info.bht_2_info.counter_idx := bht_2_resp.counter_idx

  decode.bp_info.is_br := is_br
  decode.bp_info.is_j := is_j || is_jal
  decode.bp_info.is_jr := is_jalr || is_jr
  decode.bp_info.is_ret := is_ret

  // if we predict branch is taken, we needs to redirect IFU
  // as long as there are valid instruction in this stage,
  // we should keep telling ifu whether next instruction is delayslot
  // and whether instruction stream should be redirected
  io.bp.valid := instr_valid && decode.bp_info.branch_predicted && decode.bp_info.predicted_taken
  io.bp.bits.npc := decode.bp_info.predicted_target

  // tells ifu stage 1, whether it's delay slot or not
  // we moved delay slot logic from ifu stage 1 to idu
  // because delay slot detection requires partially decoding the fetched instruction
  // which becomes critical path if put into ifu stage 1
  io.delayslot.is_delayslot := (instr_valid && is_branch) || is_delayslot
  io.delayslot.branch_id := Mux(instr_valid && is_branch, brob_allocate.branch_id, branch_id)

  // ******************** flush logic ********************
  when (flush_valid) {
    is_delayslot := N
    instr_valid := N
  }
}
