`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2023 19:38:11
// Design Name: 
// Module Name: tb
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


module tb();
reg clk;
reg rst;
datapath dut(clk,rst);
always #5 clk=~clk;
initial
 begin
 clk=0;
 rst=1;
 #10 rst=0;


end
endmodule
