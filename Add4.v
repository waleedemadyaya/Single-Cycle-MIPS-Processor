module Add4 (PCOUT,PCOUTPlus4);

input [31:0]PCOUT;
output reg [31:0]PCOUTPlus4;
always @ ( PCOUT )
PCOUTPlus4 <= PCOUT+3'b100; 

endmodule
