module SignExtend (Instr15_0,SigImm);
input [15:0]Instr15_0;
output reg [31:0]SigImm;

always @ (Instr15_0)
begin
SigImm[15:0] <= Instr15_0;
SigImm[31:16] <= {16{Instr15_0[15]}};

end
endmodule