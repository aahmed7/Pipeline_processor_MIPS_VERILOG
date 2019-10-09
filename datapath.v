module datapath(clk,rst);
	input clk,rst;
	
	//wires
	wire [31:0]PC_addr,PCtoIM,PC4,ExtPC,Reg_A,Reg_B,Data32ToReg;
	wire [31:0]Instruction,ALUResult,OP_B,sl2num;
	wire [4:0]RegwrAddr;
	wire [2:0]ALUCtrl;
	//Pipeline Reg Wires
	wire [31:0]IDPCaddr,IDinstruction,EX_PCaddr,MEM_ALUres,MEM_WrData,WB_DataAddr,WB_DataRead;
	wire [31:0]SE_Fwd,ID_regA,ID_regB,SE_num_avail,EX_regA,EX_regB,braddr,MEM_PCaddr;
	wire [4:0]ID_Rd,ID_Rt,EX_Rd,EX_Rt,EX_RegWr,MEM_RegWr,WB_RegWr;
	wire [1:0]ID_WB,EX_WB,MEM_WB,WB_WB;
	wire[2:0]ID_M,EX_M,MEM_M;
	wire [3:0]ID_EX,EX_EX;
	wire MEM_zf;
	//control signals
	wire PCSrc,RegWrite,zf,RegDst,ALUSrc,Branch,MemRead,MemWrite,MemtoReg;
	wire [1:0]ALU_OP;
	
	//IF Stage
	REGISTER PC(PC_addr,PCtoIM,clk);
	mux2x1_32bit PCsrcMux(PC4,MEM_PCaddr,PCSrc,PC_addr);
	Instruction_Memory IM(PCtoIM[7:0],Instruction);
	ADD PCcalc(PCtoIM,4,PC4);
	IFIDreg IFID(clk,PC4,Instruction,IDPCaddr,IDinstruction);
	
	//Control Unit
	Control CU(IDinstruction[5:0],Alu_Op, RegWrite, MemWrite, RegDst, Branch, MemRead, ALUSrc, MemtoReg);
	assign ID_WB = {RegWrite,MemtoReg};
	assign ID_M = {Branch,MemRead,MemWrite};
	assign ID_EX = {RegDst,Alu_Op,ALUSrc};
	
	//ID Stage
	REGISTER_FILE RF(Reg_A, Reg_B, Data32ToReg, IDinstruction[10:6], IDinstruction[15:11], WB_RegWr, WB_WB[1], clk);
	signextend SE16(IDinstruction[15:0],SE_Fwd);
	IDEXreg IDEX(clk,IDPCaddr,ID_regA,ID_regB,SE_Fwd,ID_Rd,ID_Rt,ID_WB,ID_M,ID_EX,
						EX_PCaddr,EX_regA,EX_regB,SE_num_avail,EX_Rd,EX_Rt,EX_WB,EX_M,EX_EX);

	//EX Stage
	Mux_2x1_5bit RegDstMux(EX_Rd, EX_Rt, EX_EX[3],EX_RegWr);
	ALUControl ALUsub(EX_EX[2:1],SE_num_avail[5:0],ALUCtrl);
	ALU Main_ALU(EX_regA,OP_B,ALUCtrl,ALUResult,zf);
	mux2x1_32bit OP_BMux(EX_regB,SE_num_avail,EX_EX[0],OP_B);
	SL2 Sl2(SE_num_avail,sl2num);
	ADD BrCalc(EX_PCaddr,sl2num,braddr);
	EXMEMreg(clk, braddr,zf,ALUResult,EX_regB,EX_RegWr,EX_WB,EX_M,
						MEM_PCaddr,MEM_zf,MEM_ALUres,MEM_WrData,MEM_RegWr,MEM_WB,MEM_M);

	//MEM stage
	Data_Memory DM(MEM_DataRead,MEM_WrData,MEM_ALUres,MEM_M[0],MEM_M[1],clk);
	MEMWBreg(clk,MEM_ALUres,MEM_DataRead,MEM_RegWr,MEM_WB,
						WB_DataAddr,WB_DataRead,WB_RegWr,WB_WB);
	and(MEM_M[2],MEM_zf,PCSrc);
	
	//WB stage
	mux2x1_32bit DataToRFMux(WB_DataAddr,WB_DataRead,WB_WB[0],Data32ToReg);
endmodule
