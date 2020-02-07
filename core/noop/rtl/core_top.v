`include "axi.vh"

module _core_top (
  input clk,
  input reset,
  input [7:0] interrupt,

`ifndef SRAMLIKE_IF
  `axilite_master_if(M_AXI_DEVICE),
  `axi_master_if(M_AXI_MEM, 64, 1)
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

  noop noop_i (
    .clk(clk),
    .reset(reset),
    .interrupt(interrupt),
`ifndef SRAMLIKE_IF
    `axilite_connect_if(M_AXI_DEVICE, M_AXI_DEVICE),
    `axi_connect_if(M_AXI_MEM, M_AXI_MEM)
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
