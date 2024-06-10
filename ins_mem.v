`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 16:30:16
// Design Name: 
// Module Name: ins_mem
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


module ins_mem(rst,clk,ins_code,stall_signal);
    input stall_signal;
    input rst;
    input clk;
    reg [31:0]pc;
    output  [31:0]ins_code;
    reg [7:0] mem [36:0];
      assign  ins_code={mem[pc],mem[pc+1],mem[pc+2],mem[pc+3]};
    always@(posedge clk)begin
    begin
         if(rst==1)
         begin
         pc<=32'b0;
          mem[0]<=8'h8C;mem[1]<=8'h01;mem[2]<=8'h00;mem[3]<=8'h00;
              mem[4]<=8'h8C;mem[5]<=8'h02;mem[6]<=8'h00;mem[7]<=8'h01;
              mem[8]<=8'h00;mem[9]<=8'h22;mem[10]<=8'h08;mem[11]<=8'h18;
             mem[12]<=8'h08;mem[13]<=8'h00;mem[14]<=8'h00;mem[15]<=8'h05;
              mem[16]<=8'h00;mem[17]<=8'h00;mem[18]<=8'h00;mem[19]<=8'h05;
              mem[20]<=8'h00;mem[21]<=8'h00;mem[22]<=8'h00;mem[23]<=8'h05;
              mem[24]<=8'h00;mem[25]<=8'h00;mem[26]<=8'h00;mem[27]<=8'h05;
            end
         if(stall_signal&~rst)
         begin
           
           pc<=pc+4;
           end
           end
         if(~stall_signal&~rst)
         pc<=pc;
    end

    
endmodule
