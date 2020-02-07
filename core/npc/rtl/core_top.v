`include "axi.vh"

module delay_reset #(
  parameter SCACHE_INIT = 3,
  parameter SCACHE_SIZE = 256 * 1024,
  parameter SCACHE_LINE_LENGTH = 16
) (
  input reset,
  input clock,
  output delayed
);
  integer CLOCKS = SCACHE_INIT + (2 * SCACHE_SIZE) / (4 * SCACHE_LINE_LENGTH) + 30;

  reg [31:0] counter;
  /* when in is high(valid) out is high, 
   * else delay it by n cycles
   * */
  assign delayed = reset ? reset : (counter <= CLOCKS);

  always@(posedge clock) begin
	if(reset) begin
	  counter <= 32'd0;
	end else if(counter <= CLOCKS) begin
	  counter <= counter + 32'd1;
	end
  end
endmodule

module _core_top (
  input coreclk,
  input uncoreclk,
  input reset,
  input uncore_aresetn,
  input [7:0] interrupt,
  input dcm_locked,

`ifndef SRAMLIKE_IF
  `axilite_master_if(M_AXI_DEVICE),
  `axi_master_if(M_AXI_MEM, 32, 3)
`else
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

`endif


);
  // system cache will sent wrong prot signal to memory
  // which causes an AXI DECERR
  // so we override these signals to defaults
  assign M_AXI_MEM_arregion = 32'b0;
  assign M_AXI_MEM_awregion = 32'b0;
  assign M_AXI_MEM_awprot = 32'b0;
  assign M_AXI_MEM_arprot = 32'b0;
  assign M_AXI_MEM_awlock = 32'b0;
  assign M_AXI_MEM_awcache = 32'b0;
  assign M_AXI_MEM_awqos = 32'b0;
  assign M_AXI_MEM_arlock = 32'b0;
  assign M_AXI_MEM_arcache = 32'b0;
  assign M_AXI_MEM_arqos = 32'b0;
  assign M_AXI_MEM_awid = 32'b0;
  assign M_AXI_MEM_arid = 32'b0;
  assign M_AXI_MEM_rid = 32'b0;
  assign M_AXI_MEM_bid = 32'b0;

  npc npc_i (
    .coreclk(coreclk),
    .uncoreclk(uncoreclk),
    .uncore_aresetn(uncore_aresetn),
    .reset(reset),
    .interrupt(interrupt),
    .dcm_locked(dcm_locked),
`ifndef SRAMLIKE_IF
    `axilite_connect_if(M_AXI_DEVICE, M_AXI_DEVICE),

    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awready),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awvalid),
    //`axi_connect_field(M_AXI_MEM, M_AXI_MEM, awid),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awaddr),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awlen),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awsize),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, awburst),

    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, wready),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, wvalid),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, wdata),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, wstrb),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, wlast),

    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, bready),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, bvalid),
    // `axi_connect_field(M_AXI_MEM, M_AXI_MEM, bid),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, bresp),

    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arready),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arvalid),
    // `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arid),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, araddr),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arlen),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arsize),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, arburst),

    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rready),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rvalid),
    // `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rid),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rresp),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rdata),
    `axi_connect_field(M_AXI_MEM, M_AXI_MEM, rlast)
`else
    .if_ben(inst_sram_cen),
    .if_din(inst_sram_wdata),
    .if_dout(inst_sram_rdata),
    .if_wr(inst_sram_wr),
    .if_addr(inst_sram_addr),
    .if_addr_ok(inst_sram_ack),
    .if_data_ok(inst_sram_rrdy),

    .mem_ben(data_sram_cen),
    .mem_din(data_sram_wdata),
    .mem_dout(data_sram_rdata),
    .mem_wr(data_sram_wr),
    .mem_addr(data_sram_addr),
    .mem_addr_ok(data_sram_ack),
    .mem_data_ok(data_sram_rrdy)
`endif
  );

endmodule
