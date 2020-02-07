`include "CPU_endianess.vh"

module load_shifter (
	input [1 : 0]	addr,
	input [2 : 0]	load_sel,
	input [31 : 0]	mem_data,
	output reg [31 : 0]		data_to_reg
);

	reg [4 : 0]		shamt;
	wire [1 : 0]	byte_sel; 

	assign byte_sel = addr ^ { 2 {`BigEndianCPU} };

	always@(*) begin
		case(load_sel)
			// LB
			0 : begin
			    case (byte_sel)
			        0 : data_to_reg = { { 24 {mem_data[7]} } , mem_data[7:0] };
			        1 : data_to_reg = { { 24 {mem_data[15]} } , mem_data[15:8] };
			        2 : data_to_reg = { { 24 {mem_data[23]} } , mem_data[23:16] };
			        3 : data_to_reg = { { 24 {mem_data[31]} } , mem_data[31:24] }; 
				endcase
			end

			// LBU
			1 : begin
			    case (byte_sel)
                    0 : data_to_reg = { 24 'b0 , mem_data[7:0] };
                    1 : data_to_reg = { 24 'b0 , mem_data[15:8] };
                    2 : data_to_reg = { 24 'b0 , mem_data[23:16] };
                    3 : data_to_reg = { 24 'b0 , mem_data[31:24] }; 
            endcase
			end

			// LH, assume that arr[0] == 0 for address alignment
			2 : begin
			    case (byte_sel[1])
			        0 : data_to_reg = { { 16 {mem_data[15]} } , mem_data[15:0] };
			        1 : data_to_reg = { { 16 {mem_data[31]} } , mem_data[31:16] };
			    endcase
			end

			// LHU, assume that arr[0] == 0 for address alignment
			3 : begin
			    case (byte_sel[1])
                    0 : data_to_reg = { 16'b0 , mem_data[15:0] };
                    1 : data_to_reg = { 16'b0 , mem_data[31:16] };
                endcase
			end

			// LW
			4 : data_to_reg = mem_data;

			// LWL
			5 : begin
				shamt = (~byte_sel) << 3;
				data_to_reg = mem_data << shamt;
			end

			// LWR
			6 : begin
				shamt = byte_sel << 3;
				data_to_reg = mem_data >> shamt;
			end

			default : data_to_reg = mem_data;
		endcase
	end

endmodule
