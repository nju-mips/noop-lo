/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, Loongson Technology Corporation Limited.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this 
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of Loongson Technology Corporation Limited nor the names of 
its contributors may be used to endorse or promote products derived from this 
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL LOONGSON TECHNOLOGY CORPORATION LIMITED BE LIABLE
TO ANY PARTY FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/
//for func test, no define RUN_PERF_TEST
`define _RUN_PERF_TEST

module axi_wrap_ram(
  input         aclk,
  input         aresetn,
  //ar
  input  [3 :0] axi_arid   ,
  input  [31:0] axi_araddr ,
  input  [7 :0] axi_arlen  ,
  input  [2 :0] axi_arsize ,
  input  [1 :0] axi_arburst,
  input  [1 :0] axi_arlock ,
  input  [3 :0] axi_arcache,
  input  [2 :0] axi_arprot ,
  input         axi_arvalid,
  output        axi_arready,
  //r
  output [3 :0] axi_rid    ,
  output [31:0] axi_rdata  ,
  output [1 :0] axi_rresp  ,
  output        axi_rlast  ,
  output        axi_rvalid ,
  input         axi_rready ,
  //aw
  input  [3 :0] axi_awid   ,
  input  [31:0] axi_awaddr ,
  input  [7 :0] axi_awlen  ,
  input  [2 :0] axi_awsize ,
  input  [1 :0] axi_awburst,
  input  [1 :0] axi_awlock ,
  input  [3 :0] axi_awcache,
  input  [2 :0] axi_awprot ,
  input         axi_awvalid,
  output        axi_awready,
  //w
  input  [3 :0] axi_wid    ,
  input  [31:0] axi_wdata  ,
  input  [3 :0] axi_wstrb  ,
  input         axi_wlast  ,
  input         axi_wvalid ,
  output        axi_wready ,
  //b
  output [3 :0] axi_bid    ,
  output [1 :0] axi_bresp  ,
  output        axi_bvalid ,
  input         axi_bready ,

  //from confreg
  input  [4 :0] ram_random_mask
);
wire axi_arvalid_m_masked;
wire axi_rready_m_masked;
wire axi_awvalid_m_masked;
wire axi_wvalid_m_masked;
wire axi_bready_m_masked;

wire axi_arready_s_unmasked;
wire axi_rvalid_s_unmasked;
wire axi_awready_s_unmasked;
wire axi_wready_s_unmasked;
wire axi_bvalid_s_unmasked;

wire ar_and;
wire  r_and;
wire aw_and;
wire  w_and;
wire  b_and;
reg ar_nomask;
reg aw_nomask;
reg w_nomask;
reg [4:0] pf_r2r;
reg [1:0] pf_b2b;
wire pf_r2r_nomask= pf_r2r==5'd0;
wire pf_b2b_nomask= pf_b2b==2'd0;

//mask
`ifdef RUN_PERF_TEST
    assign ar_and = 1'b1;
    assign  r_and = pf_r2r_nomask;
    assign aw_and = 1'b1;
    assign  w_and = 1'b1;
    assign  b_and = pf_b2b_nomask;
`else
    assign ar_and = ram_random_mask[4] | ar_nomask;
    assign  r_and = ram_random_mask[3]            ;
    assign aw_and = ram_random_mask[2] | aw_nomask;
    assign  w_and = ram_random_mask[1] |  w_nomask;
    assign  b_and = ram_random_mask[0]            ;
`endif
always @(posedge aclk)
begin
    //for func test, random mask
    ar_nomask <= !aresetn             ? 1'b0 :
                 axi_arvalid_m_masked&&axi_arready ? 1'b0 :
                 axi_arvalid_m_masked ? 1'b1 : ar_nomask;

    aw_nomask <= !aresetn             ? 1'b0 :
                 axi_awvalid_m_masked&&axi_awready ? 1'b0 :
                 axi_awvalid_m_masked ? 1'b1 : aw_nomask;

    w_nomask  <= !aresetn             ? 1'b0 :
                 axi_wvalid_m_masked&&axi_wready ? 1'b0 :
                 axi_wvalid_m_masked  ? 1'b1 : w_nomask;
    //for perf test
    pf_r2r    <= !aresetn             ? 5'd0 : 
                 axi_arvalid_m_masked&&axi_arready ? 5'd25 :
                 !pf_r2r_nomask       ? pf_r2r-1'b1 : pf_r2r;
    pf_b2b    <= !aresetn             ? 2'd0 : 
                 axi_awvalid_m_masked&&axi_awready ? 2'd3 :
                 !pf_b2b_nomask       ? pf_b2b-1'b1 : pf_b2b;
end


//-----{master -> slave}-----
assign axi_arvalid_m_masked = axi_arvalid & ar_and;
assign axi_rready_m_masked  = axi_rready  &  r_and;
assign axi_awvalid_m_masked = axi_awvalid & aw_and;
assign axi_wvalid_m_masked  = axi_wvalid  &  w_and;
assign axi_bready_m_masked  = axi_bready  &  b_and;

//-----{slave -> master}-----
assign axi_arready = axi_arready_s_unmasked & ar_and;
assign axi_rvalid  = axi_rvalid_s_unmasked  &  r_and;
assign axi_awready = axi_awready_s_unmasked & aw_and;
assign axi_wready  = axi_wready_s_unmasked  &  w_and;
assign axi_bvalid  = axi_bvalid_s_unmasked  &  b_and;
     
// inst ram axi
axi_ram ram(
    .s_aclk         (aclk                    ),
    .s_aresetn      (aresetn                 ),

    //ar
    .s_axi_arid     (axi_arid                ),
    .s_axi_araddr   (axi_araddr              ),
    .s_axi_arlen    (axi_arlen               ),
    .s_axi_arsize   (axi_arsize              ),
    .s_axi_arburst  (axi_arburst             ),
    .s_axi_arvalid  (axi_arvalid_m_masked    ),
    .s_axi_arready  (axi_arready_s_unmasked  ),
    //r
    .s_axi_rid      (axi_rid                 ),
    .s_axi_rdata    (axi_rdata               ),
    .s_axi_rresp    (axi_rresp               ),
    .s_axi_rlast    (axi_rlast               ),
    .s_axi_rvalid   (axi_rvalid_s_unmasked   ),
    .s_axi_rready   (axi_rready_m_masked     ),
    //aw
    .s_axi_awid     (axi_awid                ),
    .s_axi_awaddr   (axi_awaddr              ),
    .s_axi_awlen    (axi_awlen               ),
    .s_axi_awsize   (axi_awsize              ),
    .s_axi_awburst  (axi_awburst             ),
    .s_axi_awvalid  (axi_awvalid_m_masked    ),
    .s_axi_awready  (axi_awready_s_unmasked  ),
    //w
    .s_axi_wdata    (axi_wdata               ),
    .s_axi_wstrb    (axi_wstrb               ),
    .s_axi_wlast    (axi_wlast               ),
    .s_axi_wvalid   (axi_wvalid_m_masked     ),
    .s_axi_wready   (axi_wready_s_unmasked   ),
    //b
    .s_axi_bid      (axi_bid                 ),
    .s_axi_bresp    (axi_bresp               ),
    .s_axi_bvalid   (axi_bvalid_s_unmasked   ),
    .s_axi_bready   (axi_bready_m_masked     )
);

endmodule
