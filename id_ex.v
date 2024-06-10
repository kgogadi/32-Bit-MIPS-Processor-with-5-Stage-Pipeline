`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 15:58:33
// Design Name: 
// Module Name: id_ex
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


module id_ex(input clk,input [31:0]readreg1,input [31:0]readreg2,output reg [31:0]readreg1o , output reg [31:0]readreg2o, input [31:0]signextend, output reg[31:0] signextendo,
input regwrite , output reg regwriteo, input regdst , output reg regdsto,input alusrc , output reg alusrco, input [1:0]aluop , output reg[1:0] aluopo, 
input memwrite,output reg memwriteo, input memread , output reg memreado, input memtoreg , output reg memtorego
,input [4:0]rs, output reg [4:0]rso, input [4:0]rt, output reg [4:0]rto,input [4:0]rd, output reg [4:0]rdo,input [5:0]func,output reg [5:0] funco  );
   always@(posedge clk)
   begin 
   readreg1o<=readreg1;
   readreg2o<=readreg2;
   signextendo<=signextend;
   regwriteo<=regwrite;
   regdsto<=regdst;
   alusrco<=alusrc;
   aluopo<=aluop;
   memwriteo<=memwrite;
   memreado<=memread;
   memtorego<=memtoreg;
   rso<=rs;
   rto<=rt;
   rdo<=rd;
   funco<=func;
   
    end
endmodule
