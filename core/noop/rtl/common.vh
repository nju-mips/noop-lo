
`ifndef __COMMON_VH__
`define __COMMON_VH__

`include "axi.vh"
`include "axis.vh"
`include "msg_if.vh"
`include "config.vh"

`define DATA_WIDTH 32
`define ADDR_WIDTH 5
`define BYTE_WIDTH 8

`ifdef SRAMLIKE_IF
`define ENTRY (32'hbfc0_0000)
`else
`define ENTRY (32'h1000_0000)
`endif


`define CONST_VAL(len, scale, val) (len``'``scale``val)

`define CONST_VAL_B(len, val) `CONST_VAL(len, b, val)
`define CONST_VAL_D(len, val) `CONST_VAL(len, d, val)
`define CONST_VAL_H(len, val) `CONST_VAL(len, h, val)

`define CONST_DATA_B(val) `CONST_VAL_B(`DATA_WIDTH, val)
`define CONST_DATA_D(val) `CONST_VAL_D(`DATA_WIDTH, val)
`define CONST_DATA_H(val) `CONST_VAL_H(`DATA_WIDTH, val)

`define CONST_ADDR_B(val) `CONST_VAL_B(`ADDR_WIDTH, val)
`define CONST_ADDR_D(val) `CONST_VAL_D(`ADDR_WIDTH, val)
`define CONST_ADDR_H(val) `CONST_VAL_H(`ADDR_WIDTH, val)


`define DATA_VAR_REG(var) \
	reg [`DATA_WIDTH - 1 : 0] var
`define DATA_VAR_WIRE(var) \
	wire [`DATA_WIDTH - 1 : 0] var

`define ADDR_VAR_REG(var) \
	reg [`ADDR_WIDTH - 1 : 0] var
`define ADDR_VAR_WIRE(var) \
	wire [`ADDR_WIDTH - 1 : 0] var


`endif /* __COMMON_VH__ */
