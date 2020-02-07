
`ifndef __EXCEPTION_VH__
`define __EXCEPTION_VH__
`include "config.vh"

`ifdef SRAMLIKE_IF
`define EXCEPTION_ENTRY (32'hbfc0_0380)
`else
`define EXCEPTION_ENTRY (32'h1000_0020)
`endif

// used in always@()
`define ET_NONE         (32'h0)         // no excepttion
`define ET_INT          (32'h1)         // interruptions
`define ET_AdEL_IF      (32'h2)         // pc[1:0]  != 2'b00, AdEl occurs in if stage 
`define ET_SYSCALL      (32'h4)         // syscall instruction
`define ET_INVOP        (32'h8)         // invalid opcode
`define ET_OV           (32'h10)        // overflow
`define ET_TRAP         (32'h20)        // trap instruction     
`define ET_BP           (32'h40)        // breakpoint
`define ET_AdEL_LD      (32'h80)        // unaligned address when loading
`define ET_AdES         (32'h100)       // unaligned address when storing
`define ET_eret         (32'h200)       // eret

`define ET_check(etw, et) ((etw & et) == et)
`define ET_Areg(exception, ET)  exception = exception | ET
`define ET_ACond(new, old, ET, cond) assign new = old | ((cond) ? ET : `ET_NONE)

// A : Append
// used in assign, ET bit
`define ETB_INT         (0)         // interruptions
`define ETB_AdEL_IF     (1)         // pc[1:0]  != 2'b00, AdEl occurs in if stage 
`define ETB_SYSCALL     (2)         // syscall instruction
`define ETB_INVOP       (3)         // invalid opcode
`define ETB_OV          (4)         // overflow
`define ETB_TRAP        (5)         // trap instruction     
`define ETB_BP          (6)         // breakpoint
`define ETB_AdEL_LD     (7)         // unaligned address when loading
`define ETB_AdES        (8)         // unaligned address when storing
`define ETB_eret        (9)     // eret

`define ETB_ACond(bit, cond) ((cond) ? bit : 32'b0)
`define ET_Concat2(bit1, cond1, bit2, cond2) \
    (`ETB_ACond(bit1, cond1) | `ETB_ACond(bit2, cond2))
    
`define ET_Concat3(bit1, cond1, bit2, cond2, bit3, cond3) \
    (`ET_Concat2(bit1, cond1, bit2, cond2) | `ETB_ACond(bit3, cond3))
    
`define ET_Concat4(bit1, cond1, bit2, cond2, bit3, cond3, bit4, cond4) \
    (`ET_Concat2(bit1, cond1, bit2, cond2) | `ET_Concat2(bit3, cond3, bit4, cond4))
    
`define ET_Append1(new, old, bit1, cond1) \
        assign new = old | `ETB_ACond(bit1, cond1)
        
`define ET_Append2(new, old, bit1, cond1, bit2, cond2) \
        assign new = old | `ET_Concat2(bit1, cond1, bit2, cond2)
        
`define ET_Append3(new, old, bit1, cond1, bit2, cond2, bit3, cond3) \
        assign new = old | `ET_Concat3(bit1, cond1, bit2, cond2, bit3, cond3)
        
`define ET_Append4(new, old, bit1, cond1, bit2, cond2, bit3, cond3, bit4, cond4) \
        assign new = old | `ET_Concat4(bit1, cond1, bit2, cond2, bit3, cond3, bit4, cond4)       

`define ET_Append8(new, old, bit1, cond1, bit2, cond2, bit3, cond3, bit4, cond4, bit5, cond5, bit6, cond6, bit7, cond7, bit8, cond8) \
        assign new = old | `ET_Concat4(bit1, cond1, bit2, cond2, bit3, cond3, bit4, cond4) |  `ET_Concat4(bit5, cond5, bit6, cond6, bit7, cond7, bit8, cond8)
// `define ET_ADDREL        (32'h100)       // unaligned address when loading
// `define ET_ADDRES        (32'h200)       // unaligned address when storing


`define MASKED(int, mask1, mask2, mask3) (int) & (mask1) & (mask2) & (mask3)
`define INTMASKED(bit) `MASKED(cpr0[`CPR_Cause][bit], cpr0[`CPR_Status][bit], !cpr0[`CPR_Status][1], cpr0[`CPR_Status][0])

// priorty
`define PRI_NONE    (0)
`define PRI_INT     (1)
`define PRI_AdEL_IF (2)
`define PRI_SYSCALL (3)
`define PRI_INVOP   (4)
`define PRI_OV      (5)
`define PRI_TRAP    (6)
`define PRI_BP      (7)
`define PRI_AdEL_LD (8)
`define PRI_AdES    (9)
`define PRI_eret    (10)

//
// the Cause register field defination:
// +-------+-----+-----+-----+-----+-----+-----+-----+-----+---+---------+-----+
// + 31-16 +  15 +  14 +  13 +  12 +  11 +  10 +  9  +  8  + 7 +   6-2   + 1-0 +
// +-------+-----+-----+-----+-----+-----+-----+-----+-----+---+---------+-----+
// +       + IP7 + IP6 + IP5 + IP4 + IP3 + IP2 + IP1 + IP0 +   + ExcCode +     +
// +-------+-----+-----+-----+-----+-----+-----+-----+-----+---+---------+-----+
//
// IP7 - IP2 for interrupt
// IP1, IP0 for software interrupt
// ExcCode for exception
//
// where ExcCode encoding is as follows:
//

`define EC_Int      (5'd0)      // Interrupt
`define EC_AdEL     (5'd4)      // Address error exception(load or instruction fetch)
`define EC_AdES     (5'd5)      // Address error exception(store)
`define EC_SYSCALL  (5'd8)      // Syscall exception
`define EC_BP       (5'd9)      // Breakpoint exception
`define EC_RI       (5'd10)     // Reserved instruction exception
`define EC_OV       (5'd12)     // Arithmetic Overflow exception
`define EC_TR       (5'd13)     // Trap exception

//
// CP0 register index
//
// select 0
`define CPR_BadVAddr    (5'd8)
`define CPR_Count       (5'd9)
`define CPR_Compare     (5'd11)
`define CPR_Status      (5'd12)
`define CPR_Cause       (5'd13)
`define CPR_EPC         (5'd14)

// exception handle:
// Synchronization or asynchronous
// We only consider Synchronization
`define syn_exc_done(ExcCode, cur_inst_addr, isdelayslot) \
    if(isdelayslot == 1'b1) begin \
        cpr0[`CPR_Cause][31] <= 1'b1; \
        cpr0[`CPR_EPC] <= cur_inst_addr - `CONST_DATA_H(4); \
    end \
    else begin \
        cpr0[`CPR_Cause][31] <= 1'b0; \
        cpr0[`CPR_EPC] <= cur_inst_addr; \
    end \
    cpr0[`CPR_Status][1] <= 1'b1; \
    cpr0[`CPR_Cause][6:2] <= ExcCode


`endif /* __EXCEPTION_VH__ */
