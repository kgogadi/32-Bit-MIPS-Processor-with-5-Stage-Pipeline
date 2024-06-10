`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2023 21:57:25
// Design Name: 
// Module Name: mux_cu
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


module mux_cu(a,b,s,op);
input a,b;
input s;
output op;
assign op=s?b:a;
/*always@(*)
case(s)
1'b0:op<=a;
1'b1:op<=b; 
endcase*/
endmodule
