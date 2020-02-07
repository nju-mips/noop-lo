//**************************************************************************
// RISCV Processor 
//--------------------------------------------------------------------------
//

// Christopher Celio
// 2011 Jul 30
//
// Describes a simple RISCV 1-stage processor
//   - No div/mul/rem
//   - No FPU
//   - implements a minimal supervisor mode (can trap to handle the
//       above instructions)
//
// The goal of the 1-stage is to provide the simpliest, easiest-to-read code to
// demonstrate the RISC-V ISA.

package NPC

import chisel3._
import chisel3.util._

// NPC constants, signal width, etc
import NPCConstants._
// MIPS architecture related constants and common uncore constants
import Common._
import Common.Constants._


class NEMUCommit(param: CoreParams) extends Bundle {
  val valid = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val gpr = Output(Vec(32, UInt(param.xprlen.W)))

  override def cloneType = new NEMUCommit(param).asInstanceOf[this.type]
}

class NEMUCPR(param: CoreParams) extends Bundle {
  val count0 = Output(UInt(param.xprlen.W))

  override def cloneType = new NEMUCPR(param).asInstanceOf[this.type]
}

class TLBRequest(param: CoreParams) extends Bundle {
  val fcn = Output(Bool()) // 1: load, 0:store
  val vaddr = Output(UInt(param.xprlen.W))

  override def cloneType = new TLBRequest(param).asInstanceOf[this.type]
}

class TLBResponse(param: CoreParams) extends Bundle {
  val paddr = Output(UInt(param.xprlen.W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = new TLBResponse(param).asInstanceOf[this.type]
}

class TLBTransaction(param: CoreParams) extends Bundle {
  // when tlbx is executing, the req should be hanged
  val req = DecoupledIO(new TLBRequest(param))
  val resp = Flipped(ValidIO(new TLBResponse(param)))

  override def cloneType = new TLBTransaction(param).asInstanceOf[this.type]
}

class Interrupt extends Bundle {
  val bits = UInt(6.W)
}

class ExceptionInfo(param: CoreParams) extends Bundle
{
  val etw = Output(UInt(ETW_WIDTH.W))
  val pc = Output(UInt(param.xprlen.W))
  val badvaddr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  override def cloneType = { new ExceptionInfo(param).asInstanceOf[this.type] }
}

class CP0_RES(param: CoreParams) extends Bundle
{
  // for segment
  val seg_base = Output(UInt(param.xprlen.W))
  val spr_valid = Output(Bool()) /* switch privilege valid */
  // for normal exception
  val has_exception = Output(Bool())
  val flush_addr = Output(UInt(param.xprlen.W))
  override def cloneType = { new CP0_RES(param).asInstanceOf[this.type] }
}

class LoongsonCommit(param: CoreParams) extends Bundle
{
  val ninstr = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val wb_valid = Output(Bool())
  val wb_pc = Output(UInt(param.xprlen.W))
  val wb_rf_wen = Output(Bool())
  val wb_rf_wdata = Output(UInt(param.xprlen.W))
  val wb_rf_wnum = Output(UInt(5.W))

  override def cloneType = { new LoongsonCommit(param).asInstanceOf[this.type] }
}

// Branch prediction BHT Info
class BHTInfo(param: BHTParams) extends Bundle
{
  val predicted_taken = Output(Bool())
  val original_history = Output(UInt((if(param.historyLength > 0) param.historyLength else 1).W))
  val counter_idx = Output(UInt(param.counterIndexWidth.W))

  override def cloneType = { new BHTInfo(param).asInstanceOf[this.type] }
}

// Branch prediction Pipeline Info
class BPInfo(param: CoreParams) extends Bundle
{
  // branch prediction part
  // we got these from BHTs
  // may be outdated and may be wrong
  val bht_1_info = new BHTInfo(param.bht1Param)
  val bht_2_info = new BHTInfo(param.bht2Param)

  // use these to check for branch misprediction
  val branch_predicted = Output(Bool())
  val predicted_taken = Output(Bool())
  val predicted_target = Output(UInt(param.xprlen.W))

  val btb_miss = Output(Bool())
  // for revert RAS on branch misprediction
  val original_top = Output(UInt(log2Ceil(param.rasStackDepth).W))

  // we got these by partial decoding the fetched instructions
  // these informations are accurate
  val is_br = Output(Bool())
  val is_j = Output(Bool())
  val is_jr = Output(Bool())
  val is_ret = Output(Bool())

  override def cloneType = { new BPInfo(param).asInstanceOf[this.type] }
}

class IFU_IDU_INSTR(param: CoreParams) extends Bundle
{
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val etw = Output(UInt(ETW_WIDTH.W)) // execption type word
  override def cloneType = { new IFU_IDU_INSTR(param).asInstanceOf[this.type] }
}

class IDU_ISU_DECODE(param: CoreParams) extends Bundle
{
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))

