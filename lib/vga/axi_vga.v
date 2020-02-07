`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: DHR
// 
// Create Date: 2017/03/24 12:14:46
// Design Name: 
// Module Name: uart
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

module axi_vga # (
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

    parameter     VMEM_ADDR_WIDTH = 32
    )(
    //axi interface
    input axi_clk,
    input axi_resetn,

    input   [31:0] axi_awaddr,
	input   [0:0] axi_awvalid,
	output  [0:0] axi_awready,
	input   [31:0] axi_wdata,
	input   [3:0] axi_wstrb,
	input   [0:0] axi_wvalid,
	output [0:0] axi_wready,
	output [1:0] axi_bresp,
	output [0:0] axi_bvalid,
	input [0:0] axi_bready,
	input [31:0] axi_araddr,
	input [0:0] axi_arvalid,
	output [0:0] axi_arready,
	output [31:0] axi_rdata,
	output [1:0] axi_rresp,
	output [0:0] axi_rvalid,
	input [0:0] axi_rready,
    
    //vga
    input        vga_clk,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA CLK" *)
	output       m_clk,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA RED" *)
	output [3:0] m_red,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA GREEN" *)
    output [3:0] m_green,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA BLUE" *)
    output [3:0] m_blue,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA HSYNC" *)
    output       m_hsync,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA VSYNC" *)
    output       m_vsync,
	(* X_INTERFACE_INFO = "xilinx.com:interface:vga:1.0 VGA DE" *)
	output       m_de

    );
    
    wire wdata_en;
    wire [31:0] wdata;
    wire [31:0] wdata_addr;
    wire [3:0]  wdata_byte_en;

    axilite_naive_bridge b0(
        .axi_clk(axi_clk),
        .axi_resetn(axi_resetn),
		.axi_awaddr(axi_awaddr),
		.axi_awvalid(axi_awvalid),
		.axi_awready(axi_awready),
		.axi_wdata(axi_wdata),
		.axi_wstrb(axi_wstrb),
		.axi_wvalid(axi_wvalid),
		.axi_wready(axi_wready),
		.axi_bresp(axi_bresp),
		.axi_bvalid(axi_bvalid),
		.axi_bready(axi_bready),
		.axi_araddr(axi_araddr),
		.axi_arvalid(axi_arvalid),
		.axi_arready(axi_arready),
		.axi_rdata(axi_rdata),
		.axi_rresp(axi_rresp),
		.axi_rvalid(axi_rvalid),
		.axi_rready(axi_rready),

        .wdata_en(wdata_en),
        .wdata_addr(wdata_addr),
        .wdata(wdata),
        .wdata_byte_en(wdata_byte_en)
    );

    
    vga_controller # (
        .h_frontporch(h_frontporch),
        .h_active(h_active),
        .h_backporch(h_backporch),
        .h_total(h_total),

        .v_frontporch(v_frontporch),
        .v_active(v_active),
        .v_backporch(v_backporch),
        .v_total(v_total),

		.screen_length(screen_length),
		.screen_width(screen_width),

        .X_WIDTH(X_WIDTH),
        .Y_WIDTH(Y_WIDTH),

        .VMEM_ADDR_WIDTH(VMEM_ADDR_WIDTH)
    ) vga_ctr (

        .clk          ( axi_clk                      ),
		.pclk         ( vga_clk                      ),
        .reset        ( ~axi_resetn                         ),

        .vga_w_en     ( wdata_en                       ),
        .vga_w_addr   ( wdata_addr[VMEM_ADDR_WIDTH-1:0]  ),
        .vga_w_byte_en( wdata_byte_en                  ),
        .vga_w_data   ( wdata                     ),

        .hsync        ( m_hsync                         ),
        .vsync        ( m_vsync                         ),
        .vga_r        ( m_red                           ),
        .vga_g        ( m_green                         ),
        .vga_b        ( m_blue                          )
    );

endmodule
