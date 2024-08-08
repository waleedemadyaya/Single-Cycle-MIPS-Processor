module Shifter2 ( InVal , ShiftedVal);

input [25:0]InVal;
output reg [27:0]ShiftedVal;

always @ (InVal)
ShiftedVal <= InVal<<2;

endmodule
