`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:04:57 10/28/2017 
// Design Name: 
// Module Name:    CPU__DATAPATH 
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
module CPU__DATAPATH(Z_bus,CC,clk,rst,Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd,fsel,IR11);
	input clk,rst;
	input Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd;
	input [2:0] fsel;
	output CC;
	output [15:8] IR11;
	output Z_bus;
	wire [15:0] Z_bus,PC,MDR,REG,SP,IR1,BUFF,Me_Md,C1,A_bus,PC1,SP1,MDR1,REG1,Label1,BUFF1;
	wire Cout,cin,sin,vin,zin;
	wire[4:0] MAR;
	assign IR11 = IR1[15:8];
	REGISTER_pc Program_counter(Z_bus,clk,PC1,Lpc);
	REGISTER_mar Memory_address_register(Z_bus[4:0],clk,MAR,Lmar);
	REGISTER_sp Stack_Pointer(Z_bus,clk,SP1,Lsp);
	REGISTER_special Memory_Data_Register(Z_bus,Me_Md,clk,rst,MDR1,Lmdr,rd);
	REGISTER Buffer(A_bus,clk,BUFF1,Lbuff);
	REGISTER_ir Instruction_register(Z_bus,clk,IR1,Lir);

	MEMORY Memory(MAR,rd,wr,clk,MDR1,Me_Md);
	ALU alu(A_bus,BUFF,Z_bus,fsel,Cout);
	STATUS_DETECTOR Det(Z_bus,Cout,cin,sin,vin,zin);
	STATUS_SELECTION ssel(vin, cin, zin, sin, IR1[15:12],Lalu, CC, clk,rst);
	REGISTER_BANK reg_ban(Z_bus,clk,Treg,Lreg,IR1[7:5],REG1);
	and_op_special  _pc(PC1,Tpc,PC);
	and_op_special  _sp(SP1,Tsp,SP);
	and_op_special  _mdr(MDR1,Tmdr,MDR);
	and_op_special  _c1(16'b1,T1,C1);
	and_op_special  _reg(REG1,Treg,REG);
	and_op_special  _buff(BUFF1,Tbuff,BUFF);
	and_op_special  _label({4'b0000,IR1[11:0]},Tlabel,Label1);
	or a_bus0(A_bus[0],REG[0],C1[0],MDR[0],SP[0],PC[0],Label1[0]);
	or a_bus1(A_bus[1],REG[1],C1[1],MDR[1],SP[1],PC[1],Label1[1]);
	or a_bus2(A_bus[2],REG[2],C1[2],MDR[2],SP[2],PC[2],Label1[2]);
	or a_bus3(A_bus[3],REG[3],C1[3],MDR[3],SP[3],PC[3],Label1[3]);
	or a_bus4(A_bus[4],REG[4],C1[4],MDR[4],SP[4],PC[4],Label1[4]);
	or a_bus5(A_bus[5],REG[5],C1[5],MDR[5],SP[5],PC[5],Label1[5]);
	or a_bus6(A_bus[6],REG[6],C1[6],MDR[6],SP[6],PC[6],Label1[6]);
	or a_bus7(A_bus[7],REG[7],C1[7],MDR[7],SP[7],PC[7],Label1[7]);
	or a_bus8(A_bus[8],REG[8],C1[8],MDR[8],SP[8],PC[8],Label1[8]);
	or a_bus9(A_bus[9],REG[9],C1[9],MDR[9],SP[9],PC[9],Label1[9]);
	or a_bus10(A_bus[10],REG[10],C1[10],MDR[10],SP[10],PC[10],Label1[10]);
	or a_bus11(A_bus[11],REG[11],C1[11],MDR[11],SP[11],PC[11],Label1[11]);
	or a_bus12(A_bus[12],REG[12],C1[12],MDR[12],SP[12],PC[12],Label1[12]);
	or a_bus13(A_bus[13],REG[13],C1[13],MDR[13],SP[13],PC[13],Label1[13]);
	or a_bus14(A_bus[14],REG[14],C1[14],MDR[14],SP[14],PC[14],Label1[14]);
	or a_bus15(A_bus[15],REG[15],C1[15],MDR[15],SP[15],PC[15],Label1[15]);

endmodule

module REGISTER_special(in,in1,clk,rst,out,ld,ld1);
	input[15:0] in,in1;
	input clk,ld,rst,ld1;
	output[15:0] out;
	reg[15:0] out;
	always@(negedge clk or posedge rst)
	begin
		if(rst) 
			out=16'b0;
		else 
		begin
			if(ld)
				out=in;
			else
			begin
				if(ld1)
					out=in1;
				else
				begin
					out=out;
				end
			end
		end
		//$display("MDR= %b",out);
	end
endmodule

module REGISTER_mar(in,clk,out,ld);
	input[4:0] in;
	input clk,ld;
	output[4:0] out;
	reg[4:0] out;
	initial begin
		out=5'b0;
	end
	always@(negedge clk)
	begin
		if(ld)
				out=in;
		else
				out=out;
		//$display("MAR = %b",out);
	end
endmodule

module REGISTER_pc(in,clk,out,ld);
	input[15:0] in;
	input clk,ld;
	output[15:0] out;
	reg[15:0] out;
	initial begin
		out=21; //21 is the first instruction
	end
	always@(negedge clk)
	begin
		if(ld)
				out=in;
		else
				out=out;
				
		$display("PC = %b",out);
	end
endmodule

module REGISTER_sp(in,clk,out,ld);
	input[15:0] in;
	input clk,ld;
	output[15:0] out;
	reg[15:0] out;
	initial begin
		out=0; //2 is the postion of sp
	end
	always@(negedge clk)
	begin
		if(ld)
				out=in;
		else
				out=out;
	end
endmodule

module REGISTER_ir(in,clk,out,ld);
	input[15:0] in;
	input clk,ld;
	output[15:0] out;
	reg[15:0] out;
	initial begin
		out=16'b0;
	end
	always@(negedge clk)
	begin
		if(ld)
				out=in;
		else
				out=out;
		$display("IR = %b",out);
	end
endmodule