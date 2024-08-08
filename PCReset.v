module Reset(PC,Reset,PCOUT);

input [31:0]PC;
input Reset;
output reg [31:0]PCOUT;

always@(Reset,PC)
begin
if (Reset == 0)
PCOUT<=0;
else if (Reset == 1)
PCOUT<=PC;
else
PCOUT<=32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
end


endmodule 
