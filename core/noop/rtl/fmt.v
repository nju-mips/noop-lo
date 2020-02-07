`include "common.vh"
`include "seg.vh"

module fmt (
	input [31:0] vaddr,
	output reg [31:0] phaddr
);

	wire [4:0] seg_sel;
	assign seg_sel[0] = (vaddr >= `KUSEG_BASE && vaddr < `KUSEG_BASE + `KUSEG_RANGE);
	assign seg_sel[1] = (vaddr >= `KSEG0_BASE && vaddr < `KSEG0_BASE + `KSEG0_RANGE);
	assign seg_sel[2] = (vaddr >= `KSEG1_BASE && vaddr < `KSEG1_BASE + `KSEG1_RANGE);
	assign seg_sel[3] = (vaddr >= `KSEG2_BASE && vaddr < `KSEG2_BASE + `KSEG2_RANGE);
	assign seg_sel[4] = (vaddr >= `KSEG3_BASE && vaddr <= 32'hffff_ffff);
	
	always @(*) begin
		case(seg_sel) 
		5'b00001: phaddr = vaddr;
		5'b00010: phaddr = vaddr & (`KSEG1_RANGE - 1);
		5'b00100: phaddr = vaddr & (`KSEG2_RANGE - 1);
		5'b01000: phaddr = vaddr;
		5'b10000: phaddr = vaddr;
		default: phaddr = 32'hxxxx_xxxx;
		endcase
	end
	
endmodule
