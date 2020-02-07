`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 16:26:29
// Design Name: 
// Module Name: lz_32
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


module count_leading_zero(a_in,op0,result);
  input  [31:0] a_in;
  input op0;
  output [31:0] result;
  
  wire [31:0] value;
  wire [15:0] val16;
  wire [7:0] val8;
  wire [3:0] val4;
  assign value = a_in ^ {32{op0}};
  assign result[31:5] = 27'b0;
  assign result[4] = (value[31:16] == 16'b0);
  assign val16     = result[4] ? value[15:0] : value[31:16];
  assign result[3] = (val16[15:8] == 8'b0);
  assign val8      = result[3] ? val16[7:0] : val16[15:8];
  assign result[2] = (val8[7:4] == 4'b0);
  assign val4      = result[2] ? val8[3:0] : val8[7:4];
  assign result[1] = (val4[3:2] == 2'b0);
  assign result[0] = result[1] ? ~val4[1] : ~val4[3];                        
endmodule