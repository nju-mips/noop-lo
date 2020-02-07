`include "CPU_endianess.vh"

module store_shifter (
	input [1 : 0]	addr,
	input [2 : 0]	store_sel,
	input [31 : 0]	rt_data,
	output reg [31 : 0]		real_rt_data
);

	wire [1 : 0]	byte_sel;

	assign byte_sel = addr ^ { 2 {`BigEndianCPU} };

	always @ (*) begin
		case (store_sel)
			// SB
			3'b000 : begin
				case (byte_sel)
					0 : real_rt_data = rt_data;
					1 : real_rt_data = rt_data << 8;
					2 : real_rt_data = rt_data << 16;
					3 : real_rt_data = rt_data << 24;
					default : real_rt_data = rt_data;
				endcase
			end

			// SH, assume that assr[0] == 0 for address alignment
			3'b001 : begin
				case (byte_sel[1])
					0 : real_rt_data = rt_data;
					1 : real_rt_data = rt_data << 16;
					default : real_rt_data = rt_data;
				endcase
			end

			// SW
			3'b010 : real_rt_data = rt_data;

			// SWL
			3'b011 : begin
				case (byte_sel)
					0 : real_rt_data = rt_data >> 24;
					1 : real_rt_data = rt_data >> 16;
					2 : real_rt_data = rt_data >> 8;
					3 : real_rt_data = rt_data;
					default : real_rt_data = rt_data;
				endcase
			end

			// SWR
			3'b100 : begin
				case (byte_sel)
					0 : real_rt_data = rt_data;
					1 : real_rt_data = rt_data << 8;
					2 : real_rt_data = rt_data << 16;
					3 : real_rt_data = rt_data << 24;
					default : real_rt_data = rt_data;
				endcase		
			end

			default : real_rt_data = rt_data;
		endcase
	end

endmodule
