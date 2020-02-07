import "DPI-C" function void device_tick
(
  input  bit  in_req_valid,
  input  int  in_req_bits_addr,
  input  int  in_req_bits_data,
  input  byte in_req_bits_fcn,
  input  byte in_req_bits_wstrb,
  output int  in_resp_bits_data
);

module Device(
  input         clk,
  input         reset,
  output        in_req_ready,
  input         in_req_valid,
  input  [31:0] in_req_bits_addr,
  input  [31:0] in_req_bits_data,
  input  [1:0]  in_req_bits_len,
  input  [0:0]  in_req_bits_fcn,
  input  [3:0]  in_req_bits_wstrb,
  input  [0:0]  in_req_bits_is_cached,
  input         in_req_bits_s1_kill,
  input         in_resp_ready,
  output        in_resp_valid,
  output [31:0] in_resp_bits_data
);

// delayed inputs
wire #0.1 __in_req_valid = in_req_valid;
wire [31:0] #0.1 __in_req_bits_addr = in_req_bits_addr;
wire [31:0] #0.1 __in_req_bits_data = in_req_bits_data;
wire [7:0] #0.1 __in_req_bits_fcn = {7'b0, in_req_bits_fcn};
wire [7:0] #0.1 __in_req_bits_wstrb = {4'b0, in_req_bits_wstrb};
wire #0.1 __in_req_bits_s1_kill = in_req_bits_s1_kill;

int __in_resp_bits_data;
assign #0.1 in_resp_bits_data = resp_data;

// latched input
reg s0_req_valid;
reg [31:0] s0_req_addr;
reg [31:0] s0_req_data;
reg [7:0]  s0_req_fcn;
reg [7:0]  s0_req_wstrb;
reg s0_req_s1_kill;

reg s1_req_valid;
reg [31:0] s1_req_addr;
reg [31:0] s1_req_data;
reg [7:0]  s1_req_fcn;
reg [7:0]  s1_req_wstrb;

// latched output
reg resp_valid;
reg [31:0] resp_data;

// make it blocking
assign in_req_ready = !s0_req_valid && !s1_req_valid;
// resp will be valid next cycle
assign in_resp_valid = resp_valid;

always @(posedge clk)
begin
  if (!reset) begin
    // only support write, no read
    device_tick(
      s1_req_valid,
      s1_req_addr,
      s1_req_data,
      s1_req_fcn,
      s1_req_wstrb,
      __in_resp_bits_data
    );
    resp_valid <= s1_req_valid;
    resp_data <= __in_resp_bits_data;

    s0_req_valid <= __in_req_valid && in_req_ready;
    s0_req_addr <= __in_req_bits_addr;
    s0_req_data <= __in_req_bits_data;
    s0_req_fcn <= __in_req_bits_fcn;
    s0_req_wstrb <= __in_req_bits_wstrb;
    s0_req_s1_kill <= __in_req_bits_s1_kill;

    if (!__in_req_bits_s1_kill) begin
      s1_req_valid <= s0_req_valid;
      s1_req_addr <= s0_req_addr;
      s1_req_data <= s0_req_data;
      s1_req_fcn <= s0_req_fcn;
      s1_req_wstrb <= s0_req_wstrb;
    end
    else begin
      s1_req_valid <= 1'b0;
    end
  end
  else begin
    resp_valid <= 1'b0;
    s0_req_valid <= 1'b0;
    s0_req_s1_kill <= 1'b0;
    s1_req_valid <= 1'b0;
  end
end
endmodule
