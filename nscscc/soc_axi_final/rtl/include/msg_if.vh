// Message naming convension - [src]_[dest]_[label]

// Interface naming convension - (M|S)_[src]_[dest]_[label]
`define if_name(MS, msg) MS``_``msg

`define msg_master_if(msg) \
	`axis_master_if(`if_name(M, msg), msg``_msglen)
`define msg_slave_if(msg) \
	`axis_slave_if(`if_name(S, msg), msg``_msglen)

`define msg_wire(msg) `axis_wire(msg, msg``_msglen)
`define msg_connect_if(MS, msg) `axis_connect_if(`if_name(MS, msg), msg)

`define msg_put(msg, field, sig) \
	assign M_``msg``_tdata [ msg``_``field``_start +: msg``_``field``_len ] = sig
`define msg_get(msg, field, sig) \
	assign sig = S_``msg``_tdata [ msg``_``field``_start +: msg``_``field``_len ]

`define msg_putall(msg, sig) assign M_``msg``_tdata = sig
`define msg_getall(msg, sig) assign sig = S_``msg``_tdata

`define msglen_wire(msg, field, var) \
	wire [msg``_``field``_len - 1 : 0] var

`define msglen_reg(msg, field, var) \
	reg [msg``_``field``_len - 1 : 0] var

`define msg_get_reg(msg, field, val) \
    val = S_``msg``_tdata [ msg``_``field``_start +: msg``_``field``_len ]

`define pipeline_msg_get(msg, field, sig) \
	assign sig = P_``msg``_valid ? P_``msg``_data [ msg``_``field``_start +: msg``_``field``_len ] : 0

`define pipeline_msg_reg(msg) \
    reg [msg``_msglen - 1 : 0] P_``msg``_data; \
    reg P_``msg``_valid


`define pipeline_msg_get_if(flush) \
	if(flush == 1'b1) begin

`define pipeline_msg_get_flush(msg) \
	P_``msg``_data <= 0; \
	P_``msg``_valid <= 0;

`define pipeline_msg_else \
	end else begin

`define pipeline_msg_get_reg(msg) \
    P_``msg``_data <= S_``msg``_tdata; \
    P_``msg``_valid <= S_``msg``_tvalid;

`define pipeline_msg_get_end \
	end