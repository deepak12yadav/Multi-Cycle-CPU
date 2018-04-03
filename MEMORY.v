`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:08:03 10/28/2017 
// Design Name: 
// Module Name:    MEMORY 
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
module MEMORY(address,rd,wr,clk,in,out);
	input[4:0] address;
	input rd,wr,clk;
	input[15:0] in;
	output[15:0] out;
	reg[15:0] memory[31:0];
	reg[15:0] out;
	integer i;
	initial begin
			for(i=0;i<32;i=i+1)
			begin
				memory[i]=16'b0;
			end
			memory[0]=3;
			memory[1]=1;
			memory[2]=3;
			memory[21]=16'b1111010000000000;
			memory[22]=16'b1111100000000000;
			memory[23]=16'b1111100100100000;
			memory[24]=16'b1111000000100000;
			memory[25]=16'b1111100000000000;
			memory[26]=16'b1111000000000000;
	end
	
	always@(rd or wr )
	begin
		out =16'b0;
		if(rd)out=memory[address];
		else if(wr)
		begin
				memory[address]=in[15:0];
				//$display("memory[%h]=%h",address,memory[address]);
		end
	end
	always@(negedge clk )
	begin
		$display("memory[%h] = %d",0,memory[0]);
		$display("memory[%h] = %d",1,memory[1]);
		$display("memory[%h] = %d",2,memory[2]);
		/*$display("memory[%h] = %h",3,memory[3]);
		$display("memory[%h] = %h",4,memory[4]);
		$display("memory[%h] = %h",5,memory[5]);
		$display("memory[%h] = %h",6,memory[6]);
		$display("memory[%h] = %h",7,memory[7]);
		$display("memory[%h] = %h",8,memory[8]);
		$display("memory[%h] = %h",9,memory[9]);
		$display("memory[%h] = %h",10,memory[10]);
		$display("memory[%h] = %h",11,memory[11]);
		$display("memory[%h] = %h",12,memory[12]);
		$display("memory[%h] = %h",13,memory[13]);
		$display("memory[%h] = %h",14,memory[14]);
		$display("memory[%h] = %h",15,memory[15]);
		$display("memory[%h] = %h",16,memory[16]);
		$display("memory[%h] = %h",17,memory[17]);
		$display("memory[%h] = %h",18,memory[18]);
		$display("memory[%h] = %h",19,memory[19]);
		$display("memory[%h] = %h",20,memory[20]);
		$display("memory[%h] = %h",21,memory[21]);
		$display("memory[%h] = %h",22,memory[22]);
		$display("memory[%h] = %h",23,memory[23]);
		$display("memory[%h] = %h",24,memory[24]);
		$display("memory[%h] = %h",25,memory[25]);
		$display("memory[%h] = %h",26,memory[26]);
		$display("memory[%h] = %h",27,memory[27]);
		$display("memory[%h] = %h",28,memory[28]);
		$display("memory[%h] = %h",29,memory[29]);
		$display("memory[%h] = %h",30,memory[30]);*/
	end
endmodule
