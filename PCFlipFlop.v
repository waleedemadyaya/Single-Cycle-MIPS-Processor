module PCFlipFlop(PC_Dash,PC,Clk);

input [31:0]PC_Dash ;
input Clk;
output reg [31:0]PC;

always@(posedge Clk)
begin
PC<=PC_Dash;
end


endmodule 
