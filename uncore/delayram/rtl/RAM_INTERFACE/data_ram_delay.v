`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/23 20:06:42
// Design Name: 
// Module Name: data_ram_delay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define DELAY 5


module data_ram_delay(
  input s_aclk,
  input s_aresetn,
  input [3:0]s_axi_awid,
  input [31:0]s_axi_awaddr,
  input [7:0]s_axi_awlen,
  input [2:0]s_axi_awsize,
  input [1:0]s_axi_awburst,
  input s_axi_awvalid,
  output s_axi_awready,
  input [31:0]s_axi_wdata,
  input [3:0]s_axi_wstrb,
  input s_axi_wlast,
  input s_axi_wvalid,
  output s_axi_wready,
  output [3:0]s_axi_bid,
  output [1:0]s_axi_bresp,
  output s_axi_bvalid,
  input s_axi_bready,
  input [3:0]s_axi_arid,
  input [31:0]s_axi_araddr,
  input [7:0]s_axi_arlen,
  input [2:0]s_axi_arsize,
  input [1:0]s_axi_arburst,
  input s_axi_arvalid,
  output s_axi_arready,
  output [3:0]s_axi_rid,
  output [31:0]s_axi_rdata,
  output [1:0]s_axi_rresp,
  output s_axi_rlast,
  output s_axi_rvalid,
  input s_axi_rready

    );
    wire mask;
    random_mask delay_mask(
        .clk   (s_aclk   ),
        .resetn(s_aresetn),
        .mask  (mask     )
     );

    wire s_axi_awvalid_m_masked;
    wire s_axi_wvalid_m_masked;
    wire s_axi_bready_m_masked;
    wire s_axi_arvalid_m_masked;
    wire s_axi_rready_m_masked;
    wire s_axi_awready_s_unmasked;
    wire s_axi_wready_s_unmasked;
    wire s_axi_bvalid_s_unmasked;
    wire s_axi_arready_s_unmasked;
    wire s_axi_rvalid_s_unmasked;

    assign s_axi_awvalid_m_masked = s_axi_awvalid & mask;
    assign s_axi_wvalid_m_masked  = s_axi_wvalid  & mask;
    assign s_axi_bready_m_masked  = s_axi_bready  & mask;
    assign s_axi_arvalid_m_masked = s_axi_arvalid & mask;
    assign s_axi_rready_m_masked  = s_axi_rready  & mask;
    assign s_axi_awready = s_axi_awready_s_unmasked & mask;
    assign s_axi_wready  = s_axi_wready_s_unmasked  & mask;
    assign s_axi_bvalid  = s_axi_bvalid_s_unmasked  & mask;
    assign s_axi_arready = s_axi_arready_s_unmasked & mask;
    assign s_axi_rvalid  = s_axi_rvalid_s_unmasked  & mask;



// data ram axi
data_ram data_ram(
    .s_aclk         (s_aclk                    ),
    .s_aresetn      (s_aresetn                 ),
    .s_axi_awid     (s_axi_awid                ),
    .s_axi_awaddr   (s_axi_awaddr              ),
                                   
    .s_axi_awlen    (s_axi_awlen               ),
    .s_axi_awsize   (s_axi_awsize              ),
    .s_axi_awburst  (s_axi_awburst             ),
    .s_axi_awvalid  (s_axi_awvalid_m_masked    ),
    .s_axi_awready  (s_axi_awready_s_unmasked  ),
    .s_axi_wdata    (s_axi_wdata               ),
                                 
    .s_axi_wstrb    (s_axi_wstrb               ),
    .s_axi_wlast    (s_axi_wlast               ),
    .s_axi_wvalid   (s_axi_wvalid_m_masked     ),
    .s_axi_wready   (s_axi_wready_s_unmasked   ),
    .s_axi_bid      (s_axi_bid                 ),
    .s_axi_bresp    (s_axi_bresp               ),
    .s_axi_bvalid   (s_axi_bvalid_s_unmasked   ),
                                   
    .s_axi_bready   (s_axi_bready_m_masked     ),
    .s_axi_arid     (s_axi_arid                ),
    .s_axi_araddr   (s_axi_araddr              ),
    .s_axi_arlen    (s_axi_arlen               ),
    .s_axi_arsize   (s_axi_arsize              ),
    .s_axi_arburst  (s_axi_arburst             ),
                                   
    .s_axi_arvalid  (s_axi_arvalid_m_masked    ),
    .s_axi_arready  (s_axi_arready_s_unmasked  ),
    .s_axi_rid      (s_axi_rid                 ),
    .s_axi_rdata    (s_axi_rdata               ),
    .s_axi_rresp    (s_axi_rresp               ),
    .s_axi_rlast    (s_axi_rlast               ),
    .s_axi_rvalid   (s_axi_rvalid_s_unmasked   ),
                                   
    .s_axi_rready   (s_axi_rready_m_masked     )
);

endmodule