  val rs = Output(UInt(5.W))
  val rs_rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val rs_sb_status = Output(UInt(SCOREBOARD_STATUS_WIDTH.W))

  val rt = Output(UInt(5.W))
  val rt_rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val rt_sb_status = Output(UInt(SCOREBOARD_STATUS_WIDTH.W))

  // shift amount
  val sa = Output(UInt(5.W)) // shift amount
  // this covers the immediate as [15:0]
  val offset = Output(UInt(26.W))
  // use chiselTypeOf to tell chisel, b_src is of the same type as B_SRC_X
  val b_src = Output(chiselTypeOf(B_SRC_X))
  val ext_type = Output(chiselTypeOf(EXT_TYPE_X))
  val rd = Output(UInt(5.W))
  val rd_sel = Output(chiselTypeOf(RD_SEL_X))
  val rd_rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val fu_type = Output(chiselTypeOf(FU_TYPE_X))
  val fu_op = Output(chiselTypeOf(FU_OP_X))
  val a_src = Output(chiselTypeOf(A_SRC_X))
  val sel = Output(UInt(3.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val lsq_idx = Output(UInt(log2Up(param.nLSQEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  // branch prediction
  val bp_info = new BPInfo(param)
  override def cloneType = { new IDU_ISU_DECODE(param).asInstanceOf[this.type] }
}

class ISU_PRU_DATAIN(param: CoreParams) extends Bundle
{
  val a = Output(UInt(param.xprlen.W))
  val b = Output(UInt(param.xprlen.W))
  val fu_op = Output(UInt(5.W))
  val reg = Output(UInt(5.W))
  val sel = Output(UInt(3.W))
  val rd = Output(UInt(5.W))

  // for cache instruction
  val base = Output(UInt(param.xprlen.W))
  val offset = Output(UInt(param.xprlen.W))
  val op = Output(UInt(5.W))
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new ISU_PRU_DATAIN(param).asInstanceOf[this.type] }
}

class PRU_WBU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new PRU_WBU_RES(param).asInstanceOf[this.type] }
}

class ISU_ALU_DATAIN(param: CoreParams) extends Bundle
{
  val a = Output(UInt(param.xprlen.W))
  val b = Output(UInt(param.xprlen.W))
  val fu_op = Output(UInt(5.W))
  val rd = Output(UInt(5.W))
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new ISU_ALU_DATAIN(param).asInstanceOf[this.type] }
}

class ISU_MDU_DATAIN(param: CoreParams) extends Bundle
{
  val a = Output(UInt(param.xprlen.W))
  val b = Output(UInt(param.xprlen.W))
  val fu_op = Output(UInt(5.W))
  val rd = Output(UInt(5.W))
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new ISU_MDU_DATAIN(param).asInstanceOf[this.type] }
}

