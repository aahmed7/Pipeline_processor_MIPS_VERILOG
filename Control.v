`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:30:41 05/19/2016 
// Design Name: 
// Module Name:    Control 
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
module Control(Opcode,zf,Alu_Op, RegWrite, MemWrite, RegDst, RegDst, MemRead, ALUSrc, MemtoReg, PCSrc);
	input [5:0] Opcode;	
	input zf;
	output [2:0] Alu_Op;
	output RegWrite, MemWrite, RegDst, Branch, MemRead, ALUSrc, PCSrc;
	output [1:0]MemtoReg;
	
	reg [8:0] Control_Signal;
	
	assign RegDst  = Control_Signal[8] ;
	assign Alu_Op  = Control_Signal[7:6];
	assign ALUSrc  = Control_Signal[5] ;
	assign Branch  = Control_Signal[4] ;
	assign MemRead  = Control_Signal[3] ;
	assign MemWrite  = Control_Signal[2] ;
	assign RegWrite  = Control_Signal[1] ;
	assign MemtoReg  = Control_Signal[0] ;	
	
	always @ (Opcode or func)
		begin
			casex({Opcode, zf})
			//output : regdst, alu_op, alusrc, branch, memread, memwrite, regwrite, memtoreg
				//R_format
				13'b000000_x: Control_Signal = 9'b110000010;  //add
				//I_format
				13'b101011_x: Control_Signal = 9'bx0010010x;	//sw
				13'b100011_x: Control_Signal = 9'b000101011;	//lw
				13'b000100_1: Control_Signal = 9'bx0101000x;	//beq
				default : Control_Signal = 9'b110000010;
		endcase
	end
endmodule
