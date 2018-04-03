`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:22:19 10/28/2017 
// Design Name: 
// Module Name:    and_op_special 
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
module and_op_special(X,Y,out);
	input[15:0] X;
	input Y;
	output[15:0] out;
	and and_fn0(out[0],X[0],Y);
	and and_fn1(out[1],X[1],Y);
	and and_fn2(out[2],X[2],Y);
	and and_fn3(out[3],X[3],Y);
	and and_fn4(out[4],X[4],Y);
	and and_fn5(out[5],X[5],Y);
	and and_fn6(out[6],X[6],Y);
	and and_fn7(out[7],X[7],Y);
	and and_fn8(out[8],X[8],Y);
	and and_fn9(out[9],X[9],Y);
	and and_fn10(out[10],X[10],Y);
	and and_fn11(out[11],X[11],Y);
	and and_fn12(out[12],X[12],Y);
	and and_fn13(out[13],X[13],Y);
	and and_fn14(out[14],X[14],Y);
	and and_fn15(out[15],X[15],Y);
endmodule
