`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2017 03:25:38 PM
// Design Name: 
// Module Name: test
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


module bytewrite_sp_ram_rf #(
    parameter COL_WIDTH = 8, //byte width
    parameter RAM_ADDR_WIDTH = 8,
    parameter RAM_DATA_WIDTH = 128, // Data Width in bits
    parameter NUM_COL = RAM_DATA_WIDTH / COL_WIDTH
//-----------------------------------------------------------------
) (
    input clk,
    input en,
    input [NUM_COL - 1:0] wen,
    input [RAM_ADDR_WIDTH - 1:0] addr,
    input [RAM_DATA_WIDTH - 1:0] din,
    output reg [RAM_DATA_WIDTH-1:0] dout
);
    
    
    // Core Memory
    reg [RAM_DATA_WIDTH-1:0] ram_block [(2**RAM_ADDR_WIDTH)-1:0];
    integer i;
    // Port-A Operation
    always @ (posedge clk) begin
        if(en) begin
            for(i=0;i<NUM_COL;i=i+1) begin
                if(wen[i]) begin
                    ram_block[addr][i*COL_WIDTH +: COL_WIDTH] <= din[i*COL_WIDTH +: COL_WIDTH];
                end
            end
            dout <= ram_block[addr];
        end
    end

endmodule

