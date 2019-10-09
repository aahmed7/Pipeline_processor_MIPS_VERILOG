`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:11 05/12/2016 
// Design Name: 
// Module Name:    SL2 
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
module SL2(input [31:0]A, output [31:0]Out);
	assign Out = {A[29:0],1'b0,1'b0};

endmodule
