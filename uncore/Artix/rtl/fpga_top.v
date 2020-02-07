/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, NJU DHR Limited.

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
`timescale 1ns / 1ps

`include "axilite.vh"
module fpga_top(
    input         resetn, 
    input         clk,

    //------gpio-------
    output [15:0] led,
    output [1 :0] led_rg0,
    output [1 :0] led_rg1,
    output [7 :0] num_csn,
    output [6 :0] num_a_g,
    input  [7 :0] switch, 
    output [3 :0] btn_key_col,
    input  [3 :0] btn_key_row,
    input  [1 :0] btn_step
);

//clk and resetn
wire hclk;
reg hresetn;

initial
    hresetn <= 0;

always @(posedge hclk)
begin
    hresetn <= resetn;
end
clk_pll clk_pll
(
    .clk_in1 (clk),
    .clk_out1(hclk)
);


//axi4 interface
wire [3 :0]  awid   =0; 
wire [31:0]  awaddr ; 
wire [7 :0]  awlen  = 8'd0; 
wire [2 :0]  awsize =3'b010; 
wire [1 :0]  awburst=2'd0; 
wire         awlock =1'd0; 
wire [3 :0]  awcache=4'd0; 
wire [2 :0]  awprot =3'd0; 
wire         awvalid;
wire         awready; 
wire [31:0]  wdata  ; 
wire [3 :0]  wstrb  ; 
wire         wlast  =1'd1; 
wire         wvalid ; 
wire         wready ; 
wire [3 :0]  bid    ; 
wire [1 :0]  bresp  ; 
wire         bvalid ; 
wire         bready ; 
wire [3 :0]  arid   =4'd0; 
wire [31:0]  araddr ; 
wire [7 :0]  arlen  =8'd0; 
wire [2 :0]  arsize =3'b010; 
wire [1 :0]  arburst=2'd0; 
wire         arlock =1'd0; 
wire [3 :0]  arcache=4'd0; 
wire [2 :0]  arprot =3'd0; 
wire         arvalid; 
wire         arready; 
wire [3 :0]  rid    ; 
wire [31:0]  rdata  ; 
wire [1 :0]  rresp  ; 
wire         rlast  ; 
wire         rvalid ; 
wire         rready ; 
wire [3:0] wid = 4'd0;

