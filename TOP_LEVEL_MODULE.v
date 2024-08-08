module TOP_LEVEL_MODULE (test_val,clk,rst);
input clk,rst;
output [15:0]test_val;

wire Jump,MemToReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite;
wire [5:0]Instr5_0,Instr31_26;
wire [2:0]ALUControl;
wire PCSrc,Zero;
wire [31:0]OutMuxOne,PCout,Result,ReadData,SrcA,SrcB,WrteData,ALUResult,PCBranch,PCJump,SignImm,SignImmShif2;
wire [25:0]Instr25_0;
wire [27:0]Instr25_0Shifted;
wire [31:0]Instr,PC,PC_Dash,PCPlus4;
wire [4:0]Instr25_21,Instr20_16,Instr15_11,WriteReg4_0;
wire [15:0]Instr15_0;
wire [1:0]ALUOP;

assign Instr5_0 = Instr[5:0];
assign Instr31_26 = Instr[31:26];
assign Instr25_0 = Instr[25:0];
assign Instr25_21 = Instr[25:21];
assign Instr20_16 = Instr[20:16];
assign Instr15_11 = Instr[15:11];
assign Instr15_0 = Instr[15:0];
assign PCSrc = Branch&Zero;
ALU ALU1(SrcA,SrcB,ALUControl,ALUResult,Zero);
PCFlipFlop PCFlipFlop1(PC_Dash,PC,clk);
Reset Reset1(PC,rst,PCout);
Add4 Add4_1(PCout,PCPlus4);
SignExtend SignExtend1(Instr15_0,SignImm);
Shifter Shifter1(SignImm,SignImmShif2);
Shifter2 Shifter2_1(Instr25_0,Instr25_0Shifted);
Adder Adder_1(SignImmShif2,PCPlus4,PCBranch);
Concat Concat_1(Instr25_0Shifted,PCPlus4[31:28],PCJump);
MUX221 MUX221_1(PCPlus4,PCBranch,OutMuxOne,PCSrc);
MUX221 MUX221_2(OutMuxOne,PCJump,PC_Dash,Jump);
MUX221 MUX221_3(WrteData,SignImm,SrcB,ALUSrc);
MUX221FourBits MUX221FourBits1(Instr20_16,Instr15_11,WriteReg4_0,RegDst);
IstructionMemory IstructionMemory1(PCout,Instr);
RegesterFile RegesterFile1(Instr25_21,Instr20_16,WriteReg4_0,RegWrite,SrcA,WrteData,Result,clk);
DataMemory DataMemory1(ALUResult,ReadData,WrteData,MemWrite,clk,test_val);
MUX221 MUX221_4(ALUResult,ReadData,Result,MemToReg);
ALUDecoder ALUDecoder1(Instr5_0,ALUControl,ALUOP);
ControlUnit_MainDec ControlUnit_MainDec1(Instr31_26,Jump,MemToReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOP);

endmodule
