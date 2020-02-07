module Divider(
  input         clk,
  input data_diviend_valid,
  input data_divisor_valid,
  output data_dout_valid,
  output data_diviend_ready,
  output data_divisor_ready,
  input  [39:0] data_diviend_bits,
  input  [39:0] data_divisor_bits,
  output [79:0] data_dout_bits
);

wire signed [39:0] tmp_diviend;
wire signed [39:0] tmp_divisor;
wire signed [79:0] tmp_dout;

reg signed [79:0] s0_dout;
reg signed [79:0] s1_dout;
reg signed [79:0] s2_dout;
reg signed [79:0] s3_dout;
reg signed [79:0] s4_dout;
reg signed [79:0] s5_dout;
reg signed [79:0] s6_dout;
reg signed [79:0] s7_dout;
reg signed [79:0] s8_dout;
reg signed [79:0] s9_dout;
reg signed [79:0] s10_dout;
reg signed [79:0] s11_dout;
reg signed [79:0] s12_dout;
reg signed [79:0] s13_dout;
reg signed [79:0] s14_dout;
reg signed [79:0] s15_dout;
reg signed [79:0] s16_dout;
reg signed [79:0] s17_dout;
reg signed [79:0] s18_dout;
reg signed [79:0] s19_dout;
reg signed [79:0] s20_dout;
reg signed [79:0] s21_dout;
reg signed [79:0] s22_dout;
reg signed [79:0] s23_dout;
reg signed [79:0] s24_dout;
reg signed [79:0] s25_dout;
reg signed [79:0] s26_dout;
reg signed [79:0] s27_dout;
reg signed [79:0] s28_dout;
reg signed [79:0] s29_dout;
reg signed [79:0] s30_dout;
reg signed [79:0] s31_dout;
reg signed [79:0] s32_dout;
reg signed [79:0] s33_dout;
reg signed [79:0] s34_dout;
reg signed [79:0] s35_dout;
reg signed [79:0] s36_dout;
reg signed [79:0] s37_dout;
reg signed [79:0] s38_dout;
reg signed [79:0] s39_dout;
reg signed [79:0] s40_dout;
reg signed [79:0] s41_dout;
reg signed [79:0] s42_dout;
reg signed [79:0] s43_dout;
reg signed [79:0] s44_dout;

reg s0_valid;
reg s1_valid;
reg s2_valid;
reg s3_valid;
reg s4_valid;
reg s5_valid;
reg s6_valid;
reg s7_valid;
reg s8_valid;
reg s9_valid;
reg s10_valid;
reg s11_valid;
reg s12_valid;
reg s13_valid;
reg s14_valid;
reg s15_valid;
reg s16_valid;
reg s17_valid;
reg s18_valid;
reg s19_valid;
reg s20_valid;
reg s21_valid;
reg s22_valid;
reg s23_valid;
reg s24_valid;
reg s25_valid;
reg s26_valid;
reg s27_valid;
reg s28_valid;
reg s29_valid;
reg s30_valid;
reg s31_valid;
reg s32_valid;
reg s33_valid;
reg s34_valid;
reg s35_valid;
reg s36_valid;
reg s37_valid;
reg s38_valid;
reg s39_valid;
reg s40_valid;
reg s41_valid;
reg s42_valid;
reg s43_valid;
reg s44_valid;

assign tmp_diviend = data_diviend_bits;
assign tmp_divisor = data_divisor_bits;
assign tmp_dout = {tmp_diviend / tmp_divisor, tmp_diviend % tmp_divisor};

assign data_dout_valid = s44_valid;
assign data_dout_bits = s44_dout;

assign data_diviend_ready = 1'b1;
assign data_divisor_ready = 1'b1;

always @(posedge clk)
begin
  s0_dout <= tmp_dout;
  s1_dout <= s0_dout;
  s2_dout <= s1_dout;
  s3_dout <= s2_dout;
  s4_dout <= s3_dout;
  s5_dout <= s4_dout;
  s6_dout <= s5_dout;
  s7_dout <= s6_dout;
  s8_dout <= s7_dout;
  s9_dout <= s8_dout;
  s10_dout <= s9_dout;
  s11_dout <= s10_dout;
  s12_dout <= s11_dout;
  s13_dout <= s12_dout;
  s14_dout <= s13_dout;
  s15_dout <= s14_dout;
  s16_dout <= s15_dout;
  s17_dout <= s16_dout;
  s18_dout <= s17_dout;
  s19_dout <= s18_dout;
  s20_dout <= s19_dout;
  s21_dout <= s20_dout;
  s22_dout <= s21_dout;
  s23_dout <= s22_dout;
  s24_dout <= s23_dout;
  s25_dout <= s24_dout;
  s26_dout <= s25_dout;
  s27_dout <= s26_dout;
  s28_dout <= s27_dout;
  s29_dout <= s28_dout;
  s30_dout <= s29_dout;
  s31_dout <= s30_dout;
  s32_dout <= s31_dout;
  s33_dout <= s32_dout;
  s34_dout <= s33_dout;
  s35_dout <= s34_dout;
  s36_dout <= s35_dout;
  s37_dout <= s36_dout;
  s38_dout <= s37_dout;
  s39_dout <= s38_dout;
  s40_dout <= s39_dout;
  s41_dout <= s40_dout;
  s42_dout <= s41_dout;
  s43_dout <= s42_dout;
  s44_dout <= s43_dout;

  s0_valid <= data_divisor_valid & data_diviend_valid;
  s1_valid <= s0_valid;
  s2_valid <= s1_valid;
  s3_valid <= s2_valid;
  s4_valid <= s3_valid;
  s5_valid <= s4_valid;
  s6_valid <= s5_valid;
  s7_valid <= s6_valid;
  s8_valid <= s7_valid;
  s9_valid <= s8_valid;
  s10_valid <= s9_valid;
  s11_valid <= s10_valid;
  s12_valid <= s11_valid;
  s13_valid <= s12_valid;
  s14_valid <= s13_valid;
  s15_valid <= s14_valid;
  s16_valid <= s15_valid;
  s17_valid <= s16_valid;
  s18_valid <= s17_valid;
  s19_valid <= s18_valid;
  s20_valid <= s19_valid;
  s21_valid <= s20_valid;
  s22_valid <= s21_valid;
  s23_valid <= s22_valid;
  s24_valid <= s23_valid;
  s25_valid <= s24_valid;
  s26_valid <= s25_valid;
  s27_valid <= s26_valid;
  s28_valid <= s27_valid;
  s29_valid <= s28_valid;
  s30_valid <= s29_valid;
  s31_valid <= s30_valid;
  s32_valid <= s31_valid;
  s33_valid <= s32_valid;
  s34_valid <= s33_valid;
  s35_valid <= s34_valid;
  s36_valid <= s35_valid;
  s37_valid <= s36_valid;
  s38_valid <= s37_valid;
  s39_valid <= s38_valid;
  s40_valid <= s39_valid;
  s41_valid <= s40_valid;
  s42_valid <= s41_valid;
  s43_valid <= s42_valid;
  s44_valid <= s43_valid;
end
endmodule
