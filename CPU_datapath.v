`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:53 10/23/2017 
// Design Name: 
// Module Name:    CPU_datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPU_datapath(C,V,S,Z,clk,rst,Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd,fsel ,r0,r1,r2,r3,r4,r5,r6,r7,rom0,rom1,rom2,rom3,rom4,rom5,rom6,rom7,rom8,rom9,rom10,rom11,rom12,rom13,rom14,rom15,rom16,rom17,rom18,rom19,IR1);
	input clk,rst;
	input Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd;
	input[15:0] rom0,rom1,rom2,rom3,rom4,rom5,rom6,rom7,rom8,rom9,rom10,rom11,rom12,rom13,rom14,rom15,rom16,rom17,rom18,rom19;
	input [2:0] fsel;
	output[15:0] r0,r1,r2,r3,r4,r5,r6,r7;
	output C,V,S,Z;
	output [15:0] IR1;
	wire [15:0] Z_bus,PC,MAR,MDR,REG,SP,IR1,BUFF,Me_Md,C1,A_bus,PC1,SP1,MDR1,REG1,Label1,BUFF1;
	REGISTER Program_counter(Z_bus,clk,rst,PC1,Lpc);
	REGISTER Memory_address_register(Z_bus,clk,rst,MAR,Lmar);
	REGISTER Stack_Pointer(Z_bus,clk,rst,SP1,Lsp);
	REGISTER_special Memory_Data_Register(Z_bus,Me_Md,clk,rst,MDR1,Lmdr,rd);
	REGISTER Buffer(A_bus,clk,rst,BUFF1,Lbuff);
	REGISTER Instruction_register(Z_bus,clk,rst,IR1,Lir);
	//REGISTER_C1 Constant1(C11);
	MEMORY Memory(MAR,rd,wr,clk,MDR,Me_Md,rst,rom0,rom1,rom2,rom3,rom4,rom5,rom6,rom7,rom8,rom9,rom10,rom11,rom12,rom13,rom14,rom15,rom16,rom17,rom18,rom19);
	ALU alu(A_bus,BUFF,Z_bus,fsel,C,V,S,Z,Lalu);
	REGISTER_BANK reg_ban(Z_bus,clk,rst,r0,r1,r2,r3,r4,r5,r6,r7,Treg,Lreg,IR1[7:5],REG1);
	and_op_special  _pc(PC1,Tpc,PC);
	and_op_special  _sp(SP1,Tsp,SP);
	and_op_special  _mdr(MDR1,Tmdr,MDR);
	and_op_special  _c1(16'b1,T1,C1);
	and_op_special  _reg(REG1,Treg,REG);
	and_op_special  _buff(BUFF1,Tbuff,BUFF);
	and_op_special  _label({4'b0000,IR1[11:0]},Tlabel,Label1);
	or a_bus(A_bus,REG,C1,MDR,SP,PC,Label1);

endmodule



//************************Register Module************************************


/*module REGISTER_C1(out);
	output[15:0] out;
	reg[15:0] out;
	initial begin
	out=16'b1;
	end
endmodule*/



//************************Register Module************************************

//****************Register Bank***************************************


