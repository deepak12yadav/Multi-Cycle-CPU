`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:43 10/22/2017 
// Design Name: 
// Module Name:    CPU_controller 
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
module CPU_controller(CC,clk,rst,IR,Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd,fsel);
	input CC,clk,rst;
	input [15:8]IR;
	//input [3:0] state;
	//output [3:0] state;
	output Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd;
	reg [2:0] count;
	output [2:0] fsel;
	reg [3:0] state;
	reg Lmar,Lir,Lbuff,Lpc,Lsp,Lreg,Lmdr,Lalu,Tpc,Tmdr,T1,Tbuff,Tsp,Treg,Tlabel,wr,rd;
	reg [2:0] fsel;
	
	initial begin
		count=3'b000;
		state=3'b001;
		fsel=3'b000;
	end
	

	always@(posedge clk or posedge rst)begin
		Lmar=1'b0;
		Lir=1'b0;
		Lbuff=1'b0;
		Lpc=1'b0;
		Lsp=1'b0;
		Lreg=1'b0;
		Lmdr=1'b0;
		Lalu=1'b0;
		Tpc=1'b0;
		Tmdr=1'b0;
		T1=1'b0;
		Tbuff=1'b0;
		Tsp=1'b0;
		Treg=1'b0;
		Tlabel=1'b0;
		wr=1'b0;
		rd=1'b0;
		$display("state = %h,count= %h",state,count);
		//$display("IR = %b",IR);
		if(rst)
		begin
			count=3'b000;
			state=3'b001;
			fsel=3'b000;
		end
		else
		begin		
		casex(state)
			1:
			begin
				casex(count)	
					0:			// MAR <- PC
					begin
						Tpc=1;
						Lmar=1;
						//Lalu=1;
						fsel=3'b110;
						count=1;
					end
					1:			//MDR <- <MAR>
					begin
						rd=1;
						count=2;
					end
					2:			//IT <- MDR
					begin
						Tmdr=1;
						Lir=1;
						//Lalu=1;
						fsel=3'b110;
						count=3;
					end
					3:			//buff <- 1
					begin
						T1=1;
						Lbuff=1;
						count=4;
					end
					default:	//PC <- Pc+buff
					begin
						Tbuff=1;
						Lalu=1;
						Tpc=1;
						fsel=3'b001;
						Lpc=1;
						count=0;
						if(IR[15:12] == 4'b1111)
							begin
								if(IR[11:10]==2'b00)
									state=2;
								else
									state=3;
							end
						else
							begin
								if(IR[15:12]==4'b1010)
									state=7;
								else
									begin
										if(IR[15:12]==4'b0001)
											state=9;
										else
										begin
											if(CC)
												state=9;
											else
												state=1;
										end
									end
							end							
					end
				endcase
			end

			2:
			begin
				Treg=1;	//MDR <- R
				Lmdr=1;
				//Lalu=1;
				fsel=3'b110;
				state=8;
			end

			3:
			begin
				casex(count)	
					0:			// MAR <- SP
					begin
						Tsp=1;
						Lmar=1;
						//Lalu=1;
						fsel=3'b110;
						count=1;
					end
					1:			//MDR <- <MAR>
					begin
						rd=1;
						count=2;
					end
					2:			//buff <- 1
					begin
						T1=1;
						Lbuff=1;
						count=3;
					end
					default:	//SP <- SP+buff
					begin
						Tbuff=1;
						Lalu=1;
						Tsp=1;
						fsel=3'b001;
						Lsp=1;
						count=0;
						casex(IR[11:10])
							2'b01:
							begin
								state=4;
							end
							2'b11:
							begin
								state=5;
							end
							default:
							begin
								state=6;
							end
						endcase
					end
				endcase
			end

			4:	//R <- MDR
			begin
				Lreg=1;
				Tmdr=1;
				//Lalu=1;
				fsel=3'b110;
				state=1;
			end

			5:	//PC <- MDR
			begin
				Lpc=1;
				Tmdr=1;
				//Lalu=1;
				fsel=3'b110;
				state=1;
			end

			6:
			begin
				casex(count)	
					0:			// buff <- R
					begin
						Treg=1;
						Lbuff=1;
						count=1;
					end
					default:			//R <- M[SP] op R
					begin
						//Treg=1;
						Tmdr=1;
						Lreg=1;
						Tbuff=1;
						count=0;
						state=1;
						Lalu=1;

						casex(IR[9:8])
							0:
							begin
								fsel=3'b001;
							end

							1:
							begin
								fsel=3'b011;
							end

							2:
							begin
								fsel=3'b100;
							end

							default:
							begin
								fsel=3'b101;
							end
						endcase
					end
				endcase
			end

			7:	//MDR <- PC
			begin
				Tpc=1;
				Lmdr=1;
				//Lalu=1;
				fsel=3'b110;
				state=8;
			end

			8:
			begin
				casex(count)	
					0:			//buff <- 1
					begin
						T1=1;
						Lbuff=1;
						count=1;
					end
					1:			//SP <- SP-buff
					begin
						Tbuff=1;
						Lalu=1;
						Tsp=1;
						fsel=3'b010;
						Lsp=1;
						count=2;
					end
					2:			// MAR <- SP
					begin
						Tsp=1;
						Lmar=1;
						//Lalu=1;
						fsel=3'b110;
						count=3;
					end
					default:		//<MAR> <- MDR
					begin
						wr=1;
						count=0;
						casex(IR[15:12])
							4'b1010:
							begin
								state=9;
							end
							default:
							begin
								state=1;
							end
						endcase
					end
				endcase
			end

			9:
			begin
				casex(count)	
					0:			// buff <- label
					begin
						Tlabel=1;
						Lbuff=1;
						count=1;
					end
					default:			//PC <- PC + buff
					begin
						fsel=3'b001;
						Tpc=1;
						Lalu=1;
						Lpc=1;
						Tbuff=1;
						count=0;
						state=1;
					end
				endcase
			end
		endcase
	end
	end
endmodule
