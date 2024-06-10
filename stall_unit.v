`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2023 22:16:08
// Design Name: 
// Module Name: stall_unit
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


module stall_unit(input rst,input memread, input[4:0]id_ex_rt,input[4:0]if_id_rs,input[4:0]if_id_rt ,output reg stall_signal);
//assign stall_signal= ((memread==1)&((id_ex_rt==if_id_rs)|(id_ex_rt==if_id_rt)))?0:1;
always@(*)
begin
if(rst)
begin
stall_signal=1'b1;
//control_stall=1'b1;
end
if(id_ex_rt==5'b0)
stall_signal=1;

else if((memread==1)&((id_ex_rt==if_id_rs)|(id_ex_rt==if_id_rt)))
begin
//control_stall=1'b0;
stall_signal=1'b0;

end
else
stall_signal=1'b1;
//control_stall=1'b1;
end
endmodule
