`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////
 
module ifid_reg(
    input clk,
    input reset,
    input cu_stall,
    input cu_flush,
    input [31:0] pc,
    input [31:0] pc_4,
//    (* mark_debug = "true" *)
    input [31:0] instr,
    input [31:0] if_excepttype_i,

    output reg id_nop,
    output reg [31:0] ifid_pc,
    output reg [31:0] ifid_pc_4,
    output reg [31:0] ifid_instr,
    output [29:0] ifid_jump_addr,
    output [4:0] ifid_rs_addr,
    output [4:0] ifid_rt_addr,
    output [4:0] ifid_rd_addr,
    output [15:0] ifid_imm,
    output reg[31:0] ifid_excepttype_o
    );

    initial begin
        ifid_pc    = 32'd0;
        ifid_pc_4  = 32'd4;
        ifid_instr = 32'd0;
        id_nop = 1'b0;
        ifid_excepttype_o = 32'h0;
    end

    assign ifid_jump_addr = {ifid_pc[31:28], ifid_instr[25:0]};
    assign ifid_rs_addr   = ifid_instr[25:21];
    assign ifid_rt_addr   = ifid_instr[20:16];
    assign ifid_rd_addr   = ifid_instr[15:11];
    assign ifid_imm       = ifid_instr[15:0];
    
    always @(posedge clk) begin
        if (reset || (!cu_stall && cu_flush)) begin
            ifid_pc    <= 32'd0;
            ifid_pc_4  <= 32'd4;
            ifid_instr <= 32'd0; 
            id_nop     <= 1'b1;
            ifid_excepttype_o <= 32'h0;
        end
        else if (cu_stall) begin
            ifid_pc    <= ifid_pc;
            ifid_pc_4  <= ifid_pc_4;
            ifid_instr <= ifid_instr;
            id_nop     <= id_nop;
            ifid_excepttype_o <= ifid_excepttype_o;
        end
        else begin
            ifid_pc    <= pc;
            ifid_pc_4  <= pc_4;
            ifid_instr <= instr;
            id_nop     <= 1'b0;
            ifid_excepttype_o <= if_excepttype_i;
        end
    end

endmodule
