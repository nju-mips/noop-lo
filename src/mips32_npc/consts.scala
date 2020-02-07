//**************************************************************************
// RISCV Processor Constants
//--------------------------------------------------------------------------
//
// Christopher Celio
// 2011 May 28

package NPC
package constants

import chisel3._
import chisel3.util._

trait ScalarOpConstants
{
  //************************************
  // Control Signals

  val Y      = true.B
  val N      = false.B

  // ALL the default signal value(all the ****_X value should not collide with valid other signal values)

  val A_SRC_WIDTH   = 3
  val A_SRC_X       = "b000".U(A_SRC_WIDTH.W)
  val A_SRC_RS      = "b001".U(A_SRC_WIDTH.W)
  val A_SRC_SA      = "b010".U(A_SRC_WIDTH.W)
  val A_SRC_HI      = "b011".U(A_SRC_WIDTH.W)
  val A_SRC_LO      = "b100".U(A_SRC_WIDTH.W)
  val A_SRC_CP0     = "b101".U(A_SRC_WIDTH.W)
  val A_SRC_CP0_EPC = "b110".U(A_SRC_WIDTH.W)

  val B_SRC_WIDTH   = 2
  val B_SRC_X       = "b00".U(B_SRC_WIDTH.W)
  val B_SRC_REG     = "b01".U(B_SRC_WIDTH.W)
  val B_SRC_IMM     = "b10".U(B_SRC_WIDTH.W)

  val EXT_TYPE_WIDTH = 1
  val EXT_TYPE_SIGN = "b0".U(EXT_TYPE_WIDTH.W)
  val EXT_TYPE_ZERO = "b1".U(EXT_TYPE_WIDTH.W)
  val EXT_TYPE_X    = "b0".U(EXT_TYPE_WIDTH.W)

  val RD_SEL_WIDTH = 3
  val RD_SEL_X    = "b000".U(RD_SEL_WIDTH.W)
  val RD_SEL_RD   = "b001".U(RD_SEL_WIDTH.W)
  val RD_SEL_RT   = "b010".U(RD_SEL_WIDTH.W)
  val RD_SEL_31   = "b011".U(RD_SEL_WIDTH.W)
  val RD_SEL_HI   = "b100".U(RD_SEL_WIDTH.W)
  val RD_SEL_LO   = "b101".U(RD_SEL_WIDTH.W)
  val RD_SEL_HILO = "b110".U(RD_SEL_WIDTH.W)

  val FU_TYPE_WIDTH = 3
  val FU_TYPE_X   = "b000".U(FU_TYPE_WIDTH.W)
  val FU_TYPE_ALU = "b000".U(FU_TYPE_WIDTH.W)
  val FU_TYPE_LSU = "b001".U(FU_TYPE_WIDTH.W)
  val FU_TYPE_BRU = "b010".U(FU_TYPE_WIDTH.W)
  val FU_TYPE_MDU = "b011".U(FU_TYPE_WIDTH.W)
  val FU_TYPE_PRU = "b100".U(FU_TYPE_WIDTH.W)

  val FU_OP_WIDTH = 5
  val FU_OP_ALU_X      = "b00000".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_ADD    = "b00001".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_LUI    = "b00010".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SLT    = "b00011".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SLTU   = "b00100".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_AND    = "b00101".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_OR     = "b00110".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_XOR    = "b00111".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_NOR    = "b01000".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SUB    = "b01001".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SLL    = "b01010".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SRL    = "b01011".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SRA    = "b01100".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_MOVN   = "b01101".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_MOVZ   = "b01110".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_ADD_OV = "b10001".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_SUB_OV = "b10011".U(FU_OP_WIDTH.W)
  val FU_OP_ALU_CLZ    = "b10100".U(FU_OP_WIDTH.W)

  val FU_OP_LSU_X   = "b00000".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LB  = "b00001".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LH  = "b00010".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LWL = "b00011".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LW  = "b00100".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LBU = "b00101".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LHU = "b00110".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LWR = "b00111".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SB  = "b01000".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SH  = "b01001".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SWL = "b01010".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SW  = "b01011".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SWR = "b01100".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_LL  = "b01101".U(FU_OP_WIDTH.W)
  val FU_OP_LSU_SC  = "b01110".U(FU_OP_WIDTH.W)

  val FU_OP_BRU_X      = "b00000".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BEQ    = "b00001".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGEZ   = "b00010".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGTZ   = "b00011".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BNE    = "b00100".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLTZ   = "b00101".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLEZ   = "b00110".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_J      = "b00111".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_JAL    = "b01000".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_JR     = "b01001".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_JALR   = "b01010".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGEZAL = "b01011".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLTZAL = "b01100".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BEQL   = "b01101".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGEZL  = "b01110".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGTZL  = "b01111".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BNEL   = "b10001".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLTZL  = "b10010".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLEZL  = "b10011".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BGEZALL= "b10100".U(FU_OP_WIDTH.W)
  val FU_OP_BRU_BLTZALL= "b10101".U(FU_OP_WIDTH.W)

  val FU_OP_MDU_X     = "b00000".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MUL   = "b00001".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MULT  = "b00010".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MULTU = "b00011".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_DIV   = "b00100".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_DIVU  = "b00101".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MFHI  = "b00110".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MTHI  = "b00111".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MFLO  = "b01000".U(FU_OP_WIDTH.W)
  val FU_OP_MDU_MTLO  = "b01001".U(FU_OP_WIDTH.W)

