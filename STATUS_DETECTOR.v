`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:58:36 10/28/2017 
// Design Name: 
// Module Name:    STATUS_DETECTOR 
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
module STATUS_DETECTOR(in,cin,cout,sout,vout,zout);
	input in,cin;
	wire[15:0] in;
	output cout,sout,vout,zout;
	wire cout,sout,vout,zout;
	xor x1(vout,in[15],cout);
	assign cout = cin;
	nand n1(zout,in[15],in[14],in[13],in[12],in[11],in[10],in[9],in[8],in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]);
	assign sout = in[15];
endmodule
