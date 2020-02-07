`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/24 15:44:11
// Design Name: 
// Module Name: tb_top
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


module tb_top(

    );
reg resetn;
reg clk;
initial
begin
    clk = 1'b0;
    resetn = 1'b0;
    #2000;
    resetn = 1'b1;
end
always #10 clk=~clk;
soc_lite_top soc_lite(
       .resetn (resetn), 
       .clk    (clk   ),
    
        //------gpio-------
        .num_csn(),
        .num_a_g(),
        .led    (),
        .switch () 
    );
 
//ÆÀ²â½á¹û´òÓ¡
    wire data_sel_vport;
    wire [7:0] vport_data;
    assign data_sel_vport = soc_lite.data_ram.addra==14'h1fff && (|soc_lite.data_ram.wea);
    assign vport_data     = soc_lite.data_ram.dina[7:0];
    wire aclk;
    assign aclk = soc_lite.hclk;
    
    always @(posedge aclk)
    begin
        if(data_sel_vport)
        begin
            if(vport_data==8'hff)
            begin
                $finish;
            end
            else
            begin
                $write("%c",vport_data);
            end
        end
    end
    
endmodule
