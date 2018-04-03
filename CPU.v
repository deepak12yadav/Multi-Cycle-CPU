`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:03 10/27/2017 
// Design Name: 
// Module Name:    CPU 
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
module CPU(clk,rst,A);
	input clk,rst;
	wire CC,Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd;
	wire [15:8] IR1;
	wire[2:0] fsel;
	output [15:0] A;
	CPU_controller  cpucontroller(CC,clk,rst,IR1[15:8],Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd,fsel);
	CPU__DATAPATH cpudatapath(A,CC,clk,rst,Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd,fsel ,IR1);
endmodule
