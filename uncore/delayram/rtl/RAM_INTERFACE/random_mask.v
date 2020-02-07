`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/07 10:03:25
// Design Name: 
// Module Name: random_mask
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
`define RANDOM_SEED {23{1'b1}}

module random_mask(
    input clk,
    input resetn,
    output mask
    );
    reg [22:0] pseudo_random_23;
    always @ (posedge clk)
    begin
       if (!resetn)
           pseudo_random_23 <= `RANDOM_SEED;
       else
           pseudo_random_23 <= {pseudo_random_23[21:0],pseudo_random_23[22] ^ pseudo_random_23[17]};
    end
    assign mask = pseudo_random_23[10] & pseudo_random_23[20];
    
endmodule
