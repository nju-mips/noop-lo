`timescale 1ns / 1ns

`include "axi.vh"

module test_top (
);
	reg clk;
    reg resetn;

	initial begin
		clk = 1'b0;
		resetn = 1'b0;
		# 200
		resetn = 1'b1;

		# 500000000000
		$finish;
	end

	always begin
		clk = 1'b1; 
        #(5) clk = 1'b0; 
        #(5); 
	end

	wire [7:0] trap_info;
	`axilite_wire(M_AXI_ZYNQ);
	`axi_wire(AXI_MEM, 64, 3);
	wire UART_txd;
	wire UART_data_valid;
	wire [7:0] UART_data;

	assign M_AXI_ZYNQ_arvalid = 1'b0;
	assign M_AXI_ZYNQ_awvalid = 1'b0;
	assign M_AXI_ZYNQ_wvalid = 1'b0;
	assign M_AXI_ZYNQ_rready = 1'b0;
	assign M_AXI_ZYNQ_bready = 1'b0;

	noop_soc noop_soc_i(
		.clk(clk),
		.uncore_aresetn(resetn),
		.noop_aresetn(resetn),
		`axilite_connect_if(M_AXI_ZYNQ, M_AXI_ZYNQ),
		`axi_connect_if(S_AXI_MEM, AXI_MEM),
		.UART_txd(UART_txd),
		.GPIO_trap(trap_info)
	);

    SimAXIMem ram(
      .clock(clk),
      .reset(~resetn),
      `axilite_connect_if(io_axi4_0, AXI_MEM),
      `axi_connect_field(io_axi4_0, AXI_MEM, awlen),
      `axi_connect_field(io_axi4_0, AXI_MEM, awsize),
      `axi_connect_field(io_axi4_0, AXI_MEM, awburst),
      `axi_connect_field(io_axi4_0, AXI_MEM, awlock),
      `axi_connect_field(io_axi4_0, AXI_MEM, awcache),
      `axi_connect_field(io_axi4_0, AXI_MEM, awqos),
      `axi_connect_field(io_axi4_0, AXI_MEM, awregion),
      `axi_connect_field(io_axi4_0, AXI_MEM, wlast),
      `axi_connect_field(io_axi4_0, AXI_MEM, arlen),
      `axi_connect_field(io_axi4_0, AXI_MEM, arsize),
      `axi_connect_field(io_axi4_0, AXI_MEM, arburst),
      `axi_connect_field(io_axi4_0, AXI_MEM, arlock),
      `axi_connect_field(io_axi4_0, AXI_MEM, arcache),
      `axi_connect_field(io_axi4_0, AXI_MEM, arqos),
      `axi_connect_field(io_axi4_0, AXI_MEM, arregion),
      `axi_connect_field(io_axi4_0, AXI_MEM, rlast),
      .io_axi4_0_awid({1'b0, AXI_MEM_awid}),
      .io_axi4_0_bid(AXI_MEM_bid),
      .io_axi4_0_arid({1'b0, AXI_MEM_arid}),
      .io_axi4_0_rid(AXI_MEM_rid)
      );
	
	always @(*) begin
	   if(trap_info == 8'h00) begin
	       $display("HIT GOOD TRAP.");
	       $finish;
	   end
	   else if(trap_info == 8'h01) begin
	       $display("HIT BAD TRAP.");
	       $finish;
	   end
	end

	UARTRx UARTRx_i(
		.clock(clk),
		.reset(~resetn),
		.io_en(1'b1),
		.io_in(UART_txd),
		.io_out_valid(UART_data_valid),
		.io_out_bits(UART_data),
		.io_div(16'd434)	// (50 MHz / 115200)
	);

	always@(posedge UART_data_valid) begin
		$write("%c", UART_data);
	end

endmodule
