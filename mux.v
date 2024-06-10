`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 18:47:09
// Design Name: 
// Module Name: mux
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


module mux(a,b,s,op);
input [31:0]a,b;
input s;
output reg [31:0]op;
always@(*)
case(s)
0:op<=a; 
1:op<=b; 
1'bx:op<=32'bx;
endcase
endmodule
