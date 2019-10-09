module Adder_Subtractor(Result,InA,InB,add_Sub);
	
	input add_Sub;
	input [31:0] InA,InB;
	
	output [31:0] Result;
	reg Result;
	
	wire [31:0] In_int;
	assign In_int = InB^{add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,
								 add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,
								 add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,
								 add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub,add_Sub};
								 
	always @(InA or InB or In_int or add_Sub)
	begin
			Result = InA + In_int + add_Sub ;
	end

endmodule
