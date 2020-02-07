`define decouple_fire(prefix) (prefix``valid & prefix``ready)

`define axis_field(in_out, width, prefix, field) \
  in_out [width - 1: 0] prefix``_``field

`define axis_wire_field(width, prefix, field) \
  wire [width - 1: 0] prefix``_``field

`define axis_connect_field(io_prefix, wire_prefix, field) \
	.io_prefix``_``field(wire_prefix``_``field)

`define axis_if(dir1, dir2, prefix, data_len) \
	`axis_field(dir1, 1, prefix, tready), \
	`axis_field(dir2, 1, prefix, tvalid), \
	`axis_field(dir2, data_len, prefix, tdata)

`define axis_master_if(prefix, data_len) \
	`axis_if(input, output, prefix, data_len)

`define axis_slave_if(prefix, data_len) \
	`axis_if(output, input, prefix, data_len)

`define axis_wire(prefix, data_len) \
	`axis_wire_field(1, prefix, tready); \
	`axis_wire_field(1, prefix, tvalid); \
	`axis_wire_field(data_len, prefix, tdata)

`define axis_connect_if(io_prefix, wire_prefix) \
	`axis_connect_field(io_prefix, wire_prefix, tready), \
	`axis_connect_field(io_prefix, wire_prefix, tvalid), \
	`axis_connect_field(io_prefix, wire_prefix, tdata)
