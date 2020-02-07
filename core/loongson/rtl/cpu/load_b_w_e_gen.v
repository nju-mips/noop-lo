`include "CPU_endianess.vh"

module load_b_w_e_gen (
	input [1 : 0]	addr,
	input [2 : 0]	load_sel,
	output reg [3 : 0]	b_w_en
);

	wire [1 : 0]	byte_sel;

	assign byte_sel = addr ^ { 2 {`BigEndianCPU} };
	
	always @ (*) begin
		case (load_sel)
			// LWL
			5 : begin
				case (byte_sel)
					0 : b_w_en = 4'b1000;
					1 : b_w_en = 4'b1100;
					2 : b_w_en = 4'b1110;
					3 : b_w_en = 4'b1111;
					default : b_w_en = 4'b1111;
				endcase
			end

			// LWR
			6 : begin
				case (byte_sel)
					0 : b_w_en = 4'b1111;
					1 : b_w_en = 4'b0111;
					2 : b_w_en = 4'b0011;
					3 : b_w_en = 4'b0001;
					default : b_w_en = 4'b1111;
				endcase
			end

			default : b_w_en = 4'b1111;
		endcase
	end
	
endmodule
