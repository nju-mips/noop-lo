`include "CPU_endianess.vh"

module store_b_w_e_gen (
	input [1 : 0]	addr,
	input [2 : 0]	store_sel,
	output reg [3 : 0]		b_w_en
);
	
	wire [1 : 0] byte_sel;

	assign byte_sel = addr ^ { 2 {`BigEndianCPU} };

	always @ (*) begin
		case (store_sel)
			// SB
			3'b000 : begin
				case (byte_sel)
					0 : b_w_en = 4'b0001;
					1 : b_w_en = 4'b0010;
					2 : b_w_en = 4'b0100;
					3 : b_w_en = 4'b1000;
					default : b_w_en = 4'b1111;
				endcase
			end

			// SH, assume that addr[0] == 0 for address alignment
			3'b001 : begin
				case (byte_sel[1])
					0 : b_w_en = 4'b0011;
					1 : b_w_en = 4'b1100;
					default : b_w_en = 4'b1111;
				endcase
			end

			// SW
			3'b010 : b_w_en = 4'b1111;

			// SWL
			3'b011 : begin
				case (byte_sel)
					0 : b_w_en = 4'b0001;
					1 : b_w_en = 4'b0011;
					2 : b_w_en = 4'b0111;
					3 : b_w_en = 4'b1111;
					default : b_w_en = 4'b1111;
				endcase
			end

			// SWR
			3'b100 : begin
				case (byte_sel)
					0 : b_w_en = 4'b1111;
					1 : b_w_en = 4'b1110;
					2 : b_w_en = 4'b1100;
					3 : b_w_en = 4'b1000;
					default : b_w_en = 4'b1111;
				endcase
			end

			default : b_w_en = 4'b1111;
		endcase
	end
	
endmodule
