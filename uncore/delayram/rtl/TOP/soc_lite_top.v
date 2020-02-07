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
wire [3 :0]  axi_awid   ; 
wire [31:0]  axi_awaddr ; 
wire [7 :0]  axi_awlen  ; 
wire [2 :0]  axi_awsize ; 
wire [1 :0]  axi_awburst; 
wire         axi_awlock ; 
wire [3 :0]  axi_awcache; 
wire [2 :0]  axi_awprot ; 
wire         axi_awvalid; 
wire         axi_awready; 
wire [31:0]  axi_wdata  ; 
wire [3 :0]  axi_wstrb  ; 
wire         axi_wlast  ; 
wire         axi_wvalid ; 
wire         axi_wready ; 
wire [3 :0]  axi_bid    ; 
wire [1 :0]  axi_bresp  ; 
wire         axi_bvalid ; 
wire         axi_bready ; 
wire [3 :0]  axi_arid   ; 
wire [31:0]  axi_araddr ; 
wire [7 :0]  axi_arlen  ; 
wire [2 :0]  axi_arsize ; 
wire [1 :0]  axi_arburst; 
wire         axi_arlock ; 
wire [3 :0]  axi_arcache; 
wire [2 :0]  axi_arprot ; 
wire         axi_arvalid; 
wire         axi_arready; 
wire [3 :0]  axi_rid    ; 
wire [31:0]  axi_rdata  ; 
wire [1 :0]  axi_rresp  ; 
wire         axi_rlast  ; 
wire         axi_rvalid ; 
wire         axi_rready ; 

//confreg axi4 interface
wire [3 :0]  conf_awid   ; 
wire [31:0]  conf_awaddr ; 
wire [7 :0]  conf_awlen  ; 
wire [2 :0]  conf_awsize ; 
wire [1 :0]  conf_awburst; 
wire         conf_awlock ; 
wire [3 :0]  conf_awcache; 
wire [2 :0]  conf_awprot ; 
wire         conf_awvalid; 
wire         conf_awready; 
wire [31:0]  conf_wdata  ; 
wire [3 :0]  conf_wstrb  ; 
wire         conf_wlast  ; 
wire         conf_wvalid ; 
wire         conf_wready ; 
wire [3 :0]  conf_bid    ; 
wire [1 :0]  conf_bresp  ; 
wire         conf_bvalid ; 
wire         conf_bready ; 
wire [3 :0]  conf_arid   ; 
wire [31:0]  conf_araddr ; 
wire [7 :0]  conf_arlen  ; 
wire [2 :0]  conf_arsize ; 
wire [1 :0]  conf_arburst; 
wire         conf_arlock ; 
wire [3 :0]  conf_arcache; 
wire [2 :0]  conf_arprot ; 
wire         conf_arvalid; 
wire         conf_arready; 
wire [3 :0]  conf_rid    ; 
wire [31:0]  conf_rdata  ; 
wire [1 :0]  conf_rresp  ; 
wire         conf_rlast  ; 
wire         conf_rvalid ; 
wire         conf_rready ; 

//inst ram axi4 interface
wire [3 :0]  iram_awid   ; 
wire [31:0]  iram_awaddr ; 
wire [7 :0]  iram_awlen  ; 
wire [2 :0]  iram_awsize ; 
wire [1 :0]  iram_awburst; 
wire         iram_awlock ; 
wire [3 :0]  iram_awcache; 
wire [2 :0]  iram_awprot ; 
wire         iram_awvalid; 
wire         iram_awready; 
wire [31:0]  iram_wdata  ; 
wire [3 :0]  iram_wstrb  ; 
wire         iram_wlast  ; 
wire         iram_wvalid ; 
wire         iram_wready ; 
wire [3 :0]  iram_bid    ; 
wire [1 :0]  iram_bresp  ; 
wire         iram_bvalid ; 
wire         iram_bready ; 
wire [3 :0]  iram_arid   ; 
wire [31:0]  iram_araddr ; 
wire [7 :0]  iram_arlen  ; 
wire [2 :0]  iram_arsize ; 
wire [1 :0]  iram_arburst; 
wire         iram_arlock ; 
wire [3 :0]  iram_arcache; 
wire [2 :0]  iram_arprot ; 
wire         iram_arvalid; 
wire         iram_arready; 
wire [3 :0]  iram_rid    ; 
wire [31:0]  iram_rdata  ; 
wire [1 :0]  iram_rresp  ; 
wire         iram_rlast  ; 
wire         iram_rvalid ; 
wire         iram_rready ; 