class ISU_LSU_DATAIN(param: CoreParams) extends Bundle
{
  val base = Output(UInt(param.xprlen.W))
  val offset = Output(UInt(param.xprlen.W))
  val wdata = Output(UInt(param.xprlen.W))
  val fu_op = Output(UInt(5.W))
  val rd = Output(UInt(5.W))
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val lsq_idx = Output(UInt(log2Up(param.nLSQEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new ISU_LSU_DATAIN(param).asInstanceOf[this.type] }
}

class ISU_BRU_DATAIN(param: CoreParams) extends Bundle
{
  val a = Output(UInt(param.xprlen.W))
  val b = Output(UInt(param.xprlen.W))
  val fu_op = Output(UInt(5.W))
  val rd = Output(UInt(5.W))
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val offset = Output(UInt(26.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  // branch prediction
  val bp_info = new BPInfo(param)
  override def cloneType = { new ISU_BRU_DATAIN(param).asInstanceOf[this.type] }
}

class ALU_WBU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new ALU_WBU_RES(param).asInstanceOf[this.type] }
}

class ALU_ISU_BYPASS(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new ALU_ISU_BYPASS(param).asInstanceOf[this.type] }
}

class PRU_ISU_BYPASS(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new PRU_ISU_BYPASS(param).asInstanceOf[this.type] }
}

class MDU_WBU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))
  val hi = Output(UInt(param.xprlen.W))
  val hi_wen = Output(Bool())
  val lo = Output(UInt(param.xprlen.W))
  val lo_wen = Output(Bool())

  override def cloneType = { new MDU_WBU_RES(param).asInstanceOf[this.type] }
}

class MDU_ISU_BYPASS(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val hi = Output(UInt(param.xprlen.W))
  val hi_wen = Output(Bool())
  val lo = Output(UInt(param.xprlen.W))
  val lo_wen = Output(Bool())
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new MDU_ISU_BYPASS(param).asInstanceOf[this.type] }
}

class LSU_WBU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val badvaddr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  override def cloneType = { new LSU_WBU_RES(param).asInstanceOf[this.type] }
}

class LSU_ISU_BYPASS(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new LSU_ISU_BYPASS(param).asInstanceOf[this.type] }
}

class BRU_WBU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val target = Output(UInt(param.xprlen.W))
  val is_taken = Output(Bool())
  val pc = Output(UInt(param.xprlen.W))
  val instr = Output(UInt(param.xprlen.W))
  val is_delayslot = Output(Bool())
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  val etw = Output(UInt(ETW_WIDTH.W))

  // branch prediction
  val bp_info = new BPInfo(param)
  override def cloneType = { new BRU_WBU_RES(param).asInstanceOf[this.type] }
}

class BRU_ISU_BYPASS(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rd_wen = Output(Bool())
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  override def cloneType = { new BRU_ISU_BYPASS(param).asInstanceOf[this.type] }
}

class WBU_ISU_RES(param: CoreParams) extends Bundle
{
  val value = Output(UInt(param.xprlen.W))
  val rd = Output(UInt(5.W))
  val rob_idx = Output(UInt(log2Up(param.nROBEntries).W))
  // when should_write is high, the rd will be set ready
  // when do_write is high, rd will be actually written
  // the write back value is valid only if do_write is high
  // this is specially designed for conditional move instructions
  val rd_should_write = Output(Bool())
  val rd_do_write = Output(Bool())
  val hi = Output(UInt(param.xprlen.W))
  val hi_wen = Output(Bool())
  val lo = Output(UInt(param.xprlen.W))
  val lo_wen = Output(Bool())

  // for commit log
  val commit = Output(Bool())
  val curr_pc = Output(UInt(param.xprlen.W))
  val curr_instr = Output(UInt(param.xprlen.W))
  override def cloneType = { new WBU_ISU_RES(param).asInstanceOf[this.type] }
}

class Flush(param: CoreParams) extends Bundle
{
  // eret flush signals
  val seg_base = Output(UInt(param.xprlen.W))
  val spr_valid = Output(Bool())
  // normal flush signals
  val kind = Output(UInt(FLUSH_KIND_WIDTH.W))
  val branch_id = Output(UInt(log2Up(param.nBROBEntries).W))
  // next/new pc
  val npc = Output(UInt(param.xprlen.W))
  override def cloneType = { new Flush(param).asInstanceOf[this.type] }
}
