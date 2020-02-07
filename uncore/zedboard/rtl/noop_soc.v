`include "axi.vh"

module noop_soc (
	input coreclk,
	input uncoreclk,
	input vgaclk,
	input uncore_aresetn,
	input noop_aresetn,
	input dcm_locked,
	output [7:0] GPIO_trap,

	`axi_master_if(S_AXI_MEM, 32, 3),
	`axilite_slave_if(M_AXI_ZYNQ),
	output [3:0] VGA_red,
	output [3:0] VGA_green,
	output [3:0] VGA_blue,
	output VGA_hsync,
	output VGA_vsync,

	input UART_rxd,
	output UART_txd
);

  wire bram_aresetn;
  wire noop_rst;
  wire timer_interrupt;
  
  wire[5:0] interrupt;
  assign interrupt = {timer_interrupt, 5'b0};

  `axilite_wire(AXI_DEVICE);

  _core_top _core_top_i (
    `axi_connect_if(M_AXI_MEM, S_AXI_MEM),
    `axilite_connect_if(M_AXI_DEVICE, AXI_DEVICE),
    .coreclk(coreclk),
    .uncoreclk(uncoreclk),
    .interrupt({interrupt, 2'b00}),
    .reset(~noop_aresetn),
    .uncore_aresetn(uncore_aresetn),
    .dcm_locked(dcm_locked)
  );

  uncore uncore_i (
	`axilite_connect_if(S_AXI_ZYNQ, M_AXI_ZYNQ),
	`axilite_connect_if(S_AXI_DEVICE, AXI_DEVICE),

	.uncoreclk(uncoreclk),
	.vgaclk(vgaclk),
	.uncore_aresetn(uncore_aresetn),

	.GPIO_trap(GPIO_trap),

	.VGA_blue(VGA_blue),
	.VGA_red(VGA_red),
	.VGA_green(VGA_green),
	.VGA_hsync(VGA_hsync),
	.VGA_vsync(VGA_vsync),

	.UART_rxd(UART_rxd),
	.UART_txd(UART_txd),
	
	
	.timer_interrupt(timer_interrupt)
  );

endmodule
