`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/20 01:05:33
// Design Name: 
// Module Name: MUX
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


module MUX5_2(
    input [4:0] A,
    input [4:0] B,
    input sel,
    output reg [4:0] out
    );
    always @(*)
    begin
        case(sel)
        1'b0:out = A;
        1'b1:out = B;
        default:out = 0;
        endcase
    end
endmodule


module MUX32_2(
    input [31:0] A,
    input [31:0] B,
    input sel,
    output reg [31:0] out
    );
    always @(*)
    begin
        case(sel)
        1'b0:out = A;
        1'b1:out = B;
        default:out = 0;
        endcase
    end
endmodule

module MUX32_3(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [1:0] sel,
    output reg [31:0] out
    );
    always @(*)
    begin
        case(sel)
        2'b00:out = A;
        2'b01:out = B;
        2'b10:out = C;
        default:out = 0;
        endcase
    end
endmodule

module MUX32_5(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [31:0] E,
    input [31:0] F,
    input [2:0] sel,
    output reg [31:0] out
    );
    always @(*)
    begin
        case(sel)
        3'd0:out = A;
        3'd1:out = B;
        3'd2:out = C;
        3'd3:out = D;
        3'd4:out = E;
        3'd5:out = F;
        default:out = 0;
        endcase
    end
endmodule

module MUX32_6(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [31:0] E,
    input [31:0] H,
    input [2:0] sel,
    output reg [31:0] out
    );
    always @(*)
    begin
        case(sel)
        3'd0:out = A;
        3'd1:out = B;
        3'd2:out = C;
        3'd3:out = D;
        3'd4:out = E;
        3'd7:out = H;
        default:out = 0;
        endcase
    end
endmodule

module MUX5_3(
    input [4:0] A,
    input [4:0] B,
    input [4:0] C,
    input [1:0] sel,
    output reg [4:0] out
    );
    always @(*)
    begin
        case(sel)
        2'b00:out = A;
        2'b01:out = B;
        2'b10:out = C;
        default:out = 0;
        endcase
    end
endmodule
