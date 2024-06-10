`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:55:11
// Design Name: 
// Module Name: forward_unit
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


module forward_unit(input [4:0]id_ex_rs,input [4:0]id_ex_rt,input [4:0]ex_mem_rd,input [4:0]mem_wb_rd,
input ex_mem_regwrite,input mem_wb_regwrite,output reg [1:0]ctrl_rs, output reg [1:0] ctrl_rt);
always@(*) begin
 ctrl_rs<=2'b11;
 ctrl_rt<=2'b11;
  if ((ex_mem_regwrite==1)&(ex_mem_rd==id_ex_rs))
  ctrl_rs<=2'b10;
  if((ex_mem_regwrite==1)&(ex_mem_rd==id_ex_rt))
  ctrl_rt<=2'b10;
   
  if((mem_wb_regwrite==1)&(mem_wb_rd==id_ex_rs)&!((ex_mem_regwrite==1)&(ex_mem_rd==id_ex_rs)))
  ctrl_rs<=2'b01;
  
  if((mem_wb_regwrite==1)&(mem_wb_rd==id_ex_rt)&!((ex_mem_regwrite==1)&(ex_mem_rd==id_ex_rt)))
  ctrl_rt<=2'b01;
  
  
 
 
 
 
 
 end
 endmodule
