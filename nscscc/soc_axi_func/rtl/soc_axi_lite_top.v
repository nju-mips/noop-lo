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

//*************************************************************************
//   > File Name   : soc_top.v
//   > Description : SoC, included cpu, 2 x 3 bridge,
//                   inst ram, confreg, data ram
// 
//           -------------------------
//           |           cpu         |
//           -------------------------
//         inst|                  | data
//             |                  | 
//             |        ---------------------
//             |        |    1 x 2 bridge   |
//             |        ---------------------
//             |             |            |           
//             |             |            |           
//      -------------   -----------   -----------
//      | inst ram  |   | data ram|   | confreg |
//      -------------   -----------   -----------
//
//   > Author      : LOONGSON
//   > Date        : 2017-08-04
//*************************************************************************

module soc_axi_lite_top #(parameter SIMULATION=1'b0)
(
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
//debug signals
wire [31:0] debug_wb_pc;
wire [3 :0] debug_wb_rf_wen;
wire [4 :0] debug_wb_rf_wnum;
wire [31:0] debug_wb_rf_wdata;

//clk and resetn
wire cpu_clk;
wire timer_clk;
reg cpu_resetn;
always @(posedge cpu_clk)
begin
    cpu_resetn <= resetn;
end
clk_pll clk_pll
(
    .clk_in1 (clk),
    .cpu_clk (cpu_clk),
    .timer_clk (timer_clk)
);

//cpu axi
wire [3 :0] cpu_arid   ;
wire [31:0] cpu_araddr ;
wire [7 :0] cpu_arlen  ;
wire [2 :0] cpu_arsize ;
wire [1 :0] cpu_arburst;
wire [1 :0] cpu_arlock ;
wire [3 :0] cpu_arcache;
wire [2 :0] cpu_arprot ;
wire        cpu_arvalid;
wire        cpu_arready;
wire [3 :0] cpu_rid    ;
wire [31:0] cpu_rdata  ;
wire [1 :0] cpu_rresp  ;
wire        cpu_rlast  ;
wire        cpu_rvalid ;
wire        cpu_rready ;
wire [3 :0] cpu_awid   ;
wire [31:0] cpu_awaddr ;
wire [7 :0] cpu_awlen  ;
wire [2 :0] cpu_awsize ;
wire [1 :0] cpu_awburst;
wire [1 :0] cpu_awlock ;
wire [3 :0] cpu_awcache;
wire [2 :0] cpu_awprot ;
wire        cpu_awvalid;
wire        cpu_awready;
wire [3 :0] cpu_wid    ;
wire [31:0] cpu_wdata  ;
wire [3 :0] cpu_wstrb  ;
wire        cpu_wlast  ;
wire        cpu_wvalid ;
wire        cpu_wready ;
wire [3 :0] cpu_bid    ;
wire [1 :0] cpu_bresp  ;
wire        cpu_bvalid ;
wire        cpu_bready ;

//axi ram
wire [3 :0] ram_arid   ;
wire [31:0] ram_araddr ;
wire [3 :0] ram_arlen  ;
wire [2 :0] ram_arsize ;
wire [1 :0] ram_arburst;
wire [1 :0] ram_arlock ;
wire [3 :0] ram_arcache;
wire [2 :0] ram_arprot ;
wire        ram_arvalid;
wire        ram_arready;
wire [3 :0] ram_rid    ;
wire [31:0] ram_rdata  ;
wire [1 :0] ram_rresp  ;
wire        ram_rlast  ;
wire        ram_rvalid ;
wire        ram_rready ;
wire [3 :0] ram_awid   ;
wire [31:0] ram_awaddr ;
wire [3 :0] ram_awlen  ;
wire [2 :0] ram_awsize ;
wire [1 :0] ram_awburst;
wire [1 :0] ram_awlock ;
wire [3 :0] ram_awcache;
wire [2 :0] ram_awprot ;
wire        ram_awvalid;
wire        ram_awready;
wire [3 :0] ram_wid    ;
wire [31:0] ram_wdata  ;
wire [3 :0] ram_wstrb  ;
wire        ram_wlast  ;
wire        ram_wvalid ;
wire        ram_wready ;
wire [3 :0] ram_bid    ;
wire [1 :0] ram_bresp  ;
wire        ram_bvalid ;
wire        ram_bready ;
//conf
wire [3 :0] conf_arid   ;
wire [31:0] conf_araddr ;
wire [3 :0] conf_arlen  ;
wire [2 :0] conf_arsize ;
wire [1 :0] conf_arburst;
wire [1 :0] conf_arlock ;
wire [3 :0] conf_arcache;
wire [2 :0] conf_arprot ;
wire        conf_arvalid;
wire        conf_arready;
wire [3 :0] conf_rid    ;
wire [31:0] conf_rdata  ;
wire [1 :0] conf_rresp  ;
wire        conf_rlast  ;
wire        conf_rvalid ;
wire        conf_rready ;
wire [3 :0] conf_awid   ;
wire [31:0] conf_awaddr ;
wire [3 :0] conf_awlen  ;
wire [2 :0] conf_awsize ;
wire [1 :0] conf_awburst;
wire [1 :0] conf_awlock ;
wire [3 :0] conf_awcache;
wire [2 :0] conf_awprot ;
wire        conf_awvalid;
wire        conf_awready;
wire [3 :0] conf_wid    ;
wire [31:0] conf_wdata  ;
wire [3 :0] conf_wstrb  ;
wire        conf_wlast  ;
wire        conf_wvalid ;
wire        conf_wready ;
wire [3 :0] conf_bid    ;
wire [1 :0] conf_bresp  ;
wire        conf_bvalid ;
wire        conf_bready ;

//for lab6
wire [4 :0] ram_random_mask;

//cpu axi
//debug_*
mycpu_top u_cpu(
    .int       (6'd0          ),   //high active

    .aclk      (cpu_clk       ),
    .aresetn   (cpu_resetn    ),   //low active

    .arid      (cpu_arid      ),
    .araddr    (cpu_araddr    ),
    .arlen     (cpu_arlen     ),
    .arsize    (cpu_arsize    ),
    .arburst   (cpu_arburst   ),
    .arlock    (cpu_arlock    ),
    .arcache   (cpu_arcache   ),
    .arprot    (cpu_arprot    ),
    .arvalid   (cpu_arvalid   ),
    .arready   (cpu_arready   ),
                
    .rid       (cpu_rid       ),
    .rdata     (cpu_rdata     ),
    .rresp     (cpu_rresp     ),
    .rlast     (cpu_rlast     ),
    .rvalid    (cpu_rvalid    ),
    .rready    (cpu_rready    ),
               
    .awid      (cpu_awid      ),
    .awaddr    (cpu_awaddr    ),
    .awlen     (cpu_awlen     ),
    .awsize    (cpu_awsize    ),
    .awburst   (cpu_awburst   ),
    .awlock    (cpu_awlock    ),
    .awcache   (cpu_awcache   ),
    .awprot    (cpu_awprot    ),
    .awvalid   (cpu_awvalid   ),
    .awready   (cpu_awready   ),
    
    .wid       (cpu_wid       ),
    .wdata     (cpu_wdata     ),
    .wstrb     (cpu_wstrb     ),
    .wlast     (cpu_wlast     ),
    .wvalid    (cpu_wvalid    ),
    .wready    (cpu_wready    ),
    
    .bid       (cpu_bid       ),
    .bresp     (cpu_bresp     ),
    .bvalid    (cpu_bvalid    ),
    .bready    (cpu_bready    ),

    //debug interface
    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_rf_wen  (debug_wb_rf_wen  ),
    .debug_wb_rf_wnum (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata(debug_wb_rf_wdata)
);

axi_crossbar_1x2 u_axi_crossbar_1x2(
    .aclk             ( cpu_clk         ), // i, 1                 
    .aresetn          ( cpu_resetn      ), // i, 1                 

    .s_axi_arid       ( cpu_arid        ),
    .s_axi_araddr     ( cpu_araddr      ),
    .s_axi_arlen      ( cpu_arlen[3:0]  ),
    .s_axi_arsize     ( cpu_arsize      ),
    .s_axi_arburst    ( cpu_arburst     ),
    .s_axi_arlock     ( cpu_arlock      ),
    .s_axi_arcache    ( cpu_arcache     ),
    .s_axi_arprot     ( cpu_arprot      ),
    .s_axi_arqos      ( 4'd0            ),
    .s_axi_arvalid    ( cpu_arvalid     ),
    .s_axi_arready    ( cpu_arready     ),
    .s_axi_rid        ( cpu_rid         ),
    .s_axi_rdata      ( cpu_rdata       ),
    .s_axi_rresp      ( cpu_rresp       ),
    .s_axi_rlast      ( cpu_rlast       ),
    .s_axi_rvalid     ( cpu_rvalid      ),
    .s_axi_rready     ( cpu_rready      ),
    .s_axi_awid       ( cpu_awid        ),
    .s_axi_awaddr     ( cpu_awaddr      ),
    .s_axi_awlen      ( cpu_awlen[3:0]  ),
    .s_axi_awsize     ( cpu_awsize      ),
    .s_axi_awburst    ( cpu_awburst     ),
    .s_axi_awlock     ( cpu_awlock      ),
    .s_axi_awcache    ( cpu_awcache     ),
    .s_axi_awprot     ( cpu_awprot      ),
    .s_axi_awqos      ( 4'd0            ),
    .s_axi_awvalid    ( cpu_awvalid     ),
    .s_axi_awready    ( cpu_awready     ),
    .s_axi_wid        ( cpu_wid         ),
    .s_axi_wdata      ( cpu_wdata       ),
    .s_axi_wstrb      ( cpu_wstrb       ),
    .s_axi_wlast      ( cpu_wlast       ),
    .s_axi_wvalid     ( cpu_wvalid      ),
    .s_axi_wready     ( cpu_wready      ),
    .s_axi_bid        ( cpu_bid         ),
    .s_axi_bresp      ( cpu_bresp       ),
    .s_axi_bvalid     ( cpu_bvalid      ),
    .s_axi_bready     ( cpu_bready      ),

    .m_axi_arid       ( {ram_arid   ,conf_arid   } ),
    .m_axi_araddr     ( {ram_araddr ,conf_araddr } ),
    .m_axi_arlen      ( {ram_arlen  ,conf_arlen  } ),
    .m_axi_arsize     ( {ram_arsize ,conf_arsize } ),
    .m_axi_arburst    ( {ram_arburst,conf_arburst} ),
    .m_axi_arlock     ( {ram_arlock ,conf_arlock } ),
    .m_axi_arcache    ( {ram_arcache,conf_arcache} ),
    .m_axi_arprot     ( {ram_arprot ,conf_arprot } ),
    .m_axi_arqos      (                            ),
    .m_axi_arvalid    ( {ram_arvalid,conf_arvalid} ),
    .m_axi_arready    ( {ram_arready,conf_arready} ),
    .m_axi_rid        ( {ram_rid    ,conf_rid    } ),
    .m_axi_rdata      ( {ram_rdata  ,conf_rdata  } ),
    .m_axi_rresp      ( {ram_rresp  ,conf_rresp  } ),
    .m_axi_rlast      ( {ram_rlast  ,conf_rlast  } ),
    .m_axi_rvalid     ( {ram_rvalid ,conf_rvalid } ),
    .m_axi_rready     ( {ram_rready ,conf_rready } ),
    .m_axi_awid       ( {ram_awid   ,conf_awid   } ),
    .m_axi_awaddr     ( {ram_awaddr ,conf_awaddr } ),
    .m_axi_awlen      ( {ram_awlen  ,conf_awlen  } ),
    .m_axi_awsize     ( {ram_awsize ,conf_awsize } ),
    .m_axi_awburst    ( {ram_awburst,conf_awburst} ),
    .m_axi_awlock     ( {ram_awlock ,conf_awlock } ),
    .m_axi_awcache    ( {ram_awcache,conf_awcache} ),
    .m_axi_awprot     ( {ram_awprot ,conf_awprot } ),
    .m_axi_awqos      (                            ),
    .m_axi_awvalid    ( {ram_awvalid,conf_awvalid} ),
    .m_axi_awready    ( {ram_awready,conf_awready} ),
    .m_axi_wid        ( {ram_wid    ,conf_wid    } ),
    .m_axi_wdata      ( {ram_wdata  ,conf_wdata  } ),
    .m_axi_wstrb      ( {ram_wstrb  ,conf_wstrb  } ),
    .m_axi_wlast      ( {ram_wlast  ,conf_wlast  } ),
    .m_axi_wvalid     ( {ram_wvalid ,conf_wvalid } ),
    .m_axi_wready     ( {ram_wready ,conf_wready } ),
    .m_axi_bid        ( {ram_bid    ,conf_bid    } ),
    .m_axi_bresp      ( {ram_bresp  ,conf_bresp  } ),
    .m_axi_bvalid     ( {ram_bvalid ,conf_bvalid } ),
    .m_axi_bready     ( {ram_bready ,conf_bready } )

 );

//axi ram
axi_wrap_ram u_axi_ram
(
    .aclk          ( cpu_clk          ),
    .aresetn       ( cpu_resetn       ),
    //ar
    .axi_arid      ( ram_arid         ),
    .axi_araddr    ( ram_araddr       ),
    .axi_arlen     ( {4'd0,ram_arlen} ),
    .axi_arsize    ( ram_arsize       ),
    .axi_arburst   ( ram_arburst      ),
    .axi_arlock    ( ram_arlock       ),
    .axi_arcache   ( ram_arcache      ),
    .axi_arprot    ( ram_arprot       ),
    .axi_arvalid   ( ram_arvalid      ),
    .axi_arready   ( ram_arready      ),
    //r             
    .axi_rid       ( ram_rid          ),
    .axi_rdata     ( ram_rdata        ),
    .axi_rresp     ( ram_rresp        ),
    .axi_rlast     ( ram_rlast        ),
    .axi_rvalid    ( ram_rvalid       ),
    .axi_rready    ( ram_rready       ),
    //aw           
    .axi_awid      ( ram_awid         ),
    .axi_awaddr    ( ram_awaddr       ),
    .axi_awlen     ( {4'd0,ram_awlen[3:0]}        ),
    .axi_awsize    ( ram_awsize       ),
    .axi_awburst   ( ram_awburst      ),
    .axi_awlock    ( ram_awlock       ),
    .axi_awcache   ( ram_awcache      ),
    .axi_awprot    ( ram_awprot       ),
    .axi_awvalid   ( ram_awvalid      ),
    .axi_awready   ( ram_awready      ),
    //w          
    .axi_wid       ( ram_wid          ),
    .axi_wdata     ( ram_wdata        ),
    .axi_wstrb     ( ram_wstrb        ),
    .axi_wlast     ( ram_wlast        ),
    .axi_wvalid    ( ram_wvalid       ),
    .axi_wready    ( ram_wready       ),
    //b              ram
    .axi_bid       ( ram_bid          ),
    .axi_bresp     ( ram_bresp        ),
    .axi_bvalid    ( ram_bvalid       ),
    .axi_bready    ( ram_bready       ),

    //random mask
    .ram_random_mask ( ram_random_mask )
);

//confreg
confreg #(.SIMULATION(SIMULATION)) u_confreg
(
    .timer_clk   ( timer_clk  ),  // i, 1   
    .aclk        ( cpu_clk    ),  // i, 1   
    .aresetn     ( cpu_resetn ),  // i, 1    

    .arid        (conf_arid    ),
    .araddr      (conf_araddr  ),
    .arlen       (conf_arlen   ),
    .arsize      (conf_arsize  ),
    .arburst     (conf_arburst ),
    .arlock      (conf_arlock  ),
    .arcache     (conf_arcache ),
    .arprot      (conf_arprot  ),
    .arvalid     (conf_arvalid ),
    .arready     (conf_arready ),
    .rid         (conf_rid     ),
    .rdata       (conf_rdata   ),
    .rresp       (conf_rresp   ),
    .rlast       (conf_rlast   ),
    .rvalid      (conf_rvalid  ),
    .rready      (conf_rready  ),
    .awid        (conf_awid    ),
    .awaddr      (conf_awaddr  ),
    .awlen       (conf_awlen   ),
    .awsize      (conf_awsize  ),
    .awburst     (conf_awburst ),
    .awlock      (conf_awlock  ),
    .awcache     (conf_awcache ),
    .awprot      (conf_awprot  ),
    .awvalid     (conf_awvalid ),
    .awready     (conf_awready ),
    .wid         (conf_wid     ),
    .wdata       (conf_wdata   ),
    .wstrb       (conf_wstrb   ),
    .wlast       (conf_wlast   ),
    .wvalid      (conf_wvalid  ),
    .wready      (conf_wready  ),
    .bid         (conf_bid     ),
    .bresp       (conf_bresp   ),
    .bvalid      (conf_bvalid  ),
    .bready      (conf_bready  ), 

    .ram_random_mask ( ram_random_mask ),
    .led         ( led        ),  // o, 16   
    .led_rg0     ( led_rg0    ),  // o, 2      
    .led_rg1     ( led_rg1    ),  // o, 2      
    .num_csn     ( num_csn    ),  // o, 8      
    .num_a_g     ( num_a_g    ),  // o, 7      
    .switch      ( switch     ),  // i, 8     
    .btn_key_col ( btn_key_col),  // o, 4          
    .btn_key_row ( btn_key_row),  // i, 4           
    .btn_step    ( btn_step   )   // i, 2   
);

endmodule

