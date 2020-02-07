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

module soc_lite_top(
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
always @(posedge hclk)
begin
    hresetn <= resetn;
end
clk_pll clk_pll
(
    .clk_in1 (clk),
    .clk_out1(hclk)
);

//fetch like-sram interface
wire [ 3:0]  if_ben;
wire [31:0]  if_wdata;
wire         if_wr;
wire [31:0]  if_addr;
wire         if_addr_ok;
wire         if_data_ok;
wire [31:0]  if_rdata;

//mem like-sram interface
wire [ 3:0]  mem_ben;
wire [31:0]  mem_wdata;
wire         mem_wr;
wire [31:0]  mem_addr;
wire         mem_addr_ok;
wire         mem_data_ok;
wire [31:0]  mem_rdata;

//ahb-lite interface
wire  [1 :0] htrans;
wire  [2 :0] hsize;
wire  [31:0] haddr;
wire         hwrite;
wire  [31:0] hwdata;
wire  [2 :0] hburst;
wire         hmastlock;
wire  [3 :0] hprot;
 
wire  [31:0] hrdata;
wire         hreadyout;
wire         hresp;

//axi4 interface
wire [3 :0]  awid   ; 
wire [31:0]  awaddr ; 
wire [7 :0]  awlen  ; 
wire [2 :0]  awsize ; 
wire [1 :0]  awburst; 
wire         awlock ; 
wire [3 :0]  awcache; 
wire [2 :0]  awprot ; 
wire         awvalid; 
wire         awready; 
wire [31:0]  wdata  ; 
wire [3 :0]  wstrb  ; 
wire         wlast  ; 
wire         wvalid ; 
wire         wready ; 
wire [3 :0]  bid    ; 
wire [1 :0]  bresp  ; 
wire         bvalid ; 
wire         bready ; 
wire [3 :0]  arid   ; 
wire [31:0]  araddr ; 
wire [7 :0]  arlen  ; 
wire [2 :0]  arsize ; 
wire [1 :0]  arburst; 
wire         arlock ; 
wire [3 :0]  arcache; 
wire [2 :0]  arprot ; 
wire         arvalid; 
wire         arready; 
wire [3 :0]  rid    ; 
wire [31:0]  rdata  ; 
wire [1 :0]  rresp  ; 
wire         rlast  ; 
wire         rvalid ; 
wire         rready ; 
//axi3 wid
wire [3:0] wid;
reg  [3:0] wid_tmp;
assign wid = awvalid ? awid : wid_tmp;
always @(posedge hclk)
begin
    if(!hresetn)
    begin
        wid_tmp <= 4'd0;
    end
    else if (awvalid)
    begin
        wid_tmp <= awid;
    end
end

//inst sram
wire        inst_cen;
wire [3 :0] inst_wen;
wire [31:0] inst_addr;
wire [31:0] inst_din;
wire [31:0] inst_dout;
//data sram
wire        data_cen;
wire [3 :0] data_wen;
wire [31:0] data_addr;
wire [31:0] data_din;
wire [31:0] data_dout;

//cpu
wire [5:0] int_n_i = 6'b111111;
_core_top core_i(
    .clk(hclk),
    .reset(~hresetn),
    .interrupt(8'd0),
    
    .inst_sram_cen    (if_ben  ),
    .inst_sram_wr     (if_wr   ),
    .inst_sram_addr   (if_addr ),
    .inst_sram_wdata  (if_wdata),
    .inst_sram_ack    (if_addr_ok),
    .inst_sram_rrdy   (if_data_ok ),
    .inst_sram_rdata  (if_rdata),
    
    .data_sram_cen    (mem_ben  ),
    .data_sram_wr     (mem_wr   ),
    .data_sram_addr   (mem_addr ),
    .data_sram_wdata  (mem_wdata),
    .data_sram_ack    (mem_addr_ok),
    .data_sram_rrdy   (mem_data_ok),
    .data_sram_rdata  (mem_rdata)
);

//like-sram to ahb
sramlike_to_ahb sramlike_to_ahb(
    //fetch like-sram interface
    .if_ben     (if_ben    ),
    .if_wdata   (if_wdata  ),
    .if_wr      (if_wr     ),
    .if_addr    (if_addr   ),
    .if_addr_ok (if_addr_ok),
    .if_data_ok (if_data_ok),
    .if_rdata   (if_rdata  ),

    //mem like-sram interface
    .mem_ben    (mem_ben    ),
    .mem_wdata  (mem_wdata  ),
    .mem_wr     (mem_wr     ),
    .mem_addr   (mem_addr   ),
    .mem_addr_ok(mem_addr_ok),
    .mem_data_ok(mem_data_ok),
    .mem_rdata  (mem_rdata  ),

    //ahb-lite interface
    .hclk     (hclk     ),
    .hresetn  (hresetn  ),
                        
    .htrans   (htrans   ),
    .hsize    (hsize    ),
    .haddr    (haddr    ),
    .hwrite   (hwrite   ),
    .hwdata   (hwdata   ),
    .hburst   (hburst   ),
    .hmastlock(hmastlock),
    .hprot    (hprot    ),
                        
    .hrdata   (hrdata   ),
    .hreadyout(hreadyout),
    .hresp    (hresp    ),

    //inst sram
    .inst_cen (inst_cen ),
    .inst_wen (inst_wen ),
    .inst_addr(inst_addr),
    .inst_din (inst_din ),
    .inst_dout(inst_dout),
    //data sram
    .data_cen (data_cen ),
    .data_wen (data_wen ),
    .data_addr(data_addr),
    .data_din (data_din ),
    .data_dout(data_dout)

);

ahblite_axi_bridge_0 ahblite_to_axi 
(
    .s_ahb_hclk         (hclk       ),
    .s_ahb_hresetn      (hresetn    ),
    .s_ahb_haddr        (haddr      ),
    .s_ahb_hburst       (hburst     ),
    .s_ahb_hprot        (hprot      ),
    .s_ahb_hrdata       (hrdata     ),
    .s_ahb_hready_in    (hreadyout  ),
    .s_ahb_hready_out   (hreadyout  ),
    .s_ahb_hresp        (hresp      ),
    .s_ahb_hsize        (hsize      ),
    .s_ahb_htrans       (htrans     ),
    .s_ahb_hwdata       (hwdata     ),
    .s_ahb_hwrite       (hwrite     ),
    .s_ahb_hsel         (1'b1       ),

    .m_axi_awid         (awid       ),
    .m_axi_awaddr       (awaddr     ),
    .m_axi_awlen        (awlen      ),
    .m_axi_awsize       (awsize     ),
    .m_axi_awburst      (awburst    ),
    .m_axi_awlock       (awlock     ),
    .m_axi_awcache      (awcache    ),
    .m_axi_awprot       (awprot     ),
    .m_axi_awvalid      (awvalid    ),
    .m_axi_awready      (awready    ),
    .m_axi_wdata        (wdata      ),
    .m_axi_wstrb        (wstrb      ),
    .m_axi_wlast        (wlast      ),
    .m_axi_wvalid       (wvalid     ),
    .m_axi_wready       (wready     ),
    .m_axi_bid          (bid        ),
    .m_axi_bresp        (bresp      ),
    .m_axi_bvalid       (bvalid     ),
    .m_axi_bready       (bready     ),
    .m_axi_arid         (arid       ),
    .m_axi_araddr       (araddr     ),
    .m_axi_arlen        (arlen      ),
    .m_axi_arsize       (arsize     ),
    .m_axi_arburst      (arburst    ),
    .m_axi_arlock       (arlock     ),
    .m_axi_arcache      (arcache    ),
    .m_axi_arprot       (arprot     ),
    .m_axi_arvalid      (arvalid    ),
    .m_axi_arready      (arready    ),
    .m_axi_rid          (rid        ),
    .m_axi_rdata        (rdata      ),
    .m_axi_rresp        (rresp      ),
    .m_axi_rlast        (rlast      ),
    .m_axi_rvalid       (rvalid     ),
    .m_axi_rready       (rready     )
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

confreg confreg(
.aclk              (hclk        ),       
.aresetn           (hresetn     ),       
.s_awid            (awid        ),
.s_awaddr          (awaddr      ),
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
.s_araddr          (araddr      ),
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
inst_ram inst_ram
(
    .clka  (hclk           ),   
    .ena   (inst_cen       ),
    .wea   (inst_wen       ),   //3:0
    .addra (inst_addr[19:2]),   //17:0
    .dina  (inst_din       ),   //31:0
    .douta (inst_dout      )    //31:0
);

//data ram
data_ram data_ram
(
    .clka  (hclk           ),   
    .ena   (data_cen       ),
    .wea   (data_wen       ),   //3:0
    .addra (data_addr[17:2]),   //15:0
    .dina  (data_din       ),   //31:0
    .douta (data_dout      )    //31:0
);
endmodule

