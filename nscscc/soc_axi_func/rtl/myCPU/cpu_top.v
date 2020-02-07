`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2018 04:13:43 PM
// Design Name: 
// Module Name: cpu_top
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

module mycpu_top(
  input aresetn,
  input aclk,

  input [5:0]int,
  input nmi,

  output [31:0]araddr,
  output [1:0]arburst,
  output [3:0]arcache,
  output [3:0]arid,
  output [7:0]arlen,
  output arlock,
  output [2:0]arprot,
  output [3:0]arqos,
  input arready,
  output [3:0]arregion,
  output [2:0]arsize,
  output [4:0]aruser,
  output arvalid,
  output [31:0]awaddr,
  output [1:0]awburst,
  output [3:0]awcache,
  output [3:0]awid,
  output [7:0]awlen,
  output awlock,
  output [2:0]awprot,
  output [3:0]awqos,
  input awready,
  output [3:0]awregion,
  output [2:0]awsize,
  output [4:0]awuser,
  output awvalid,
  input [3:0]bid,
  output bready,
  input [1:0]bresp,
  input [4:0]buser,
  input bvalid,
  input [31:0]rdata,
  input [3:0]rid,
  input rlast,
  output rready,
  input [1:0]rresp,
  input [4:0]ruser,
  input rvalid,
  output [31:0]wdata,
  output [3:0]wid,
  output wlast,
  input wready,
  output [3:0]wstrb,
  output [4:0]wuser,
  output wvalid,

  output [31:0]debug_wb_pc,
  output [31:0]debug_wb_rf_wdata,
  output [3:0]debug_wb_rf_wen,
  output [4:0]debug_wb_rf_wnum
);

  wire debug_wb_rf_wen_bit;
  assign debug_wb_rf_wen = {4{debug_wb_rf_wen_bit}};

  cpu_design cpu_design_i (
	.aresetn(aresetn),
	.clk(aclk),
    .mem_araddr(araddr),
    .mem_arburst(arburst),
    .mem_arcache(arcache),
    .mem_arlen(arlen),
    .mem_arlock(arlock),
    .mem_arprot(arprot),
    .mem_arqos(arqos),
    .mem_arready(arready),
    .mem_arregion(arregion),
    .mem_arsize(arsize),
    .mem_aruser(aruser),
    .mem_arvalid(arvalid),
    .mem_awaddr(awaddr),
    .mem_awburst(awburst),
    .mem_awcache(awcache),
    .mem_awlen(awlen),
    .mem_awlock(awlock),
    .mem_awprot(awprot),
    .mem_awqos(awqos),
    .mem_awready(awready),
    .mem_awregion(awregion),
    .mem_awsize(awsize),
    .mem_awuser(awuser),
    .mem_awvalid(awvalid),
    .mem_bready(bready),
    .mem_bresp(bresp),
    .mem_buser(buser),
    .mem_bvalid(bvalid),
    .mem_rdata(rdata),
    .mem_rlast(rlast),
    .mem_rready(rready),
    .mem_rresp(rresp),
    .mem_ruser(ruser),
    .mem_rvalid(rvalid),
    .mem_wdata(wdata),
    .mem_wlast(wlast),
    .mem_wready(wready),
    .mem_wstrb(wstrb),
    .mem_wuser(wuser),
    .mem_wvalid(wvalid),
	.dcm_locked(1'd1),
	.debug_wb_pc(debug_wb_pc),
	.debug_wb_rf_wdata(debug_wb_rf_wdata),
	.debug_wb_rf_wen(debug_wb_rf_wen_bit),
	.debug_wb_rf_wnum(debug_wb_rf_wnum),
	.interrupt(int),
	.nmi(nmi)
  );
endmodule