  val FU_OP_PRU_X      = "b00000".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_ERET   = "b00001".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_SYS    = "b00010".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_MFC0   = "b00011".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_MTC0   = "b00100".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLBP   = "b00101".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLBR   = "b00110".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLBWI  = "b00111".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLBWR  = "b01000".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_BREAK  = "b01001".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_CACHE  = "b01010".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_SYNC   = "b01011".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TGE    = "b01100".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TGEU   = "b01101".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLT    = "b01110".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TLTU   = "b01111".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TEQ    = "b10000".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_TNE    = "b10001".U(FU_OP_WIDTH.W)
  val FU_OP_PRU_PREF   = "b10010".U(FU_OP_WIDTH.W)

  val FU_OP_X = "b00000".U(FU_OP_WIDTH.W)

  val FLUSH_KIND_WIDTH = 2
  val FLUSH_KIND_NO_FLUSH = "b00".asUInt(FLUSH_KIND_WIDTH.W)
  val FLUSH_KIND_NO_COND = "b01".asUInt(FLUSH_KIND_WIDTH.W)
  val FLUSH_KIND_FLUSH_COND = "b10".asUInt(FLUSH_KIND_WIDTH.W)
  def check_flush(flush_valid: Bool, flush_kind: UInt, flush_branch_id: UInt, is_delayslot: Bool, branch_id: UInt) = {
    val f_valid = flush_valid && (flush_kind === FLUSH_KIND_NO_COND ||
      (flush_kind === FLUSH_KIND_FLUSH_COND && (!is_delayslot || flush_branch_id =/= branch_id)))
    f_valid
  }
}

trait CP0Constants {
  val AM_EVL = 0x10000020.U // exception vector location

  val EXC_WIDTH = 5
  // EXC code
  val EXC_INTR    = 0.U(EXC_WIDTH.W)   // - Interrupt
  val EXC_Mod     = 1.U(EXC_WIDTH.W)   // * TLB modification
  val EXC_TLBL    = 2.U(EXC_WIDTH.W)   // * TLB load
  val EXC_TLBS    = 3.U(EXC_WIDTH.W)   // * TLB store
  val EXC_AdEL    = 4.U(EXC_WIDTH.W)   // * Address Load
  val EXC_AdES    = 5.U(EXC_WIDTH.W)   // * Address Store
  val EXC_IBE     = 6.U(EXC_WIDTH.W)   //   Bus error(IF)
  val EXC_DBE     = 7.U(EXC_WIDTH.W)   //   Bus error(data)
  val EXC_SYSCALL = 8.U(EXC_WIDTH.W)   // * Syscall
  val EXC_BP      = 9.U(EXC_WIDTH.W)   //   Break Point
  val EXC_RI      = 10.U(EXC_WIDTH.W)  // * Reserved instruction
  val EXC_CPU     = 11.U(EXC_WIDTH.W)  // * Coprocessor unusable
  val EXC_OV      = 12.U(EXC_WIDTH.W)  // * Arithmetic overflow
  val EXC_TRAP    = 13.U(EXC_WIDTH.W)  // * Trap

  // exception type
  val ETW_WIDTH = 32
  val ET_NONE     =  0x0.U(ETW_WIDTH.W)    // no excepttion
  val ET_INT      =  0x1.U(ETW_WIDTH.W)    // interruptions
  val ET_AdEL_IF  =  0x2.U(ETW_WIDTH.W)    // pc[1:0]  != 2'b00, AdEl occurs in if stage 
  val ET_SYSCALL  =  0x4.U(ETW_WIDTH.W)    // syscall instruction
  val ET_INVOP    =  0x8.U(ETW_WIDTH.W)    // invalid opcode
  val ET_OV       =  0x10.U(ETW_WIDTH.W)   // overflow
  val ET_TRAP     =  0x20.U(ETW_WIDTH.W)   // trap instruction     
  val ET_BP       =  0x40.U(ETW_WIDTH.W)   // breakpoint
  val ET_AdEL_LD  =  0x80.U(ETW_WIDTH.W)   // unaligned address when loading
  val ET_AdES     =  0x100.U(ETW_WIDTH.W)  // unaligned address when storing
  val ET_eret     =  0x200.U(ETW_WIDTH.W)  // eret
  val ET_Mod      =  0x400.U(ETW_WIDTH.W)  // TLB modification
  val ET_TLBL     =  0x800.U(ETW_WIDTH.W)  // TLB load/IF
  val ET_TLBS     =  0x1000.U(ETW_WIDTH.W) // TLB store

  val SCOREBOARD_STATUS_WIDTH = 2
  // each sboard entry correspond to an architectural register file
  // below are possible status of a ARF
  val SB_READY     =  0x0.U(SCOREBOARD_STATUS_WIDTH.W) // TLB store
  val SB_BUSY      =  0x1.U(SCOREBOARD_STATUS_WIDTH.W) // TLB store
  val SB_ROB_READY =  0x2.U(SCOREBOARD_STATUS_WIDTH.W) // TLB store

  // exception bit
  val ETB_INT     =  0         // interruptions
  val ETB_AdEL_IF =  1         // pc[1:0]  != 2'b00, AdEl occurs in if stage 
  val ETB_SYSCALL =  2         // syscall instruction
  val ETB_INVOP   =  3         // invalid opcode
  val ETB_OV      =  4         // overflow
  val ETB_TRAP    =  5         // trap instruction     
  val ETB_BP      =  6         // breakpoint
  val ETB_AdEL_LD =  7         // unaligned address when loading
  val ETB_AdES    =  8         // unaligned address when storing
  val ETB_eret    =  9         // eret
  val ETB_Mod     =  10        // TLB modification
  val ETB_TLBL    =  11        // TLB load/IF
  val ETB_TLBS    =  12        // TLB store
}