//data ram axi4 interface
wire [3 :0]  dram_awid   ; 
wire [31:0]  dram_awaddr ; 
wire [7 :0]  dram_awlen  ; 
wire [2 :0]  dram_awsize ; 
wire [1 :0]  dram_awburst; 
wire         dram_awlock ; 
wire [3 :0]  dram_awcache; 
wire [2 :0]  dram_awprot ; 
wire         dram_awvalid; 
wire         dram_awready; 
wire [31:0]  dram_wdata  ; 
wire [3 :0]  dram_wstrb  ; 
wire         dram_wlast  ; 
wire         dram_wvalid ; 
wire         dram_wready ; 
wire [3 :0]  dram_bid    ; 
wire [1 :0]  dram_bresp  ; 
wire         dram_bvalid ; 
wire         dram_bready ; 
wire [3 :0]  dram_arid   ; 
wire [31:0]  dram_araddr ; 
wire [7 :0]  dram_arlen  ; 
wire [2 :0]  dram_arsize ; 
wire [1 :0]  dram_arburst; 
wire         dram_arlock ; 
wire [3 :0]  dram_arcache; 
wire [2 :0]  dram_arprot ; 
wire         dram_arvalid; 
wire         dram_arready; 
wire [3 :0]  dram_rid    ; 
wire [31:0]  dram_rdata  ; 
wire [1 :0]  dram_rresp  ; 
wire         dram_rlast  ; 
wire         dram_rvalid ; 
wire         dram_rready ; 

/*
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
*/

