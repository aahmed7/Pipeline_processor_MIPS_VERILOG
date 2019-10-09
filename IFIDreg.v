module IFIDreg(clk,IF_PCaddr,IF_instruction,ID_PCaddr,ID_instruction);
	input clk;
	input [31:0]IF_PCaddr,IF_instruction;
	output reg [31:0]ID_PCaddr,ID_instruction;
	
	always@(posedge clk)
		begin
			ID_PCaddr <= IF_PCaddr;
			ID_instruction <= IF_instruction;
		end
endmodule