`make_axilite_wire(io_mi0_axi, 32, 4, 32);
`make_axilite_wire(io_mi1_axi, 32, 4, 32);
_core_top _core_top_i(
    .clk(hclk),
    .reset(~hresetn),
    .interrupt(8'd0),
    `make_axilite_connect(M_AXI_DATA, io_mi0_axi),
    `make_axilite_connect(M_AXI_INSTR, io_mi1_axi)
);

wire axi_reset = hresetn;

`make_axilite_wire(instr_axi, 32, 4, 32);
`make_axilite_wire(data_axi, 32, 4, 32);
axi_crossbar_0 crossbar0(
    .aclk(hclk),
    .aresetn(axi_reset),
    .s_axi_awprot(6'b000),
    .s_axi_arprot(6'b000),
    
	.s_axi_awaddr({io_mi1_axi_awaddr,io_mi0_axi_awaddr}),
	.s_axi_awvalid({io_mi1_axi_awvalid,io_mi0_axi_awvalid}),
	.s_axi_awready({io_mi1_axi_awready,io_mi0_axi_awready}),
	.s_axi_wdata({io_mi1_axi_wdata,io_mi0_axi_wdata}),
	.s_axi_wstrb({io_mi1_axi_wstrb,io_mi0_axi_wstrb}),
	.s_axi_wvalid({io_mi1_axi_wvalid,io_mi0_axi_wvalid}),
	.s_axi_wready({io_mi1_axi_wready,io_mi0_axi_wready}),
	.s_axi_bresp({io_mi1_axi_bresp,io_mi0_axi_bresp}),
	.s_axi_bvalid({io_mi1_axi_bvalid,io_mi0_axi_bvalid}),
	.s_axi_bready({io_mi1_axi_bready,io_mi0_axi_bready}),
	.s_axi_araddr({io_mi1_axi_araddr,io_mi0_axi_araddr}),
	.s_axi_arvalid({io_mi1_axi_arvalid,io_mi0_axi_arvalid}),
	.s_axi_arready({io_mi1_axi_arready,io_mi0_axi_arready}),
	.s_axi_rdata({io_mi1_axi_rdata,io_mi0_axi_rdata}),
	.s_axi_rresp({io_mi1_axi_rresp,io_mi0_axi_rresp}),
	.s_axi_rvalid({io_mi1_axi_rvalid,io_mi0_axi_rvalid}),
	.s_axi_rready({io_mi1_axi_rready,io_mi0_axi_rready}),

	.m_axi_awaddr({awaddr,data_axi_awaddr,instr_axi_awaddr}),
	.m_axi_awvalid({awvalid,data_axi_awvalid,instr_axi_awvalid}),
	.m_axi_awready({awready,data_axi_awready,instr_axi_awready}),
	.m_axi_wdata({wdata,data_axi_wdata,instr_axi_wdata}),
	.m_axi_wstrb({wstrb,data_axi_wstrb,instr_axi_wstrb}),
	.m_axi_wvalid({wvalid,data_axi_wvalid,instr_axi_wvalid}),
	.m_axi_wready({wready,data_axi_wready,instr_axi_wready}),
	.m_axi_bresp({bresp,data_axi_bresp,instr_axi_bresp}),
	.m_axi_bvalid({bvalid,data_axi_bvalid,instr_axi_bvalid}),
	.m_axi_bready({bready,data_axi_bready,instr_axi_bready}),
	.m_axi_araddr({araddr,data_axi_araddr,instr_axi_araddr}),
	.m_axi_arvalid({arvalid,data_axi_arvalid,instr_axi_arvalid}),
	.m_axi_arready({arready,data_axi_arready,instr_axi_arready}),
	.m_axi_rdata({rdata,data_axi_rdata,instr_axi_rdata}),
	.m_axi_rresp({rresp,data_axi_rresp,instr_axi_rresp}),
	.m_axi_rvalid({rvalid,data_axi_rvalid,instr_axi_rvalid}),
	.m_axi_rready({rready,data_axi_rready,instr_axi_rready}),
    .m_axi_awprot(),
    .m_axi_arprot()
);

//confreg
wire [31:0]    cr00;
wire [31:0]    cr01;
wire [31:0]    cr02;
wire [31:0]    cr03;
wire [31:0]    cr04;
wire [31:0]    cr05;
wire [31:0]    cr06;
wire [31:0]    cr07;

uncore uncore_i(
.aclk              (hclk        ),       
.aresetn           (hresetn     ),       
.s_awid            (awid        ),
.s_awaddr          ({4'd1,awaddr[27:0]}      ),
.s_awlen           (awlen       ),
.s_awsize          (awsize      ),
.s_awburst         (awburst     ),
.s_awlock          (awlock      ),
.s_awcache         (awcache     ),
.s_awprot          (awprot      ),
.s_awvalid         (awvalid     ),
.s_awready         (awready     ),
.s_wready          (wready      ),
.s_wid             (wid         ),
.s_wdata           (wdata       ),
.s_wstrb           (wstrb       ),
.s_wlast           (wlast       ),
.s_wvalid          (wvalid      ),
.s_bid             (bid         ),
.s_bresp           (bresp       ),
.s_bvalid          (bvalid      ),
.s_bready          (bready      ),
.s_arid            (arid        ),
.s_araddr          ({4'd1,araddr[27:0]}      ),
.s_arlen           (arlen       ),
.s_arsize          (arsize      ),
.s_arburst         (arburst     ),
.s_arlock          (arlock      ),
.s_arcache         (arcache     ),
.s_arprot          (arprot      ),
.s_arvalid         (arvalid     ),
.s_arready         (arready     ),
.s_rready          (rready      ),
.s_rid             (rid         ),
.s_rdata           (rdata       ),
.s_rresp           (rresp       ),
.s_rlast           (rlast       ),
.s_rvalid          (rvalid      ),

//dma,no care
.order_addr_reg    (            ),
.write_dma_end     (1'b0        ),
.finish_read_order (1'b0        ),

//cr00~cr07
.cr00              (cr00        ),
.cr01              (cr01        ),
.cr02              (cr02        ),
.cr03              (cr03        ),
.cr04              (cr04        ),
.cr05              (cr05        ),
.cr06              (cr06        ),
.cr07              (cr07        ),

.led               (led         ),
.led_rg0           (led_rg0     ),
.led_rg1           (led_rg1     ),
.num_csn           (num_csn     ),
.num_a_g           (num_a_g     ),
.switch            (switch      ),
.btn_key_col       (btn_key_col ),
.btn_key_row       (btn_key_row ),
.btn_step          (btn_step    )
);

//inst ram
inst_ram instr_mem(
    .s_aclk(hclk),
    .s_aresetn(axi_reset),
    
	.s_axi_awaddr({12'd0,instr_axi_awaddr[19:0]}),
	.s_axi_awvalid(instr_axi_awvalid),
	.s_axi_awready(instr_axi_awready),
	.s_axi_wdata(instr_axi_wdata),
	.s_axi_wstrb(instr_axi_wstrb),
	.s_axi_wvalid(instr_axi_wvalid),
	.s_axi_wready(instr_axi_wready),
	.s_axi_bresp(instr_axi_bresp),
	.s_axi_bvalid(instr_axi_bvalid),
	.s_axi_bready(instr_axi_bready),
	.s_axi_araddr({12'd0,instr_axi_araddr[19:0]}),
	.s_axi_arvalid(instr_axi_arvalid),
	.s_axi_arready(instr_axi_arready),
	.s_axi_rdata(instr_axi_rdata),
	.s_axi_rresp(instr_axi_rresp),
	.s_axi_rvalid(instr_axi_rvalid),
	.s_axi_rready(instr_axi_rready)

);

//data ram
data_ram data_mem(
    .s_aclk(hclk),
    .s_aresetn(axi_reset),
 
	.s_axi_awaddr({14'd0,data_axi_awaddr[17:0]}),
	.s_axi_awvalid(data_axi_awvalid),
	.s_axi_awready(data_axi_awready),
	.s_axi_wdata(data_axi_wdata),
	.s_axi_wstrb(data_axi_wstrb),
	.s_axi_wvalid(data_axi_wvalid),
	.s_axi_wready(data_axi_wready),
	.s_axi_bresp(data_axi_bresp),
	.s_axi_bvalid(data_axi_bvalid),
	.s_axi_bready(data_axi_bready),
	.s_axi_araddr({14'd0,data_axi_araddr[17:0]}),
	.s_axi_arvalid(data_axi_arvalid),
	.s_axi_arready(data_axi_arready),
	.s_axi_rdata(data_axi_rdata),
	.s_axi_rresp(data_axi_rresp),
	.s_axi_rvalid(data_axi_rvalid),
	.s_axi_rready(data_axi_rready)	

);

endmodule
