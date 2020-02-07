`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: dhr
// 
// Create Date: 2017/02/10 12:08:04
// Design Name: 
// Module Name: vga_controller
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



module vga_controller # (
    parameter     h_frontporch = 56-1,
    parameter     h_active = 56+120-1,
    parameter     h_backporch = 56+120+800-1,
    parameter     h_total = 56+120+800+64-1,

    parameter     v_frontporch = 37-1,
    parameter     v_active = 37+6-1,
    parameter     v_backporch = 37+6+600-1,
    parameter     v_total = 37+6+600+23-1,

	parameter     screen_length = 400,
    parameter     screen_width = 300,

    parameter     X_WIDTH = 11,
    parameter     Y_WIDTH = 11,

    parameter     VMEM_ADDR_WIDTH = 32	)
    (
    input                        clk,
	input                        pclk,
    input                        reset,
 
	input                        vga_w_en,
	input  [VMEM_ADDR_WIDTH-1:0] vga_w_addr,
	input  [3:0]                 vga_w_byte_en,
	input  [31:0] vga_w_data,

    output                       hsync,
    output                       vsync,
	output [3:0]                 vga_r,
    output [3:0]                 vga_g,
    output [3:0]                 vga_b
    );

    wire [VMEM_ADDR_WIDTH-1:0] vmem_image_r_addr;
    wire [VMEM_ADDR_WIDTH-1:0] vmem_text_r_addr;
    wire [X_WIDTH-1:0]         h_cnt;
    wire [Y_WIDTH-1:0]         v_cnt;
    wire [11:0]                vga_data;

    vga_mem # (
	    .VMEM_ADDR_WIDTH ( VMEM_ADDR_WIDTH  ),
        .screen_length   ( screen_length       ),
        .screen_width    ( screen_width        ),
        .X_WIDTH         ( X_WIDTH          ),
        .Y_WIDTH         ( Y_WIDTH          )
    ) video_mem (
        .clk             ( clk              ),
	    .pclk            ( pclk             ),
        .reset           ( reset            ),

	    .vmem_w_en       ( vga_w_en        ),
	    .vmem_w_addr     ( vga_w_addr[VMEM_ADDR_WIDTH-1:2]       ),
	    .vmem_w_byte_en  ( vga_w_byte_en    ),
	    .vmem_w_data     ( vga_w_data       ),

	    .vmem_r_addr( vmem_text_r_addr ),
	    .vga_rdata        ( vga_data         )
    );

	vga_dis # (
        .h_frontporch    ( h_frontporch     ),
        .h_active        ( h_active         ),
        .h_backporch     ( h_backporch      ),
        .h_total         ( h_total          ),

        .v_frontporch    ( v_frontporch     ),
        .v_active        ( v_active         ),
        .v_backporch     ( v_backporch      ),
        .v_total         ( v_total          ),
		
		.screen_length   ( screen_length       ),
        .screen_width    ( screen_width        ),
        
        .VMEM_ADDR_WIDTH ( VMEM_ADDR_WIDTH  ),
        
        .X_WIDTH         ( X_WIDTH          ),
        .Y_WIDTH         ( Y_WIDTH          )
    ) display_screen (
        .pclk            ( pclk             ),
        .reset           ( reset            ),

	    .vga_data        ( vga_data         ),
	    .vmem_image_r_addr( vmem_image_r_addr ),

        .vmem_text_r_addr(vmem_text_r_addr),
        .h_cnt( h_cnt ),
        .v_cnt( v_cnt ),

        .hsync           ( hsync            ),
        .vsync           ( vsync            ),
	    .vga_r           ( vga_r            ),
        .vga_g           ( vga_g            ),
        .vga_b           ( vga_b            )
    );

endmodule
