module IDEXreg(clk,ID_PCaddr,ID_regA,ID_regB,ID_SE,ID_Rd,ID_Rt,ID_WB,ID_M,ID_EX,
						EX_PCaddr,EX_regA,EX_regB,EX_SE,EX_Rd,EX_Rt,EX_WB,EX_M,EX_EX);
		
		input clk;
		input [31:0]ID_PCaddr,ID_regA,ID_regB,ID_SE;
		input [4:0]ID_Rt,ID_Rd;
		input [1:0]ID_WB;
		input [2:0]ID_M;
		input [3:0]ID_EX;
		output reg[31:0]EX_PCaddr,EX_regA,EX_regB,EX_SE;
		output reg[4:0]EX_Rt,EX_Rd;
		output reg[1:0]EX_WB;
		output reg[2:0]EX_M;
		output reg[3:0]EX_EX;
		
		always@(posedge clk)
		begin
			EX_PCaddr <= ID_PCaddr;
			EX_regA <= ID_regA;
			EX_regB <= ID_regB;
			EX_SE <= ID_SE;
			EX_Rt <= ID_Rt;
			EX_Rd <= ID_Rd;
			EX_WB	<= ID_WB;
 			EX_M	<= ID_M;
			EX_EX	<= ID_EX;
		end


endmodule
