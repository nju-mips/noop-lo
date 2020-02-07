`include "common.vh"
`include "config.vh"

/* instr fetch protocol converter */
module lspcu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_slave_if(LSU_LSPCU_rdata),
	`msg_master_if(LSPCU_LSU_rdata),
	`msg_slave_if(LSU_LSPCU_wdata),
	`msg_master_if(LSPCU_LSU_wdata),
`ifndef SRAMLIKE_IF
	`axilite_master_if(m_axi_data)
`else
	output [31:0] mem_addr,
	output [3:0] mem_ben,
	output mem_wr,
	input mem_addr_ok,
	input mem_data_ok,
	input [31:0] mem_dout,
	output [31:0] mem_din		
`endif
);

	`msglen_wire(LSU_LSPCU_rdata, rdata_addr, rdata_addr);
	`msglen_wire(LSU_LSPCU_wdata, wdata_addr, wdata_addr);
	`msglen_wire(LSU_LSPCU_wdata, wdata_byte_en, wdata_byte_en);
	`msglen_wire(LSU_LSPCU_wdata, wdata, wdata);

	`msg_get(LSU_LSPCU_rdata, rdata_addr, rdata_addr);
	`msg_get(LSU_LSPCU_wdata, wdata_addr, wdata_addr);
	`msg_get(LSU_LSPCU_wdata, wdata_byte_en, wdata_byte_en);
	`msg_get(LSU_LSPCU_wdata, wdata, wdata);

	`msglen_wire(LSPCU_LSU_rdata, rdata, rdata);
	`msg_put(LSPCU_LSU_rdata, rdata, rdata);

	wire wdata_stall;
	wire rdata_stall;

	//protocol converter
`ifndef SRAMLIKE_IF
	naive_axilite_bridge naive_to_axilite_data (
		.axi_clk(clk),
		.axi_aresetn(~rst),

		.wdata_en(S_LSU_LSPCU_wdata_tvalid),
		.wdata_addr(wdata_addr),
		.wdata_byte_en(wdata_byte_en),
		.wdata(wdata),
		.wdata_stall(wdata_stall),

		.rdata_en(S_LSU_LSPCU_rdata_tvalid),
		.rdata_addr(rdata_addr),
		.rdata(rdata),
		.rdata_stall(rdata_stall),

		`axilite_connect_if(axi, m_axi_data)
	);
`else
	naive_to_sramlike naive_to_sramlike_data(
		.clk(clk),
		.reset(rst),
    
		.wdata_en(S_LSU_LSPCU_wdata_tvalid),
		.wdata_addr(wdata_addr),
		.wdata_byte_en(wdata_byte_en),
		.wdata(wdata),
		.wdata_stall(wdata_stall),
        
		.rdata_en(S_LSU_LSPCU_rdata_tvalid),
		.rdata_addr(rdata_addr),
		.rdata(rdata),
		.rdata_stall(rdata_stall),

		.addr(mem_addr),
		.ben(mem_ben),
		.wr(mem_wr),
		.addr_ok(mem_addr_ok),
		.data_ok(mem_data_ok),
		.dout(mem_dout),
		.din(mem_din)
	);
`endif		

	assign M_LSPCU_LSU_rdata_tvalid = !rdata_stall & S_LSU_LSPCU_rdata_tvalid;
	assign M_LSPCU_LSU_wdata_tvalid = !wdata_stall & S_LSU_LSPCU_wdata_tvalid;

endmodule
