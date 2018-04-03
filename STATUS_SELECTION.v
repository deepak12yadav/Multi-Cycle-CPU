`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:01:10 10/28/2017 
// Design Name: 
// Module Name:    STATUS_SELECTION 
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

module DFF( D, clk, reset, Q, ld);
    input D, clk, reset, ld;
	 output reg Q;
	 always @(posedge clk or posedge reset)
	 begin 
		if(reset)
			Q <= 0;
		else if(ld)
			Q <= D;
		else 
			Q <= Q;
		end
endmodule

module STATUS_SELECTION( vin, Cin, Zin, Sin, IR, ld, CC, clk,reset);
	input vin, Cin, Zin, Sin, IR, ld, clk, reset;
	output CC;
	reg CC;
	wire[3:0] IR;
	wire s0,s1,s3,s5,s7;
	assign s0 = 1'b1;
	DFF V(vin, clk, reset, s1, ld);
	DFF C(Cin, clk, reset, s3,ld);
	DFF Z(Zin, clk, reset, s5, ld);
	DFF S1(Sin, clk, reset, s7, ld);

	always@(IR[0] or IR[1] or IR[2] or IR[3] or s1 or s0 or s3 or s5 or s7)
	begin
		case(IR)
			4'b1001:CC<=~s7;
			4'b0001:CC<=s0;
			4'b0010:CC<=s3;
			4'b0011:CC<=~s3;
			4'b0100:CC<=s5;
			4'b0101:CC<=~s5;
			4'b0110:CC<=s1;
			4'b0111:CC<=~s1;
			4'b1000:CC<=s7;
			default: CC<=0;
		endcase	
	end
endmodule

