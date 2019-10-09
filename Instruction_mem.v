`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:01 12/16/2015 
// Design Name: 
// Module Name:    Instruction_mem 
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
module Instruction_Memory(I_Addr, Data_Out);
	input [7:0] I_Addr;
	output reg [31:0] Data_Out;
	always @ (I_Addr)
	begin
		case (I_Addr)
			// A = r1, B = r2, r4 = 1, r0 = 0, done = r3;
			8'h00: Data_Out = 32'h00000000;  //8C630000; // 1. lw r3,r3
			8'h04: Data_Out = 32'h00000000; //8C210000; // 2. lw r1,r1
			8'h08: Data_Out = 32'h00000000; //8C420000; // 3. lw r2,r2
			//label:gcd
			8'h0C: Data_Out = 32'h0022282B; // 4. sltu r5,r2,r3
			8'h10: Data_Out = 32'h10A40010; // 5. beq r5,r4,swapAB
			//label:stage2
			8'h14: Data_Out = 32'h1402001C; // 6. bne r0,r2,subAB 
			//label:stage3
			8'h18: Data_Out = 32'h10020020; // 7. beq r0,r2,done
			8'h1C: Data_Out = 32'h0800000C; // 8. j gcd
			//label:swapAB
			8'h20: Data_Out = 32'h00220820; // 9. add r1,r1,r2
			8'h24: Data_Out = 32'h00221023; // 10. sub r2,r1,r2
			8'h28: Data_Out = 32'h00220823; // 11. sub r1,r1,r2
			8'h2C: Data_Out = 32'h08000014; // 12. j stage2
			//label:subAB
			8'h30: Data_Out = 32'h00220823; // 13. sub r1,r1,r2
			8'h34: Data_Out = 32'h08000018; // 14. j stage3
			//label:done
			8'h38: Data_Out = 32'h00413020; // 15. slti r6,r5, 0x0161
			default: Data_Out = 32'h00000000;
		endcase
	end
endmodule
