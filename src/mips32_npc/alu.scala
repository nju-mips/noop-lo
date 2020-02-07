package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class ALU_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(ValidIO(new ISU_ALU_DATAIN(param)))
  val rob = ValidIO(new ROBWPort(param))
  val bypass = ValidIO(new ALU_ISU_BYPASS(param))
  val flush = Flipped(ValidIO(new Flush(param)))
}

class ALU(param: CoreParams) extends Module
{
  val io = IO(new ALU_IO(param))
  val in_valid = RegInit(N)
  val in = Reg(new ISU_ALU_DATAIN(param))
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (in_valid) {
        printf("time: %d [isu_alu]: pc: %x rob_idx: %x etw: %x fu_op: %d a: %x b: %x\n",
          GTimer(), in.pc, in.rob_idx, in.etw, in.fu_op, in.a, in.b)
      }
    }
  }

  val flush = io.flush.bits
  val flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, in.is_delayslot, in.branch_id)

  // alu to isu bypass
  val bypass = io.bypass.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bypass.valid) {
        printf("time: %d [alu_isu]: rd_wen: %d rd: %d rob_idx: %d val: %x \n",
          GTimer(), bypass.rd_wen, bypass.rd, bypass.rob_idx, bypass.value)
      }
    }
  }

  when (io.in.valid) {
    in_valid := Y
    in := io.in.bits
  }

  // ******************** flush logic ********************
  // this line covers flush logic as well
  // there are two cases:
  // 1. when flush happens and upstream does not send instr(delay slot instr) down
  // 2. flush does not happen and upstream does not send instr down
  // (flush_valid && !io.in.valid) || (!flush_valid && !io.in.flush.valid) == !io.in.valid
  when (!io.in.valid) { in_valid := N }

  // ALU
  val alu_op1 = in.a
  val alu_op2 = in.b
  val alu_op = in.fu_op
  val alu_shamt = alu_op1(4,0).asUInt

  val alu_out = Mux1H(Array(
    (alu_op === FU_OP_ALU_ADD)     -> (alu_op1 + alu_op2).asUInt,
    (alu_op === FU_OP_ALU_SUB)     -> (alu_op1 - alu_op2).asUInt,
    (alu_op === FU_OP_ALU_LUI)     -> (Cat(alu_op2(15, 0), Fill(16, 0.U))).asUInt,
    (alu_op === FU_OP_ALU_XOR)     -> (alu_op1 ^ alu_op2).asUInt,
    (alu_op === FU_OP_ALU_SLTU)    -> (alu_op1 < alu_op2).asUInt,
    (alu_op === FU_OP_ALU_SLT)     -> (alu_op1.asSInt < alu_op2.asSInt).asUInt,
    (alu_op === FU_OP_ALU_OR)      -> (alu_op1 | alu_op2).asUInt,
    (alu_op === FU_OP_ALU_SLL)     -> ((alu_op2 << alu_shamt)(param.xprlen - 1, 0)).asUInt,
    (alu_op === FU_OP_ALU_SRL)     -> (alu_op2 >> alu_shamt).asUInt,
    (alu_op === FU_OP_ALU_SRA)     -> (alu_op2.asSInt >> alu_shamt).asUInt,
    (alu_op === FU_OP_ALU_MOVN)    -> alu_op1.asUInt,
    (alu_op === FU_OP_ALU_MOVZ)    -> alu_op1.asUInt,
    (alu_op === FU_OP_ALU_AND)     -> (alu_op1 & alu_op2).asUInt,
    (alu_op === FU_OP_ALU_NOR)     -> (~(alu_op1 | alu_op2)).asUInt,
    (alu_op === FU_OP_ALU_ADD_OV)  -> (alu_op1 + alu_op2).asUInt,
    (alu_op === FU_OP_ALU_SUB_OV)  -> (alu_op1 - alu_op2).asUInt,
    (alu_op === FU_OP_ALU_CLZ)     -> CountLeadingZeros32(alu_op1)))


  val alu_overflow = Mux1H(Array(
    (alu_op === FU_OP_ALU_ADD_OV)  -> ((!alu_op1(31) && !alu_op2(31) && alu_out(31)) || (alu_op1(31) && alu_op2(31) && !alu_out(31))),
    (alu_op === FU_OP_ALU_SUB_OV)  -> ((!alu_op1(31) && alu_op2(31) && alu_out(31)) || (alu_op1(31) && !alu_op2(31) && !alu_out(31)))))

  val alu_rd_wen = MuxCase(Y, Array(
    (alu_op === FU_OP_ALU_MOVN)  -> (alu_op2 =/= 0.U),
    (alu_op === FU_OP_ALU_MOVZ)  -> (alu_op2 === 0.U)))

  io.rob.valid := in_valid && !flush_valid
  val rob = io.rob.bits
  rob.idx := in.rob_idx
  val robEntry = rob.entry
  // result ready, ready to be retired
  robEntry.ready := Y
  robEntry.fu_type := FU_TYPE_ALU

  robEntry.value := alu_out
  robEntry.rd := in.rd
  robEntry.rd_wen := alu_rd_wen
  robEntry.pc := in.pc
  robEntry.instr := in.instr
  robEntry.is_delayslot := in.is_delayslot
  robEntry.branch_id := in.branch_id
  robEntry.etw := in.etw | Mux(alu_overflow, ET_OV, 0.U)

  robEntry.target := DontCare
  robEntry.is_taken := DontCare
  robEntry.bp_info := DontCare

  robEntry.hi := DontCare
  robEntry.hi_wen := DontCare
  robEntry.lo := DontCare
  robEntry.lo_wen := DontCare

  robEntry.badvaddr := DontCare
  robEntry.lsq_idx := DontCare
  robEntry.is_load := DontCare
  robEntry.speculative := DontCare

  io.bypass.valid := io.rob.valid
  bypass.value := alu_out
  bypass.rd := robEntry.rd
  bypass.rob_idx := in.rob_idx
  bypass.rd_wen := robEntry.rd_wen
}
