module DataMemory (A,RD,WD,WE,clk,TestValue);

input [31:0]A,WD;
input clk,WE;
output reg [31:0]RD;
output reg [15:0]TestValue;
reg [31:0]MemRam[0:255];



always @ (clk,A,WE,WD,MemRam)
begin
RD<=MemRam[{A[9:2]}];
TestValue <= MemRam[0][15:0];
end

always @ (posedge clk)
begin 
if (WE==1)
MemRam[{A[9:2]}]<=WD;
else
MemRam[{A[9:2]}]<=MemRam[{A[9:2]}];
end 

endmodule 
