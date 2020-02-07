package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._
import Common.Instructions._

class BRU_IO(param: CoreParams) extends Bundle
{
  val in = Flipped(ValidIO(new ISU_BRU_DATAIN(param)))
  val rob = ValidIO(new ROBWPort(param))
  val bypass = ValidIO(new BRU_ISU_BYPASS(param))
  val flush = Flipped(ValidIO(new Flush(param)))
}

class BRU(param: CoreParams) extends Module
{
  val io = IO(new BRU_IO(param))
  val in_valid = RegInit(N)
  val in = Reg(new ISU_BRU_DATAIN(param))
  val bp_info = in.bp_info
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (in_valid) {
        printf("time: %d [isu_bru]: pc: %x rob_idx: %x etw: %x fu_op: %d a: %x b: %x predicted_taken: %d predicted_target: %x\n",
          GTimer(), in.pc, in.rob_idx, in.etw, in.fu_op, in.a, in.b, bp_info.predicted_taken, bp_info.predicted_target)
      }
    }
  }

  val flush = io.flush.bits
  val flush_valid = check_flush(io.flush.valid, flush.kind, flush.branch_id, in.is_delayslot, in.branch_id)

  // bru to isu bypass
  val bypass = io.bypass.bits
  if (param.pipelineDebug) {
    when (TraceTrigger()) {
      when (io.bypass.valid) {
        printf("time: %d [bru_isu]: rd_wen: %d rd: %d rob_idx: %d val: %x\n",
          GTimer(), bypass.rd_wen, bypass.rd, bypass.rob_idx, bypass.value)
      }
    }
  }

  when (io.in.valid) {
    in_valid := Y
    in := io.in.bits
  }

  when (!io.in.valid) { in_valid := N }

  // BRU
  val bru_op1 = in.a
  val bru_op2 = in.b
  val bru_pc = in.pc
  val bru_rd = in.rd
  val bru_op = in.fu_op

  val is_taken = Mux1H(Array(
    (bru_op === FU_OP_BRU_BEQ)   -> (bru_op1 === bru_op2),
    (bru_op === FU_OP_BRU_BNE)   -> (bru_op1 != bru_op2),
    (bru_op === FU_OP_BRU_BLEZ)  -> (bru_op1.asSInt <= 0.asSInt),
    (bru_op === FU_OP_BRU_BGTZ)  -> (bru_op1.asSInt > 0.asSInt),
    (bru_op === FU_OP_BRU_BLTZ)  -> (bru_op1.asSInt < 0.asSInt),
    (bru_op === FU_OP_BRU_BGEZ)  -> (bru_op1.asSInt >= 0.asSInt),
    (bru_op === FU_OP_BRU_BLTZAL)  -> (bru_op1.asSInt < 0.asSInt),
    (bru_op === FU_OP_BRU_BGEZAL)  -> (bru_op1.asSInt >= 0.asSInt),
    (bru_op === FU_OP_BRU_J)    -> Y,
    (bru_op === FU_OP_BRU_JAL)  -> Y,
    (bru_op === FU_OP_BRU_JR)   -> Y,
    (bru_op === FU_OP_BRU_JALR) -> Y,
  ))

  val bru_imm = in.offset(15, 0)
  val bru_ext_imm = Cat(Fill(14, bru_imm(15)), Cat(bru_imm, Fill(2, 0.U)))
  val br_target = bru_pc + 4.U + bru_ext_imm
  val j_target  = Cat(bru_pc(31, 28), Cat(in.offset(25, 0), Fill(2, 0.U)))
  val jr_target = bru_op1
  val bru_target = Mux1H(Array(
    (bru_op === FU_OP_BRU_BEQ)   -> br_target,
    (bru_op === FU_OP_BRU_BNE)   -> br_target,
    (bru_op === FU_OP_BRU_BLEZ)  -> br_target,
    (bru_op === FU_OP_BRU_BGTZ)  -> br_target,
    (bru_op === FU_OP_BRU_BLTZ)  -> br_target,
    (bru_op === FU_OP_BRU_BGEZ)  -> br_target,
    (bru_op === FU_OP_BRU_BLTZAL) -> br_target,
    (bru_op === FU_OP_BRU_BGEZAL) -> br_target,
    (bru_op === FU_OP_BRU_J)    -> j_target,
    (bru_op === FU_OP_BRU_JAL)  -> j_target,
    (bru_op === FU_OP_BRU_JR)   -> jr_target,
    (bru_op === FU_OP_BRU_JALR) -> jr_target,
  ))

  val bru_rd_wen = (bru_op === FU_OP_BRU_JAL) || (bru_op === FU_OP_BRU_JALR) || (bru_op === FU_OP_BRU_BLTZAL) || (bru_op === FU_OP_BRU_BGEZAL)

  io.rob.valid := in_valid && !flush_valid
  val rob = io.rob.bits
  rob.idx := in.rob_idx
  val robEntry = rob.entry
  robEntry.ready := Y
  robEntry.fu_type := FU_TYPE_BRU

  robEntry.value := in.pc + 8.U
  robEntry.rd := in.rd
  robEntry.rd_wen := bru_rd_wen
  robEntry.pc := in.pc
  robEntry.instr := in.instr
  robEntry.is_delayslot := in.is_delayslot
  robEntry.branch_id := in.branch_id
  robEntry.etw := in.etw

  robEntry.target := bru_target
  robEntry.is_taken := is_taken
  robEntry.bp_info <> in.bp_info

  robEntry.hi := DontCare
  robEntry.hi_wen := DontCare
  robEntry.lo := DontCare
  robEntry.lo_wen := DontCare

  robEntry.badvaddr := DontCare
  robEntry.lsq_idx := DontCare
  robEntry.is_load := DontCare
  robEntry.speculative := DontCare

  io.bypass.valid := io.rob.valid
  bypass.value := robEntry.value
  bypass.rd := robEntry.rd
  bypass.rob_idx := in.rob_idx
  bypass.rd_wen := robEntry.rd_wen
}
