`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2017 03:25:38 PM
// Design Name: 
// Module Name: rams_sp_rf_rst
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

//Reference: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_1/ug901-vivado-synthesis.pdf

module rams_sp_rf # (
    parameter RAM_ADDR_WIDTH = 10,
    parameter RAM_DATA_WIDTH = 16
)
(
    input clk, 
    input en,
    input wen, 
    input [RAM_ADDR_WIDTH -1 : 0] addr, 
    input [RAM_DATA_WIDTH - 1 : 0] din, 
    output reg [RAM_DATA_WIDTH - 1 : 0] dout
);
    parameter RAM_DIPTH = 2 ** RAM_ADDR_WIDTH;

    reg [RAM_DATA_WIDTH - 1 : 0] ram [RAM_DIPTH - 1 : 0];
    
    always @(posedge clk) begin
        if (en) begin//optional enable
            if (wen) //write enable
                ram[addr] <= din;
            dout <= ram[addr];
        end
    end
endmodule

