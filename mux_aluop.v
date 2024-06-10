`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2023 22:01:43
// Design Name: 
// Module Name: mux_aluop
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


module mux_aluop(a,b,s,op);
input [1:0]a,b;
input s;
output reg [1:0]op;
always@(*)
case(s)
1'b0:op<=a;
1'b1:op<=b; 
endcase
endmodule