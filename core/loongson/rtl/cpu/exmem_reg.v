`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: 
// 
// Create Date: 2016/12/01
// Design Name: 
// Module Name: exmem_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exmem_reg(
    input clk,
    input reset,
    input cu_stall,
    input cu_flush,
    input ex_nop,
    input ex_jmp,
    input idex_mem_w,
    input idex_mem_r,
    input idex_reg_w,
    input idex_branch,
    input [2:0] idex_condition,
    input [31:0] addr_target,
    input alu_lf,
    input alu_zf,
    input [31:0] ex_res,
    input [4:0] real_rd_addr,
    input [2:0] idex_load_sel,
    input [2:0] idex_store_sel,
    input [3:0] reg_byte_w_en_in,
    input [3:0] mem_byte_w_en_in,
    input [31:0] idex_pc,
    input [31:0] idex_pc_4,
    input [31:0] aligned_rt_data,
    input [4:0] idex_cp0_dst_addr,
    input cp0_w_en_in,
    input syscall_in,
    input idex_eret,
    input [31:0] idex_instr,

    //新添input
    input idex_is_in_delayslot, //从上�?个流水段继承
    input [31:0] excepttype_in, //exe段新产生
    input idex_jr,

    input ex_bp_result,

    output reg mem_nop,
    output reg mem_jmp,
    output reg [31:0] exmem_pc,
    output reg exmem_mem_w,
    output reg exmem_mem_r,
    output reg exmem_reg_w,
    output reg [3:0] reg_byte_w_en_out,
    output reg [4:0] exmem_rd_addr,
    output reg [3:0] mem_byte_w_en_out,
    output reg [31:0] exmem_alu_res,
    output reg [31:0] exmem_aligned_rt_data,
    output reg exmem_branch,
    output reg [2:0] exmem_condition,
    output reg [31:0] exmem_target,
    output reg [31:0] exmem_pc_4,
    output reg exmem_lf,
    output reg exmem_zf,
    output reg [2:0] exmem_load_sel,
    output reg [2:0] exmem_store_sel,
    output reg [4:0] exmem_cp0_dst_addr,
    output reg cp0_w_en_out,
    output reg syscall_out,
    output reg exmem_eret,
    output reg [31:0] exmem_instr,

    //新添output
    output reg exmem_is_in_delayslot,
    output reg [31:0] exmem_excepttype,
    output reg exmem_jr,
    
    output reg mem_bp_result

    );

    always@(posedge clk) begin
        if (reset || (!cu_stall && cu_flush)) begin
            exmem_pc        <= 0;
            exmem_mem_w     <= 0;
            exmem_mem_r     <= 0;
            exmem_reg_w     <= 0;
            reg_byte_w_en_out   <= 0;
            exmem_rd_addr   <= 0;
            mem_byte_w_en_out   <= 0;
            exmem_alu_res   <= 0;
            exmem_aligned_rt_data   <= 0;
            exmem_branch    <= 0;
            exmem_condition <= 0;
            exmem_target    <= 0;
            exmem_pc_4      <= 0;
            exmem_lf        <= 0;
            exmem_zf        <= 0;
            exmem_load_sel  <= 0;
            exmem_store_sel <= 0;
            exmem_cp0_dst_addr <= 0;
            cp0_w_en_out    <= 0;
            syscall_out     <= 0;
            exmem_eret      <= 0;
            mem_nop         <= 1;
            mem_jmp         <= 0;
            exmem_instr     <= 32'd0;

            //新添flush
            exmem_is_in_delayslot <= 1'b0;
            exmem_excepttype <= 32'd0;
            exmem_jr <= 1'b0;
            
            mem_bp_result <= 0;

        end
        else if (!cu_stall) begin
            exmem_pc        <= idex_pc;
            exmem_mem_w     <= idex_mem_w;
            exmem_mem_r     <= idex_mem_r;
            exmem_reg_w     <= idex_reg_w;
            if(idex_reg_w)
                reg_byte_w_en_out   <= reg_byte_w_en_in;
            else
                reg_byte_w_en_out <= 0;
            exmem_rd_addr   <= real_rd_addr;
            mem_byte_w_en_out   <= mem_byte_w_en_in;
            exmem_alu_res   <= ex_res;
            exmem_aligned_rt_data   <= aligned_rt_data;
            exmem_branch    <= idex_branch;
            exmem_condition <= idex_condition;
            exmem_target    <= addr_target;
            exmem_pc_4      <= idex_pc_4;
            exmem_lf        <= alu_lf;
            exmem_zf        <= alu_zf;
            exmem_load_sel  <= idex_load_sel;
            exmem_store_sel  <= idex_store_sel;
            exmem_cp0_dst_addr <= idex_cp0_dst_addr;
            cp0_w_en_out        <= cp0_w_en_in;
            syscall_out         <= syscall_in;
            exmem_eret      <= idex_eret;
            mem_nop         <= ex_nop;
            mem_jmp         <= ex_jmp;
            exmem_instr     <= idex_instr;

            //新添传�??
            exmem_is_in_delayslot <= idex_is_in_delayslot;
            exmem_excepttype <= excepttype_in;
            exmem_jr <= idex_jr;
            
            mem_bp_result <= ex_bp_result;

        end
    end
endmodule