`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:19 12/20/2015 
// Design Name: 
// Module Name:    resgister 
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
module Register_File(Port_A, Port_B, Din, Addr_A, Addr_B, Addr_Wr, wr, clk);
	output [31:0] Port_A, Port_B;
	input [31:0] Din;
	input [4:0] Addr_A, Addr_B, Addr_Wr;
	input wr, clk;
	
	//create 32 32-bit register
	reg [31:0]Reg_File[31:0];
	
	//Read output
	assign Port_A = Reg_File[Addr_A];
	assign Port_B = Reg_File[Addr_B];
	//sir ye dekhen, values urr rahi hain 
	
	initial
		begin
			Reg_File[0] = 32'h0;
			Reg_File[1] = 24;
			Reg_File[2] = 16;
			Reg_File[3] = 32'h0;
			Reg_File[4] = 32'h1;
		end
	
	//write input to register	
	always @ (posedge clk)
		begin
			if (wr)
				Reg_File[Addr_Wr] <= Din;
		end
endmodule


