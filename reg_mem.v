`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 16:25:46
// Design Name: 
// Module Name: reg_mem
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


module reg_mem(
    input rst,
    input [31:0] Write_Data,
    input [4:0] src1,
    input [4:0]src2,
    
    input [4:0]dst,
    input regwrite,
    output [31:0] Read_Data_1,
   output  [31:0] Read_Data_2
    );
    reg[4:0]Write_Reg_Num_1;
    reg [31:0]register[31:0];
     assign Read_Data_1 = register[src1];
     assign Read_Data_2 = register[src2];


    always@(*)
    begin
    if(rst)
register[0]=32'd3;
register[1]=32'd1;
register[2]=32'd4;
register[3]=32'd1;
register[4]=32'd4;
register[5]=32'd3;
register[6]=32'd9;
register[7]=32'd7;
register[8]=32'd10;
register[9]=32'd16;
register[10]=32'd17;
register[11]=32'd19;
register[12]=32'd18;

   
    end
    
   
    always@(*)
    begin
    
    if(regwrite)
     register[dst]<=Write_Data;
     
     

    end
endmodule