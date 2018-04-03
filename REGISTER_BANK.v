`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:31:36 10/28/2017 
// Design Name: 
// Module Name:    REGISTER_BANK 
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
module REGISTER_BANK(in,clk,Treg,Lreg,sel,out);
	input[15:0] in;
	input [2:0] sel;
	input clk,Treg,Lreg;
	output[15:0] out;
	wire[7:0] reg_wr; 
	wire[7:0] reg_rd;
	wire[15:0] r0,r1,r2,r3,r4,r5,r6,r7,r00,r11,r22,r33,r44,r55,r66,r77;
	MUX_8_1_REG_BANK rd(sel,reg_rd,Treg);
	DECODER_3_8_REG_BANK ee(sel,reg_wr,Lreg);

	REGISTER load0(in,clk,r00,reg_wr[0]);
	REGISTER load1(in,clk,r11,reg_wr[1]);
	REGISTER load2(in,clk,r22,reg_wr[2]);
	REGISTER load3(in,clk,r33,reg_wr[3]);
	REGISTER load4(in,clk,r44,reg_wr[4]);
	REGISTER load5(in,clk,r55,reg_wr[5]);
	REGISTER load6(in,clk,r66,reg_wr[6]);
	REGISTER load7(in,clk,r77,reg_wr[7]);
	
	and_op_special and_s0(r00,reg_rd[0],r0);
	and_op_special and_s1(r11,reg_rd[1],r1);
	and_op_special and_s2(r22,reg_rd[2],r2);
	and_op_special and_s3(r33,reg_rd[3],r3);
	and_op_special and_s4(r44,reg_rd[4],r4);
	and_op_special and_s5(r55,reg_rd[5],r5);
	and_op_special and_s6(r66,reg_rd[6],r6);
	and_op_special and_s7(r77,reg_rd[7],r7);
	
	or OR0(out[0],r0[0],r1[0],r2[0],r3[0],r4[0],r5[0],r6[0],r7[0]);
	or OR1(out[1],r0[1],r1[1],r2[1],r3[1],r4[1],r5[1],r6[1],r7[1]);
	or OR21(out[2],r0[2],r1[2],r2[2],r3[2],r4[2],r5[2],r6[2],r7[2]);
	or OR31(out[3],r0[3],r1[3],r2[3],r3[3],r4[3],r5[3],r6[3],r7[3]);
	or OR41(out[4],r0[4],r1[4],r2[4],r3[4],r4[4],r5[4],r6[4],r7[4]);
	or OR51(out[5],r0[5],r1[5],r2[5],r3[5],r4[5],r5[5],r6[5],r7[5]);
	or OR6(out[6],r0[6],r1[6],r2[6],r3[6],r4[6],r5[6],r6[6],r7[6]);
	or OR7(out[7],r0[7],r1[7],r2[7],r3[7],r4[7],r5[7],r6[7],r7[7]);
	or OR8(out[8],r0[8],r1[8],r2[8],r3[8],r4[8],r5[8],r6[8],r7[8]);
	or OR9(out[9],r0[9],r1[9],r2[9],r3[9],r4[9],r5[9],r6[9],r7[9]);
	or OR10(out[10],r0[10],r1[10],r2[10],r3[10],r4[10],r5[10],r6[10],r7[10]);
	or OR11(out[11],r0[11],r1[11],r2[11],r3[11],r4[11],r5[11],r6[11],r7[11]);
	or OR12(out[12],r0[12],r1[12],r2[12],r3[12],r4[12],r5[12],r6[12],r7[12]);
	or OR13(out[13],r0[13],r1[13],r2[13],r3[13],r4[13],r5[13],r6[13],r7[13]);
	or OR14(out[14],r0[14],r1[14],r2[14],r3[14],r4[14],r5[14],r6[14],r7[14]);
	or OR15(out[15],r0[15],r1[15],r2[15],r3[15],r4[15],r5[15],r6[15],r7[15]);

endmodule

