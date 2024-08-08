module RegesterFile (A1,A2,A3,WE3,RD1,RD2,WD3,clk);

input WE3,clk;
input [4:0]A1,A2,A3;
input [31:0]WD3;
output reg [31:0] RD1,RD2;
reg [31:0]Registers[0:31];
integer i;

initial 
begin
i<=32;
for (i=31;i>=0;i=i-1)
Registers[i]<=0;
end 

always @ (posedge clk)
begin
if (WE3 == 1'b1)
Registers[A3]<=WD3;
else
Registers[A3]<=Registers[A3];
end

always @ (A1,A2,posedge clk)
begin
RD1<=Registers[A1];
RD2<=Registers[A2];
end

endmodule
