module MEMWBreg(clk,MEM_DataAddr,MEM_DataRead,MEM_RegWr,MEM_WB,
						WB_DataAddr,WB_DataRead,WB_RegWr,WB_WB);
	input clk;
	input [31:0]MEM_DataAddr,MEM_DataRead;
	input [4:0]MEM_RegWr;
	input [1:0]MEM_WB;
	output reg [31:0]WB_DataAddr,WB_DataRead;
	output reg [4:0]WB_RegWr;
	output reg [1:0]WB_WB;	

	always@(posedge clk)
	begin
		WB_DataAddr <= MEM_DataAddr;
		WB_DataRead <= MEM_DataRead;
		WB_RegWr <= MEM_RegWr;
		WB_WB <= MEM_WB;
	end
endmodule
