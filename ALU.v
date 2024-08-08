module ALU ( SrcA , SrcB , ALUcontrol , ALUresult , Zero );

input  [31:0]SrcA;
input [31:0]SrcB;
input [2:0]ALUcontrol;
output reg [31:0]ALUresult;
output reg Zero;

always @ (SrcA,SrcB,ALUcontrol)
begin
case (ALUcontrol)
3'b000: begin 
		      ALUresult = SrcA & SrcB;
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
3'b001: begin 
		      ALUresult = SrcA | SrcB;
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
3'b010:  begin 
		      ALUresult = SrcA + SrcB;
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
3'b100: begin 
		      ALUresult = SrcA - SrcB;
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
3'b101: begin 
		      ALUresult = SrcA * SrcB;
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
3'b110: begin
				if ( SrcA < SrcB )
					begin
						ALUresult <= 32'b 1;
					end
				else
				    begin ALUresult <= 32'b 0; end
				if ( ALUresult==32'b00000000000000000000000000000000 )
					begin
						Zero <= 1'b1;
					end
				else
				    begin Zero <= 1'b0; end
			end
			
default: ALUresult <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;

endcase
end

endmodule 
