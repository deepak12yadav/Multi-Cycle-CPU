`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:22:43 10/28/2017
// Design Name:   CPU
// Module Name:   C:/Users/DEEPAK/Downloads/assignment_3/CPU_TestBench.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_TestBench;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] A;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst(rst), 
		.A(A)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		$dumpfile("dump.vcd");
		$dumpvars;
		// Wait 100 ns for global reset to finish
		#100;
      #1000 $finish; 
		// Add stimulus here
	end
	always #1 clk=~clk;
	
      
endmodule

