`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 14:08:54
// Design Name: 
// Module Name: adder
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


module adder(
    input cin,
    input [31:0] a_in,b_in,
    output zero,carry,overflow,negative,
    output [31:0] o_out
    );
    
    wire [31:0] b_in_not;
    assign b_in_not = b_in ^ {32{cin}};//
    assign {carry,o_out} = a_in + b_in_not  + cin;
    assign zero = (o_out == 0)?1:0;
    assign overflow = (!a_in[31] & !b_in_not[31] & o_out[31]) | (a_in[31] & b_in_not[31] & !o_out[31]);
    assign negative = o_out[31];
endmodule