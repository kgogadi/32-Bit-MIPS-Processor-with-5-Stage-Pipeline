`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 15:59:28
// Design Name: 
// Module Name: mem_wb
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


module mem_wb(input clk, input memtoreg , output reg memtorego ,input regwrite , output reg regwriteo, input [4:0]writereg,
 input [31:0]readdata , output reg [31:0] readdatao ,input [31:0]aluresult , output reg [31:0] aluresulto , output reg [4:0]rdo

    );
    
    always@(posedge clk)
begin 
   regwriteo<=regwrite;
   memtorego<=memtoreg;
   readdatao<=readdata;
   aluresulto<=aluresult;
   rdo<=writereg;
   
end
endmodule
