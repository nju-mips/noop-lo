module Multiplier(
  input         clk,
  input  [32:0] data_a,
  input  [32:0] data_b,
  output [65:0] data_dout
);

wire signed [32:0] tmp_a;
wire signed [32:0] tmp_b;
wire signed [65:0] tmp_dout;

reg signed [65:0] s0_dout;
reg signed [65:0] s1_dout;
reg signed [65:0] s2_dout;
reg signed [65:0] s3_dout;
reg signed [65:0] s4_dout;
reg signed [65:0] s5_dout;
reg signed [65:0] s6_dout;

assign tmp_a = data_a;
assign tmp_b = data_b;
assign tmp_dout = tmp_a * tmp_b;

assign s0_dout = tmp_dout;
assign s1_dout = s0_dout;
assign s2_dout = s1_dout;
assign s3_dout = s2_dout;
assign s4_dout = s3_dout;
assign s5_dout = s4_dout;
assign s6_dout = s5_dout;
assign data_dout = s6_dout;

endmodule
