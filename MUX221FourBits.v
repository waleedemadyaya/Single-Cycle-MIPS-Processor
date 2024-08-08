module MUX221FourBits (IN1,IN2,OUT,Sel);
input [4:0]IN1;
input [4:0]IN2;
input Sel;
output reg [4:0]OUT;

always @ (IN1,IN2,Sel)
begin 
if (Sel == 0)
OUT<=IN1;
else if (Sel == 1)
OUT <= IN2;
else 
OUT <=5'hx;
end

endmodule 
