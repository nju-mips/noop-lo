`include "axi.vh"

module fpga_top (
  inout [14:0] DDR_addr,
  inout [2:0] DDR_ba,
  inout DDR_cas_n,
  inout DDR_ck_n,
  inout DDR_ck_p,
  inout DDR_cke,
  inout DDR_cs_n,
  inout [3:0] DDR_dm,
  inout [31:0] DDR_dq,
  inout [3:0] DDR_dqs_n,
  inout [3:0] DDR_dqs_p,
  inout DDR_odt,
  inout DDR_ras_n,
  inout DDR_reset_n,
  inout DDR_we_n,
  inout FIXED_IO_ddr_vrn,
  inout FIXED_IO_ddr_vrp,
  inout [53:0] FIXED_IO_mio,
  inout FIXED_IO_ps_clk,
  inout FIXED_IO_ps_porb,
  inout FIXED_IO_ps_srstb,

  output [3:0] VGA_red,
  output [3:0] VGA_green,
  output [3:0] VGA_blue,
  output VGA_hsync,
  output VGA_vsync,

  output [7:0] GPIO_trap
);

  `axi_wire(AXI_MEM, 32, 3);
  `axilite_wire(AXI_ZYNQ);

  wire coreclk;
  wire uncoreclk;
  wire vgaclk;
  wire uncore_aresetn;
  wire noop_aresetn;
  wire UART_0_rxd;
  wire UART_0_txd;
  wire dcm_locked;

  zynq_soc zynq_soc_i (
    .DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),

	`axi_connect_if(S_AXI_MEM, AXI_MEM),
	`axilite_connect_if(M_AXI_ZYNQ, AXI_ZYNQ),

	.UART_0_txd(UART_0_txd),
	.UART_0_rxd(UART_0_rxd),

    .coreclk(coreclk),
    .uncoreclk(uncoreclk),
    .vgaclk(vgaclk),
    .uncore_aresetn(uncore_aresetn),
    .noop_aresetn(noop_aresetn),
    .dcm_locked(dcm_locked)
  );

  noop_soc noop_soc_i (
	`axilite_connect_if(M_AXI_ZYNQ, AXI_ZYNQ),
	`axi_connect_if(S_AXI_MEM, AXI_MEM),

	.coreclk(coreclk),
	.uncoreclk(uncoreclk),
	.vgaclk(vgaclk),
	.uncore_aresetn(uncore_aresetn),
	.noop_aresetn(noop_aresetn),

	.GPIO_trap(GPIO_trap),

	.VGA_blue(VGA_blue),
	.VGA_red(VGA_red),
	.VGA_green(VGA_green),
	.VGA_hsync(VGA_hsync),
	.VGA_vsync(VGA_vsync),

	.UART_rxd(UART_0_txd),
	.UART_txd(UART_0_rxd),
	.dcm_locked(dcm_locked)
  );

endmodule
