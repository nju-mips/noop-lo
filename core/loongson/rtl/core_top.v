`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer:
// 
// Create Date: 2017/07/25 17:36:56
// Design Name: 
// Module Name: _core_top
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

`include "axilite.vh"
module _core_top(
    input clk,
    input reset,
    input [7:0] interrupt,

    output  [ 3:0]  inst_sram_cen,
    output  [31:0]  inst_sram_wdata,
    input   [31:0]  inst_sram_rdata,
    output          inst_sram_wr,
    output  [31:0]  inst_sram_addr,
    input           inst_sram_ack,
    input           inst_sram_rrdy,

    output  [ 3:0]  data_sram_cen,
    output  [31:0]  data_sram_wdata,
    input   [31:0]  data_sram_rdata,
    output          data_sram_wr,
    output  [31:0]  data_sram_addr,
    input           data_sram_ack,
    input           data_sram_rrdy
    );
    
wire mem_stall;

wire        cpu_clk;
wire [31:0] cpu_ic_addr;
wire [31:0] cpu_dc_addr;
wire        cpu_dc_ren;
wire [31:0] cpu_dc_rdata;
wire        cpu_dc_wen;
wire [3:0]  cpu_dc_byte_wen;
wire [31:0] cpu_dc_wdata;
wire        time_int_o;

cpu_top pipeline_cpu(
	.clk              ( clk                ),
	.reset            ( reset              ),
	.interruptions    ( interrupt          ),
    
	.dc_data_out      ( cpu_dc_rdata       ),
    .data_stall       ( mem_stall          ),
	.dc_addr          ( cpu_dc_addr        ),
	.dc_read_in       ( cpu_dc_ren         ),
	.dc_write_in      ( cpu_dc_wen         ),
	.dc_byte_w_en     ( cpu_dc_byte_wen    ),
	.data_reg         ( cpu_dc_wdata       ),

    .inst_sram_cen(inst_sram_cen),
    .inst_sram_wdata(inst_sram_wdata),
    .inst_sram_rdata(inst_sram_rdata),
    .inst_sram_wr(inst_sram_wr),
    .inst_sram_addr(cpu_ic_addr),
    .inst_sram_addr_ok(inst_sram_ack),
    .inst_sram_data_ok(inst_sram_rrdy),
    
	.time_int_o       (          )
);

fmt inst_mmu(
	.vaddr(cpu_ic_addr),
	.phaddr(inst_sram_addr)
);

wire data_rstall, data_wstall;
assign mem_stall = data_rstall | data_wstall;
wire [31:0] data_phaddr;
fmt data_mmu(
	.vaddr(cpu_dc_addr),
	.phaddr(data_phaddr)
);
naive_to_sramlike data_bridge(
    .clk(clk),
    .reset(reset),
    
    .wdata_en(cpu_dc_wen),
    .wdata_addr(data_phaddr),
    .wdata_byte_en(cpu_dc_byte_wen),
    .wdata(cpu_dc_wdata),
    .wdata_stall(data_wstall),

    .rdata_en(cpu_dc_ren),
    .rdata_addr(data_phaddr),
    .rdata(cpu_dc_rdata),
    .rdata_stall(data_rstall),

    .addr(data_sram_addr),
    .ben(data_sram_cen),
    .wr(data_sram_wr),
    .addr_ok(data_sram_ack),
    .data_ok(data_sram_rrdy),
    .dout(data_sram_rdata),
    .din(data_sram_wdata)
);

endmodule
