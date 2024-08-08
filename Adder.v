module Adder
 (ShifVal , ValPlus4 , PCBranch);
input [31:0]ShifVal ;
input [31:0] ValPlus4 ;
output reg [31:0] PCBranch;

always @ (ShifVal , ValPlus4)
PCBranch<=ShifVal + ValPlus4;

endmodule
