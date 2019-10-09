module EXMEMreg(clk, EX_PCaddr,EX_zf,EX_ALUres,EX_WrData,EX_RegWr,EX_WB,EX_M,
						MEM_PCaddr,MEM_zf,MEM_ALUres,MEM_WrData,MEM_RegWr,MEM_WB,MEM_M);
	input clk,EX_zf;
	input [31:0]EX_PCaddr,EX_ALUres,EX_WrData;
	input [4:0]EX_RegWr;
	input [1:0]EX_WB;
	input [2:0]EX_M;
	output reg [31:0]MEM_PCaddr,MEM_ALUres,MEM_WrData;
	output reg [4:0]MEM_RegWr;
	output reg [1:0]MEM_WB;
	output reg [2:0]MEM_M;
	output reg MEM_zf;
	
	always@(posedge clk)
	begin
		MEM_PCaddr <= EX_PCaddr;
		MEM_zf <= EX_zf;
		MEM_ALUres <= EX_ALUres;
		MEM_WrData <= EX_WrData;
		MEM_RegWr <= EX_RegWr;
		MEM_WB <= EX_WB;
		MEM_M <= EX_M;
	end
endmodule
