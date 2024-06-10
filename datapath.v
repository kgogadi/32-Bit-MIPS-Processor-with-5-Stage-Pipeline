`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 21:33:58
// Design Name: 
// Module Name: datapath
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


    
module datapath(input clk,input rst);
wire [31:0]ins_code;
wire [31:0]ins_code_op;
wire[31:0]read_data_1,read_data_2;
wire [31:0] read_data_1o,read_data_2o,sign_extend_o;
wire regwrite_cu,regwrite_idex_o,regdst_cu,regdst_idex_o,alusrc_cu,alusrc_idex_o,memwrite_cu,memwrite_idex_o,memread_cu,memread_idex_o,memtoreg_cu,memtoreg_idex_o;
wire[1:0] aluop_cu,aluop_idex_o;
wire [4:0] rs_idex_o,rt_idex_o,rd_idex_o;
wire [5:0]func_idex_o;
//wire [4:0]rs_if_id=ins_code_op[25:21];
wire [4:0]rt_if_id=ins_code_op[20:16];
//exmem
wire [4:0]writereg_exmem,rd_exmem_o;
wire memwrite_exmem_o,memread_exmem_o,memtoreg_exmem_o,regwrite_exmem_o;
wire [31:0]aluresult_exmem_o,read_data2_exmem_o;


//alu
wire [31:0]B;
wire [31:0]aluresult;
//memwb
wire [31:0]read_data_mem_wb,read_data_mem_wb_o,aluresult_mem_wb_o;

//not yet completely given wires
wire [31:0]write_data;// from writeback stage
wire regwrite;// from writeback stage
wire [4:0] writereg_mem_wb;//write ref mem_wb

//fwd unit
wire[1:0] ctrl_rs,ctrl_rt;
wire[31:0]  forwarded_rs,forwarded_rt;

//stall unit
wire stall_signal;
wire clk2;
wire alusrc_cu1;
wire regdst_cu1;
wire memwrite_cu1;
wire memread_cu1;
wire memtoreg_cu1;
wire regwrite_cu1;
wire [1:0] aluop_cu1;



assign clk2= clk & stall_signal;

ins_mem insmem(rst,clk,ins_code,stall_signal);
//
if_id   ifid(clk2,ins_code,ins_code_op);
//
reg_mem regmem(rst,write_data,ins_code_op[25:21],ins_code_op[20:16],writereg_mem_wb,regwrite,read_data_1,read_data_2);
//
id_ex idex(clk,read_data_1,read_data_2,read_data_1o,read_data_2o,{16'b0,ins_code_op[15:0]},sign_extend_o,regwrite_cu1,regwrite_idex_o,
                regdst_cu1,regdst_idex_o,alusrc_cu1,alusrc_idex_o,aluop_cu1,aluop_idex_o,memwrite_cu1, memwrite_idex_o,memread_cu1,memread_idex_o,
                memtoreg_cu1,memtoreg_idex_o,ins_code_op[25:21],rs_idex_o,ins_code_op[20:16],rt_idex_o,ins_code_op[15:11],rd_idex_o,ins_code_op[5:0],func_idex_o);
                
// mux for rs and rd to generate write reg
mux mux1(rt_idex_o,rd_idex_o,regdst_idex_o,writereg_exmem);
//
mux41 mux4(read_data_1o,aluresult_exmem_o,write_data,ctrl_rs,forwarded_rs);
//
mux41 mux5(read_data_2o,aluresult_exmem_o,write_data,ctrl_rt,forwarded_rt);
//
mux mux2(forwarded_rt,sign_extend_o,alusrc_idex_o,B);
//
alu  alu_unit(forwarded_rs,B,func_idex_o,aluop_idex_o,aluresult);
//
ex_mem exmem(clk,memwrite_idex_o,memwrite_exmem_o,memread_idex_o,memread_exmem_o,memtoreg_idex_o,memtoreg_exmem_o,
              regwrite_idex_o,regwrite_exmem_o,writereg_exmem,aluresult,aluresult_exmem_o,read_data_2o,read_data2_exmem_o,rd_exmem_o );
              
//
main_mem mainmem(rst,aluresult_exmem_o,read_data2_exmem_o,memread_exmem_o,memwrite_exmem_o,read_data_mem_wb);

//memwb

mem_wb memwb(clk,memtoreg_exmem_o,memtoreg_mem_wb_o,regwrite_exmem_o,regwrite,rd_exmem_o,read_data_mem_wb,read_data_mem_wb_o,
                aluresult_exmem_o,aluresult_mem_wb_o,writereg_mem_wb);
//mux3


mux mux3(aluresult_mem_wb_o,read_data_mem_wb_o,memtoreg_mem_wb_o,write_data);
//
  
           
control_unit cu(ins_code_op[31:26],regdst_cu,regwrite_cu,alusrc_cu,aluop_cu,memread_cu,memwrite_cu,memtoreg_cu);

forward_unit fwd_unit(rs_idex_o,rt_idex_o,rd_exmem_o,writereg_mem_wb,regwrite_exmem_o,regwrite,ctrl_rs,ctrl_rt);
//

stall_unit stallunit(rst,memread_idex_o,rt_idex_o,ins_code_op[25:21],ins_code_op[20:16],stall_signal);



//stall for control signal
mux_cu m_alusrc(1'b0,alusrc_cu,stall_signal,alusrc_cu1);
mux_cu m_regdst(1'b0,regdst_cu,stall_signal,regdst_cu1);
mux_cu m_memwrite(1'b0,memwrite_cu,stall_signal,memwrite_cu1);
mux_cu m_memread(1'b0,memread_cu,stall_signal,memread_cu1);
mux_cu m_memtoreg(1'b1,memtoreg_cu,stall_signal,memtoreg_cu1);
mux_cu m_regwrite(1'b0,regwrite_cu,stall_signal,regwrite_cu1);
mux_aluop m_aluop(2'b0,aluop_cu,stall_signal,aluop_cu1);












endmodule
