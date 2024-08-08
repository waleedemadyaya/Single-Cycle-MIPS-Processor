
module ALUDecoder (Funct,ALUControl,ALUOPER);

input [5:0]Funct;
input [1:0]ALUOPER;
output reg  [2:0]ALUControl;

always @ (Funct,ALUOPER)
begin 
	if (ALUOPER == 2'b00)
	ALUControl<=3'b010;
	else if (ALUOPER == 2'b01)
	ALUControl<=3'b100;
	else if (ALUOPER == 2'b10)
	begin 
	if (Funct == 6'b100000 )
	ALUControl<=3'b010;
	else if (Funct == 6'b100010 )
	ALUControl<=3'b100;
	else if (Funct == 6'b101010 )
	ALUControl<=3'b110;
	else if (Funct == 6'b011100 )
	ALUControl<=3'b101;
	else
	ALUControl<=3'b010;
	end
	else 
	ALUControl<=3'b010;	
	
end

endmodule 
