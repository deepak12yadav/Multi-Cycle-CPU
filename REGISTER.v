`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:10:31 10/28/2017 
// Design Name: 
// Module Name:    REGISTER 
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
module REGISTER(in,clk,out,ld);
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
		
	end
endmodule

