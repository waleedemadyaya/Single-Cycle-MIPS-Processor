module MUX221 (IN1,IN2,OUT,Sel);
input [31:0]IN1;
input [31:0]IN2;
input Sel;
output reg [31:0]OUT;

always @ (IN1,IN2,Sel)
begin 
if (Sel == 0)
OUT<=IN1;
else if (Sel == 1)
OUT <= IN2;
else 
OUT <=32'hxxxxxxxx;
end

endmodule 
