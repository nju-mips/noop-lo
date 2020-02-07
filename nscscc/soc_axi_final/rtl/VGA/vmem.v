`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: dhr
// 
// Create Date: 2017/02/10 12:29:49
// Design Name: 
// Module Name: vmem
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

module vga_mem # (
	parameter VMEM_ADDR_WIDTH = 13,

    parameter screen_length = 800,
    parameter screen_width = 600,

    parameter X_WIDTH = 11,
    parameter Y_WIDTH = 11 )
    (
    input clk,
	input pclk,
    input reset,

	input vmem_w_en,
	input [VMEM_ADDR_WIDTH-3:0] vmem_w_addr,
	input [3:0]                 vmem_w_byte_en,
	input [31:0] vmem_w_data,

	input [VMEM_ADDR_WIDTH-1:0] vmem_r_addr,
	output reg [11:0] vga_rdata
    );

    reg  [31:0]  video_mem [(screen_length*screen_width/2-1):0];
	reg  [31:0]  vmem_word_data;
	reg          vmem_byte_sel;

    always @ (posedge clk) begin
        if( (vmem_w_en == 1'b1) & (reset == 1'b0) ) begin
            if( vmem_w_byte_en[0] ) 
                video_mem[ vmem_w_addr ][7:0]   <= vmem_w_data[7:0];
            if( vmem_w_byte_en[1] ) 
                video_mem[ vmem_w_addr ][15:8]  <= vmem_w_data[15:8];
            if( vmem_w_byte_en[2] ) 
                video_mem[ vmem_w_addr ][23:16] <= vmem_w_data[23:16];
            if( vmem_w_byte_en[3] )
                video_mem[ vmem_w_addr ][31:24] <= vmem_w_data[31:24];
        end
    end

	always @ (posedge pclk) begin
	    vmem_word_data <= video_mem[ vmem_r_addr[VMEM_ADDR_WIDTH-1:1] ];
        vmem_byte_sel <= vmem_r_addr[0];
    end

    always @ (*) begin
        case(vmem_byte_sel)
        2'd0:   vga_rdata = vmem_word_data[11:0];
        2'd1:   vga_rdata = vmem_word_data[27:16];
        endcase
    end

endmodule
