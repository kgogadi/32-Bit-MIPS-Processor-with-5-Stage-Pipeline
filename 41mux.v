`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2023 15:27:26
// Design Name: 
// Module Name: 41mux
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


module mux41(A,B,C,S,op);
input [31:0]A,B,C;
input [1:0]S;
output reg [31:0]op;
always@(*)
case(S)
2'b11:op=A;
2'b10:op=B;
2'b01:op=C; 
endcase

endmodule
