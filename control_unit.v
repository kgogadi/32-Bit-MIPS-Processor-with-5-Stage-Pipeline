`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 16:25:25
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode,regdst,regwrite,alusrc,aluop,memread,memwrite,memtoreg);
input [5:0]opcode;
output reg regdst;
output reg regwrite;
output reg alusrc;
output reg [1:0]aluop;
output reg memread;
output reg memwrite;
output reg memtoreg;

always@(*)
//load
if(opcode==6'b100011)
begin
regdst<=1'b0;
regwrite<=1'b1;
alusrc<=1'b1;
aluop<=2'b00;
memread<=1'b1;
memwrite<=1'b0;
memtoreg<=1'b1;
end 
//store
else if(opcode==6'b101011)
begin
regdst<=1'bx;
regwrite<=1'b0;
alusrc<=1'b1;
aluop<=2'b00;
memread<=1'b0;
memwrite<=1'b1;
memtoreg<=1'bx;
end
//jump,branch
else if(opcode==6'b000010)
begin
regdst<=1'bx;
regwrite<=1'b0;
alusrc<=1'b0;
aluop<=2'b01;
memread<=1'b0;
memwrite<=1'b0;
memtoreg<=1'bx;
end
//r type
else if(opcode==6'b0)
begin
regdst<=1'b1;
regwrite<=1'b1;
alusrc<=1'b0;
aluop<=2'b10;
memread<=1'b0;
memwrite<=1'b0;
memtoreg<=1'b0;
end
else if(opcode==6'b000001)//change this opcode to 001101.
begin
regdst<=1'b0;
regwrite<=1'b1;
alusrc<=1'b1;
aluop<=2'b11;
memread<=1'b0;
memwrite<=1'b0;
memtoreg<=1'b0;
end





endmodule
