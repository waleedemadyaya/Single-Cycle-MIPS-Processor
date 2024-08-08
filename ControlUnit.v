module ControlUnit_MainDec (OP,Jump,MemToReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOP);

input [5:0]OP;
output reg Jump,MemToReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite;
output reg [1:0]ALUOP;

always @ (OP,ALUOP)
begin	
	if (OP== 6'b100011)
	begin
	Jump<=1'b0;
	MemToReg<=1'b1;
	MemWrite<=1'b0;
	Branch<=1'b0;
	ALUSrc<=1'b1;
	RegDst<=1'b0;
	RegWrite<=1'b1;
	ALUOP<=2'b00;
	end
	else if (OP== 6'b101011)
	begin
	Jump<=0;
	MemToReg<=1;
	MemWrite<=1;
	Branch<=0;
	ALUSrc<=1;
	RegDst<=0;
	RegWrite<=0;
	ALUOP<=2'b00;
	end
	else if (OP== 6'b000000)
	begin
	Jump<=0;
	MemToReg<=0;
	MemWrite<=0;
	Branch<=0;
	ALUSrc<=0;
	RegDst<=1;
	RegWrite<=1;
	ALUOP<=2'b10;
	end
	else if (OP== 6'b001000)
	begin
	Jump<=0;
	MemToReg<=0;
	MemWrite<=0;
	Branch<=0;
	ALUSrc<=1;
	RegDst<=0;
	RegWrite<=1;
	ALUOP<=2'b00;
	end
	else if (OP== 6'b000100)
	begin
	Jump<=0;
	MemToReg<=0;
	MemWrite<=0;
	Branch<=1;
	ALUSrc<=0;
	RegDst<=0;
	RegWrite<=0;
	ALUOP<=2'b01;
	end
	else if (OP== 6'b000010)
	begin
	Jump<=1;
	MemToReg<=0;
	MemWrite<=0;
	Branch<=0;
	ALUSrc<=0;
	RegDst<=0;
	RegWrite<=0;
	ALUOP<=2'b00;
	end
	else 
	begin
	Jump<=0;
	MemToReg<=0;
	MemWrite<=0;
	Branch<=0;
	ALUSrc<=0;
	RegDst<=0;
	RegWrite<=0;
	ALUOP<=2'b00;
	end
end

endmodule


