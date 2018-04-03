`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:23:14 10/22/2017
// Design Name:   CPU_controller
// Module Name:   C:/Users/DEEPAK/Downloads/assignment_3/CPU_controller_testbench.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_controller_testbench;

	// Inputs
	reg C;
	reg V;
	reg S;
	reg Z;
	reg clk;
	reg rst;
	reg [15:0] IR;
	reg [3:0] state;

	// Outputs
	wire [3:0] nextstate;
	wire Lmar;
	wire Lir;
	wire Lbuff;
	wire Lpc;
	wire Lsp;
	wire Lreg;
	wire Lmdr;
	wire Tpc;
	wire Tmar;
	wire Tmdr;
	wire T1;
	wire Tbuff;
	wire Tsp;
	wire Treg;
	wire Tlabel;
	wire Tir;
	wire wr;
	wire rd;
	wire [2:0] count;
	wire [2:0] fsel;

	// Instantiate the Unit Under Test (UUT)
	CPU_controller uut (
		.C(C), 
		.V(V), 
		.S(S), 
		.Z(Z), 
		.clk(clk), 
		.rst(rst), 
		.IR(IR), 
		.state(state), 
		.nextstate(nextstate), 
		.Lmar(Lmar), 
		.Lir(Lir), 
		.Lbuff(Lbuff), 
		.Lpc(Lpc), 
		.Lsp(Lsp), 
		.Lreg(Lreg), 
		.Lmdr(Lmdr), 
		.Tpc(Tpc), 
		.Tmar(Tmar), 
		.Tmdr(Tmdr), 
		.T1(T1), 
		.Tbuff(Tbuff), 
		.Tsp(Tsp), 
		.Treg(Treg), 
		.Tlabel(Tlabel), 
		.Tir(Tir), 
		.wr(wr), 
		.rd(rd), 
		.count(count), 
		.fsel(fsel)
	);

	initial begin
		// Initialize Inputs
		C = 0;
		V = 0;
		S = 0;
		Z = 0;
		clk = 0;
		rst = 0;
		IR = 0;
		state = 1;

		// Wait 100 ns for global reset to finish
		$dumpfile("dump.vcd");
		$dumpvars;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	
		IR=16'b1111010000000000;
      #1000 $finish;
      
      
	end
	always #1 clk=~clk;
	always@(posedge clk)state=nextstate;
      
endmodule
