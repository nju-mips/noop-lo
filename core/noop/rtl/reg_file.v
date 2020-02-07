`include "common.vh"

module reg_file(
	input clk,
	input rst,
	input [`ADDR_WIDTH - 1:0] waddr,
	input [`ADDR_WIDTH - 1:0] raddr1,
	input [`ADDR_WIDTH - 1:0] raddr2,
	input [`DATA_WIDTH / 8 - 1:0] byte_wen,
	input [`DATA_WIDTH - 1:0] wdata,
	output reg[`DATA_WIDTH - 1:0] rdata1,
	output reg[`DATA_WIDTH - 1:0] rdata2
);

	reg [`DATA_WIDTH - 1:0] rf [2 ** `ADDR_WIDTH - 1:0];

	always@(posedge clk) begin
		if(waddr != {`ADDR_WIDTH{1'b0}}) begin
			if(byte_wen[0] == 1) rf[waddr][7:0]		<= wdata[7:0];
			if(byte_wen[1] == 1) rf[waddr][15:8]	<= wdata[15:8];
			if(byte_wen[2] == 1) rf[waddr][23:16]	<= wdata[23:16];
			if(byte_wen[3] == 1) rf[waddr][31:24]	<= wdata[31:24];
		end
	end

	always@(*) begin
		if(raddr1 == `CONST_ADDR_H(0))
			rdata1 = `CONST_DATA_H(0);
		else if(waddr == raddr1) begin
			rdata1[7:0]   = byte_wen[0] ? wdata[7:0] : rf[raddr1][7:0];
			rdata1[15:8]  = byte_wen[1] ? wdata[15:8] : rf[raddr1][15:8];
			rdata1[23:16] = byte_wen[2] ? wdata[23:16] : rf[raddr1][23:16];
			rdata1[31:24] = byte_wen[3] ? wdata[31:24] : rf[raddr1][31:24];
		end
		else begin
			rdata1 = rf[raddr1];
		end

		
		if(raddr2 == `CONST_ADDR_H(0))
			rdata2 = `CONST_DATA_H(0);
		else if(waddr == raddr2) begin
			rdata2[7:0]   = byte_wen[0] ? wdata[7:0] : rf[raddr2][7:0];
			rdata2[15:8]  = byte_wen[1] ? wdata[15:8] : rf[raddr2][15:8];
			rdata2[23:16] = byte_wen[2] ? wdata[23:16] : rf[raddr2][23:16];
			rdata2[31:24] = byte_wen[3] ? wdata[31:24] : rf[raddr2][31:24];
		end
		else begin
			rdata2 = rf[raddr2];
		end
	end

endmodule