//cpu
wire [5:0] int_n_i = 6'b111111;
_core_top core_i(
    .clk             (hclk        ),
    .reset           (!hresetn    ),
    .interrupt       (8'd0),
    
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
/*
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
*/

     //inst sram
    .inst_cen (),
    .inst_wen (),
    .inst_addr(),
    .inst_din (),
    .inst_dout(32'b0),
    //data sram
    .data_cen (),
    .data_wen (),
    .data_addr(),
    .data_din (),
    .data_dout(32'b0)
   
);

// ahblite->axi4
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

    .m_axi_awid         (axi_awid       ),
    .m_axi_awaddr       (axi_awaddr     ),
    .m_axi_awlen        (axi_awlen      ),
    .m_axi_awsize       (axi_awsize     ),
    .m_axi_awburst      (axi_awburst    ),
    .m_axi_awlock       (axi_awlock     ),
    .m_axi_awcache      (axi_awcache    ),
    .m_axi_awprot       (axi_awprot     ),
    .m_axi_awvalid      (axi_awvalid    ),
    .m_axi_awready      (axi_awready    ),
    .m_axi_wdata        (axi_wdata      ),
    .m_axi_wstrb        (axi_wstrb      ),
    .m_axi_wlast        (axi_wlast      ),
    .m_axi_wvalid       (axi_wvalid     ),
    .m_axi_wready       (axi_wready     ),
    .m_axi_bid          (axi_bid        ),
    .m_axi_bresp        (axi_bresp      ),
    .m_axi_bvalid       (axi_bvalid     ),
    .m_axi_bready       (axi_bready     ),
    .m_axi_arid         (axi_arid       ),
    .m_axi_araddr       (axi_araddr     ),
    .m_axi_arlen        (axi_arlen      ),
    .m_axi_arsize       (axi_arsize     ),
    .m_axi_arburst      (axi_arburst    ),
    .m_axi_arlock       (axi_arlock     ),
    .m_axi_arcache      (axi_arcache    ),
    .m_axi_arprot       (axi_arprot     ),
    .m_axi_arvalid      (axi_arvalid    ),
    .m_axi_arready      (axi_arready    ),
    .m_axi_rid          (axi_rid        ),
    .m_axi_rdata        (axi_rdata      ),
    .m_axi_rresp        (axi_rresp      ),
    .m_axi_rlast        (axi_rlast      ),
    .m_axi_rvalid       (axi_rvalid     ),
    .m_axi_rready       (axi_rready     )
);

axi_crossbar_0 axi_1x3_mux(
    .aclk           (hclk    ), 
    .aresetn        (hresetn ), 
    .s_axi_awid     (axi_awid           ),
    .s_axi_awaddr   (axi_awaddr         ),  
    .s_axi_awlen    (axi_awlen          ), 
    .s_axi_awsize   (axi_awsize         ),  
    .s_axi_awburst  (axi_awburst        ),   
    .s_axi_awlock   (axi_awlock         ),  
    .s_axi_awcache  (axi_awcache        ),   
    .s_axi_awprot   (axi_awprot         ),  
    .s_axi_awqos    (4'b0               ), 
    .s_axi_awvalid  (axi_awvalid        ),   
    .s_axi_awready  (axi_awready        ),   
    .s_axi_wdata    (axi_wdata          ), 
    .s_axi_wstrb    (axi_wstrb          ), 
    .s_axi_wlast    (axi_wlast          ),  
    .s_axi_wvalid   (axi_wvalid         ),  
    .s_axi_wready   (axi_wready         ), 
    .s_axi_bid      (axi_bid            ), 
    .s_axi_bresp    (axi_bresp          ), 
    .s_axi_bvalid   (axi_bvalid         ),  
    .s_axi_bready   (axi_bready         ),  
    .s_axi_arid     (axi_arid           ),
    .s_axi_araddr   (axi_araddr         ),  
    .s_axi_arlen    (axi_arlen          ), 
    .s_axi_arsize   (axi_arsize         ),  
    .s_axi_arburst  (axi_arburst        ),   
    .s_axi_arlock   (axi_arlock         ),  
    .s_axi_arcache  (axi_arcache        ),   
    .s_axi_arprot   (axi_arprot         ),  
    .s_axi_arqos    (4'b0               ), 
    .s_axi_arvalid  (axi_arvalid        ),   
    .s_axi_arready  (axi_arready        ),   
    .s_axi_rid      (axi_rid            ), 
    .s_axi_rdata    (axi_rdata          ), 
    .s_axi_rresp    (axi_rresp          ), 
    .s_axi_rlast    (axi_rlast          ),  
    .s_axi_rvalid   (axi_rvalid         ),  
    .s_axi_rready   (axi_rready         ),
    .m_axi_awid     ({dram_awid   , iram_awid   , conf_awid   }),
    .m_axi_awaddr   ({dram_awaddr , iram_awaddr , conf_awaddr }),  
    .m_axi_awlen    ({dram_awlen  , iram_awlen  , conf_awlen  }), 
    .m_axi_awsize   ({dram_awsize , iram_awsize , conf_awsize }),  
    .m_axi_awburst  ({dram_awburst, iram_awburst, conf_awburst}),   
    .m_axi_awlock   ({dram_awlock , iram_awlock , conf_awlock }),  
    .m_axi_awcache  ({dram_awcache, iram_awcache, conf_awcache}),   
    .m_axi_awprot   ({dram_awprot , iram_awprot , conf_awprot }),  
    .m_axi_awregion (                                          ),    
    .m_axi_awqos    (                                          ), 
    .m_axi_awvalid  ({dram_awvalid, iram_awvalid, conf_awvalid}),   
    .m_axi_awready  ({dram_awready, iram_awready, conf_awready}),   
    .m_axi_wdata    ({dram_wdata  , iram_wdata  , conf_wdata  }), 
    .m_axi_wstrb    ({dram_wstrb  , iram_wstrb  , conf_wstrb  }), 
    .m_axi_wlast    ({dram_wlast  , iram_wlast  , conf_wlast  }), 
    .m_axi_wvalid   ({dram_wvalid , iram_wvalid , conf_wvalid }),  
    .m_axi_wready   ({dram_wready , iram_wready , conf_wready }),  
    .m_axi_bid      ({dram_bid    , iram_bid    , conf_bid    }),
    .m_axi_bresp    ({dram_bresp  , iram_bresp  , conf_bresp  }), 
    .m_axi_bvalid   ({dram_bvalid , iram_bvalid , conf_bvalid }),  
    .m_axi_bready   ({dram_bready , iram_bready , conf_bready }),  
    .m_axi_arid     ({dram_arid   , iram_arid   , conf_arid   }),
    .m_axi_araddr   ({dram_araddr , iram_araddr , conf_araddr }),  
    .m_axi_arlen    ({dram_arlen  , iram_arlen  , conf_arlen  }), 
    .m_axi_arsize   ({dram_arsize , iram_arsize , conf_arsize }),  
    .m_axi_arburst  ({dram_arburst, iram_arburst, conf_arburst}),   
    .m_axi_arlock   ({dram_arlock , iram_arlock , conf_arlock }),  
    .m_axi_arcache  ({dram_arcache, iram_arcache, conf_arcache}),   
    .m_axi_arprot   ({dram_arprot , iram_arprot , conf_arprot }),  
    .m_axi_arregion (                                          ),    
    .m_axi_arqos    (                                          ), 
    .m_axi_arvalid  ({dram_arvalid, iram_arvalid, conf_arvalid}),   
    .m_axi_arready  ({dram_arready, iram_arready, conf_arready}),   
    .m_axi_rid      ({dram_rid    , iram_rid    , conf_rid    }),
    .m_axi_rdata    ({dram_rdata  , iram_rdata  , conf_rdata  }), 
    .m_axi_rresp    ({dram_rresp  , iram_rresp  , conf_rresp  }), 
    .m_axi_rlast    ({dram_rlast  , iram_rlast  , conf_rlast  }), 
    .m_axi_rvalid   ({dram_rvalid , iram_rvalid , conf_rvalid }),  
    .m_axi_rready   ({dram_rready , iram_rready , conf_rready })  
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
.s_awid            (conf_awid   ),
.s_awaddr          (conf_awaddr ),
.s_awlen           (conf_awlen  ),
.s_awsize          (conf_awsize ),
.s_awburst         (conf_awburst),
.s_awlock          (conf_awlock ),
.s_awcache         (conf_awcache),
.s_awprot          (conf_awprot ),
.s_awvalid         (conf_awvalid),
.s_awready         (conf_awready),
.s_wready          (conf_wready ),
.s_wdata           (conf_wdata  ),
.s_wstrb           (conf_wstrb  ),
.s_wlast           (conf_wlast  ),
.s_wvalid          (conf_wvalid ),
.s_bid             (conf_bid    ),
.s_bresp           (conf_bresp  ),
.s_bvalid          (conf_bvalid ),
.s_bready          (conf_bready ),
.s_arid            (conf_arid   ),
.s_araddr          (conf_araddr ),
.s_arlen           (conf_arlen  ),
.s_arsize          (conf_arsize ),
.s_arburst         (conf_arburst),
.s_arlock          (conf_arlock ),
.s_arcache         (conf_arcache),
.s_arprot          (conf_arprot ),
.s_arvalid         (conf_arvalid),
.s_arready         (conf_arready),
.s_rready          (conf_rready ),
.s_rid             (conf_rid    ),
.s_rdata           (conf_rdata  ),
.s_rresp           (conf_rresp  ),
.s_rlast           (conf_rlast  ),
.s_rvalid          (conf_rvalid ),

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
/*
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
*/
// inst ram axi4
inst_ram_delay inst_ram_delay(
    .s_aclk         (hclk          ),
    .s_aresetn      (hresetn       ),
    .s_axi_awid     (iram_awid     ),
    .s_axi_awaddr   (iram_awaddr   ),
                             
    .s_axi_awlen    (iram_awlen    ),
    .s_axi_awsize   (iram_awsize   ),
    .s_axi_awburst  (iram_awburst  ),
    .s_axi_awvalid  (iram_awvalid  ),
    .s_axi_awready  (iram_awready  ),
    .s_axi_wdata    (iram_wdata    ),
                           
    .s_axi_wstrb    (iram_wstrb    ),
    .s_axi_wlast    (iram_wlast    ),
    .s_axi_wvalid   (iram_wvalid   ),
    .s_axi_wready   (iram_wready   ),
    .s_axi_bid      (iram_bid      ),
    .s_axi_bresp    (iram_bresp    ),
    .s_axi_bvalid   (iram_bvalid   ),
                             
    .s_axi_bready   (iram_bready   ),
    .s_axi_arid     (iram_arid     ),
    .s_axi_araddr   (iram_araddr   ),
    .s_axi_arlen    (iram_arlen    ),
    .s_axi_arsize   (iram_arsize   ),
    .s_axi_arburst  (iram_arburst  ),
                             
    .s_axi_arvalid  (iram_arvalid  ),
    .s_axi_arready  (iram_arready  ),
    .s_axi_rid      (iram_rid      ),
    .s_axi_rdata    (iram_rdata    ),
    .s_axi_rresp    (iram_rresp    ),
    .s_axi_rlast    (iram_rlast    ),
    .s_axi_rvalid   (iram_rvalid   ),
                             
    .s_axi_rready   (iram_rready   )
);
// data ram axi4
data_ram_delay data_ram_delay(
    .s_aclk         (hclk          ),
    .s_aresetn      (hresetn       ),
    .s_axi_awid     (dram_awid     ),
    .s_axi_awaddr   (dram_awaddr   ),
                             
    .s_axi_awlen    (dram_awlen    ),
    .s_axi_awsize   (dram_awsize   ),
    .s_axi_awburst  (dram_awburst  ),
    .s_axi_awvalid  (dram_awvalid  ),
    .s_axi_awready  (dram_awready  ),
    .s_axi_wdata    (dram_wdata    ),
                           
    .s_axi_wstrb    (dram_wstrb    ),
    .s_axi_wlast    (dram_wlast    ),
    .s_axi_wvalid   (dram_wvalid   ),
    .s_axi_wready   (dram_wready   ),
    .s_axi_bid      (dram_bid      ),
    .s_axi_bresp    (dram_bresp    ),
    .s_axi_bvalid   (dram_bvalid   ),
                             
    .s_axi_bready   (dram_bready   ),
    .s_axi_arid     (dram_arid     ),
    .s_axi_araddr   (dram_araddr   ),
    .s_axi_arlen    (dram_arlen    ),
    .s_axi_arsize   (dram_arsize   ),
    .s_axi_arburst  (dram_arburst  ),
                             
    .s_axi_arvalid  (dram_arvalid  ),
    .s_axi_arready  (dram_arready  ),
    .s_axi_rid      (dram_rid      ),
    .s_axi_rdata    (dram_rdata    ),
    .s_axi_rresp    (dram_rresp    ),
    .s_axi_rlast    (dram_rlast    ),
    .s_axi_rvalid   (dram_rvalid   ),
                             
    .s_axi_rready   (dram_rready   )
);

endmodule

