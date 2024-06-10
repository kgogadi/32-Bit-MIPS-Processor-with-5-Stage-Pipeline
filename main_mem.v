`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 23:54:34
// Design Name: 
// Module Name: main_mem
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


module main_mem(rst,aluresult,writedata,memread,memwrite,readdata);
input rst;
input [31:0]aluresult;
input [31:0]writedata;
input memread;
input memwrite;
output reg [31:0]readdata;
reg [31:0]register[63:0];
always@(*)
if(rst)
begin
register[0]<=32'd10;
register[1]<=32'd20;
register[2]<=32'd30;
register[3]<=32'd40;
register[4]<=32'd50;
register[5]<=32'd60;
end
else
begin
if(memwrite)
begin
register[aluresult]<=writedata;
readdata<=32'bx;
end
else if(memread)
readdata<=register[aluresult];

end
endmodule
