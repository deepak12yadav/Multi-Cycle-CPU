`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:46:17 10/28/2017 
// Design Name: 
// Module Name:    MUX_8_1_REG_BANK 
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
module MUX_8_1_REG_BANK(sel,out,Treg);
	input [2:0] sel;
	input Treg;
	output[7:0] out;
	reg[7:0] out;
	always@(sel or Treg)
	begin
		if(Treg)
		begin
			casex(sel)
				3'b011:out=8'b00001000;
				3'b100:out=8'b00010000;
				3'b101:out=8'b00100000;
				3'b110:out=8'b01000000;
				3'b111:out=8'b10000000;
				3'b000:out=8'b00000001;
				3'b001:out=8'b00000010;
				3'b010:out=8'b00000100;
			endcase
		end
		else out=8'b00000000;
	end
endmodule
