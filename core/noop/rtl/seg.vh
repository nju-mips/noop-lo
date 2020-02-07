`ifndef __SEG_VH__
`define __SEG_VH__

`define KUSEG_BASE  (32'h0000_0000)
`define KUSEG_RANGE (1 << 31)

`define KSEG0_BASE  (32'h8000_0000)
`define KSEG0_RANGE (1 << 29)

`define KSEG1_BASE  (32'ha000_0000)
`define KSEG1_RANGE (1 << 29)

`define KSEG2_BASE  (32'hc000_0000)
`define KSEG2_RANGE (1 << 29)

`define KSEG3_BASE  (32'he000_0000)
`define KSEG3_RANGE (1 << 29)


`endif /* __SEG_VH__ */

