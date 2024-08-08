module PC ( PC , Jump , Clk , PCSrc , Instr15_0 , Instr25_0);

input Jump , PCSrc , Clk ;
input [15:0]Instr15_0;
input [25:0]Instr25_0;
output reg [31:0]PC;
reg [31:0]SigImm;
reg [31:0]PCPlus4;
reg [31:0]PCBranch;
reg [27:0]Instr25_0Shifted;
reg [31:0]PCJump;
reg [31:0]PCDash;

always @ (posedge Clk)
begin 
PCPlus4 <= PC + 4;
SigImm[15:0] <= Instr15_0;
SigImm[31:16] <= {16{Instr15_0[15]}};
SigImm<=SigImm<<2;
PCBranch<=SigImm+PCPlus4;
Instr25_0Shifted<=Instr25_0<<2;
PCJump[27:0]<=Instr25_0Shifted[27:0];
PCJump[31:28]<=PCPlus4[31:28];

if (Jump==1)
	PCDash<=PCJump;
else if(Jump==0)
	begin
	if (PCSrc==0)
		PCDash<=PCPlus4;
	else if (PCSrc==1)
		PCDash<=PCBranch;
	else 
		PCDash<=8'hxxxxxxxx;
	end
else
	PCDash<=8'hxxxxxxxx;

PC<=PCDash;

end 


endmodule
