`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 18:46:48
// Design Name: 
// Module Name: alu
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


module alu(A,B,func,aluop,op);
input [31:0]A,B;
input [1:0]aluop;
output reg[31:0]op;
input [5:0]func;
    
    always@(*)begin
    if(aluop==2'b10)
    begin
    case(func)
    6'b011000:op<=A*B;
    //6'b100101:op<=A|B;
    6'b100000:op<=A+B;
    6'b100010:op<=A-B;
    6'b100000:op<=A<<B;
    6'b000010:op<=A>>B;
    //default:op<=32'bx;
    
    endcase
    end
    else if(aluop==2'b00) begin
    op=(A+B); end
    
    else if(aluop==2'b11)begin
    op<= A>>B;//A||B;
    end
    
    
    end 
    endmodule