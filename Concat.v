module Concat (Instr27_0Shifted,PCPlus4_31_28,PCJump);

input [27:0]Instr27_0Shifted;
input [3:0]PCPlus4_31_28;
output reg [31:0]PCJump;

always @ (Instr27_0Shifted,PCPlus4_31_28)
begin
PCJump[27:0]<=Instr27_0Shifted[27:0];
PCJump[31:28]<=PCPlus4_31_28[3:0];
end
endmodule
