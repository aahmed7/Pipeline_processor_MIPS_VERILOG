module REGISTER(In,Out,clk);

	input clk;
	input [31:0] In;
	
	output reg [31:0] Out=0;

	always @(negedge clk)
	begin
		Out = In;
	end
	
endmodule
