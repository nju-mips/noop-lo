`include "common.vh"
`include "config.vh"

/* instr fetch protocol converter */
module ifpcu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_slave_if(IFU_IFPCU_request),
	`msg_master_if(IFPCU_IFU_response),
`ifndef SRAMLIKE_IF
	`axilite_master_if(m_axi_instr)
`else
	output [31:0] if_addr,
	output [3:0] if_ben,
	output if_wr,
	input if_addr_ok,
	input if_data_ok,
	input [31:0] if_dout,
	output [31:0] if_din		
`endif
);
	//IFU -> IFPCU
	`msglen_wire(IFU_IFPCU_request, PC, PC);

	`msg_get(IFU_IFPCU_request, PC, PC);

	//IFPCU -> IFU
	`msglen_wire(IFPCU_IFU_response, instr, instr);

	`msg_put(IFPCU_IFU_response, instr, instr);

	wire instr_stall;

	//protocol converter
`ifndef SRAMLIKE_IF
	naive_axilite_bridge naive_to_axilite_instr(
		.axi_clk(clk),
		.axi_aresetn(~rst),

		.wdata_en(1'b0),
		.wdata_addr(32'b0),
		.wdata_byte_en(4'b0),
		.wdata(32'b0),
		.wdata_stall(),

		.rdata_en(S_IFU_IFPCU_request_tvalid),
		.rdata_addr(PC),
		.rdata(instr),
		.rdata_stall(instr_stall),

		`axilite_connect_if(axi, m_axi_instr)
	);
`else
	naive_to_sramlike naive_to_sramlike_instr(
		.clk(clk),
		.reset(rst),
    
		.wdata_en(1'b0),
		.wdata_addr(32'b0),
		.wdata_byte_en(4'b0),
		.wdata(32'b0),
		.wdata_stall(),

		.rdata_en(S_IFU_IFPCU_request_tvalid),
		.rdata_addr(PC),
		.rdata(instr),
		.rdata_stall(instr_stall),

		.addr(if_addr),
		.ben(if_ben),
		.wr(if_wr),
		.addr_ok(if_addr_ok),
		.data_ok(if_data_ok),
		.dout(if_dout),
		.din(if_din)
	);
`endif	

	assign M_IFPCU_IFU_response_tvalid = !instr_stall & S_IFU_IFPCU_request_tvalid;

	

endmodule
