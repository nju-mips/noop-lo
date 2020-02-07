
`define FU_NUM 5
`define FUBIT 3
`define none_fu 0
`define alu 1
`define bru 2
`define lsu 3
`define mdu 4

`define REGSUM 32+32+3
`define REGBIT 7
// gpr [7'b0000000 - 7'b0011111]
// cp0 [7'b0100000 - 7'b0111111]
// hi  [7'b1000000]
// lo  [7'b1000001]
`define GPRRegs(gpr) gpr
`define CP0Regs(cp0) cp0 | 7'b0100000
`define HIRegs 7'b1000000
`define LORegs 7'b1000001
`define HILORegs 7'b1000010

`define WINDOWS_SIZE 1
`define has_RAW(pre, cur) (pre[`dst] == cur[`src1]) || pre[`dst] == cur[`src2])
`define has_RAW_src1(pre, cur) (pre[`dst] == cur[`src1])
`define has_RAW_src2(pre, cur) (pre[`dst] == cur[`src2])
`define has_WAW(pre, cur) (pre[`dst] == cur[`dst])
`define has_WAR(pre, cur) (cur[`dst] == pre[`src1] || cur[`dst] == pre[`src2])

`define dst_is_not_gpr_zero(cur) (cur[`dst] != 0)

// `define inst_status_len `ADDR_WIDTH*3 + $clog2(`FU_NUM)*3 + 2 + $clog2(`REGSET_NUM)*3
// | dst | src1 | src1_fu | src1_ready | src2 | src2_fu | src2_ready  | issue_fu |
//   7      7       3          1           7       3          1             3
`define inst_status_len  32
`define dst 		6:0
`define src1 		13:7
`define src1_fu 	16:14
`define src1_ready 	17
`define src2 		24:18
`define src2_fu 	27:25
`define src2_ready 	28
`define issue_fu 	31:29

// `define dst 		`ADDR_WIDTH-1:0
// `define src1 		`ADDR_WIDTH*2-1:`ADDR_WIDTH
// `define src1_fu 	`ADDR_WIDTH*2+$clog2(`FU_NUM) - 1:`ADDR_WIDTH*2
// `define src1_ready 	`ADDR_WIDTH*2+$clog2(`FU_NUM)
// `define src2 		`ADDR_WIDTH*3+$clog2(`FU_NUM):`ADDR_WIDTH*2+$clog2(`FU_NUM) + 1
// `define src2_fu 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*2:`ADDR_WIDTH*3+$clog2(`FU_NUM) + 1
// `define src2_ready 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 1
// `define dst_set 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 1 + $clog2(`REGSET_NUM):`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 2
// `define src1_set 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 1 + $clog2(`REGSET_NUM)*2:`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 2 + $clog2(`REGSET_NUM)
// `define src2_set 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 1 + $clog2(`REGSET_NUM)*3:`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 2 + $clog2(`REGSET_NUM)*2
// `define issue_fu 	`ADDR_WIDTH*3+$clog2(`FU_NUM)*3 + 1 + $clog2(`REGSET_NUM)*3:`ADDR_WIDTH*3+$clog2(`FU_NUM)*2 + 2 + $clog2(`REGSET_NUM)*3


`define get_forward_data(wdata, src, byte_wen) \
	{{byte_wen[3] ? wdata[31:24]: src[31:24]}, \
	 {byte_wen[2] ? wdata[23:16]: src[23:16]}, \
	 {byte_wen[1] ? wdata[15:8]: src[15:8]}, \
	 {byte_wen[0] ? wdata[7:0]: src[7:0]}}

