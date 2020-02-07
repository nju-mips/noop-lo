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
module pc(
    input clk,
    input reset,
    input stall,
    input [31:0] pc_in,
//    (* mark_debug = "true" *)
    output reg [31:0] pc_out
);

initial begin
    pc_out <= 32'h0; //loader地址
end

always @(posedge clk) begin
    if (reset) begin
    	pc_out <= 32'hbfc00000; //loader地址
    end
    else if (!stall) begin
    	pc_out <= pc_in;
    end 	
end

endmodule
