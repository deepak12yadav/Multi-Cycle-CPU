`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:06:29 10/28/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(X,Y,Z,fsel,Cout);
	input[15:0] X,Y;
	input[2:0]fsel;
	output[15:0] Z;
	output Cout;
	reg Cout;
	reg[15:0] Z;
	integer i;
	//reg c;
	always @(X or Y or fsel)
	begin
		//c=0;
		Cout = 0;
		if(fsel == 3'b000)
			begin
			Z=0;  
			end
		else if(fsel == 3'b001)
			begin 
			Z =X+Y; 
			for (i = 0; i < 15; i = i + 1)
			begin
				Cout = (X[i]&Y[i]) | ((X[i]^Y[i]) & Cout);      
			end
			//Cout = c; 
			end
		else if(fsel == 3'b010)
			begin 
			Z=X-Y;
			end
		else if(fsel == 3'b011)
			begin
			Z=-X;
			$display("Z = %d",Z);
			$display("X = %d",X);
			end
		else if(fsel == 3'b100)
			begin 
			Z = X^Y;
			end
		else if(fsel == 3'b101)
			begin 
			Z=~X;
			end
		else if(fsel == 3'b110)
			begin 
			Z=X;
			end
		else
			begin
			Z=0;
			end
	end
endmodule