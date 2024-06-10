`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 15:58:21
// Design Name: 
// Module Name: ex_mem
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


module ex_mem(input clk,input memwrite,output reg memwriteo, input memread , output reg memreado,
 input memtoreg , output reg memtorego ,input regwrite,output reg regwriteo , input [4:0]writereg
,input [31:0]aluresult, output reg [31:0]aluresulto, input [31:0]readreg2, output reg [31:0]readreg2o, output reg [4:0]rdo);
always@(posedge clk)
begin 
   rdo<=writereg;
   aluresulto<=aluresult;
   readreg2o<=readreg2;
   regwriteo<=regwrite;
   memwriteo<=memwrite;
   memreado<=memread;
   memtorego<=memtoreg;
      
end
endmodule
