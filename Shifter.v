module Shifter ( InVal , ShiftedVal);

input [31:0]InVal;
output reg [31:0]ShiftedVal;

always @ (InVal)
ShiftedVal <= InVal<<2;

endmodule
