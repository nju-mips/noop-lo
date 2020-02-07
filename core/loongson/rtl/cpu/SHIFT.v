`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/17 12:51:20
// Design Name: 
// Module Name: shift_mips32
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


module SHIFT
#(parameter DATA_WIDTH = 32,parameter OP_WIDTH = 2, parameter SHIFT_NUM_WIDTH = 5)
(
    input [DATA_WIDTH-1:0]shift_in,
    input [SHIFT_NUM_WIDTH-1:0] shift_amount,
    input [OP_WIDTH-1:0] shift_op,
    output reg [DATA_WIDTH-1:0] shift_out
 );
    always @(*)
    begin
        case(shift_op)
        2'b00:shift_out = shift_in << shift_amount;//逻辑左移
        2'b01:shift_out = shift_in >> shift_amount;//逻辑右移
        2'b10:shift_out = (shift_in >> shift_amount) | ({(DATA_WIDTH){shift_in[DATA_WIDTH-1]}} << (DATA_WIDTH - shift_amount));
        2'b11:shift_out = (shift_in >> shift_amount) | (shift_in << (DATA_WIDTH - shift_amount));//循环右移
        endcase
    end 
endmodule