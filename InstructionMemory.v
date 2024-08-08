module IstructionMemory (Addr,Instr);

input [31:0]Addr;
output reg [31:0]Instr;
reg [31:0]Mem[0:255];

initial 
begin
Mem[0] <= 32'h00008020;
Mem[1] <=32'h20100078; // change the least two significant decimals with the number
Mem[2] <=32'h00008820;
Mem[3] <=32'h201100B4;
Mem[4] <=32'h00009020;
Mem[5] <=32'h12110006;
Mem[6] <=32'h0211482A;
Mem[7] <=32'h11200002;
Mem[8] <=32'h02308822;
Mem[9] <=32'h08000005;
Mem[10] <=32'h02118022;
Mem[11] <=32'h08000005;
Mem[12] <=32'h00109020;
Mem[13] <=32'hAC120000;
end

always @ (Addr)
begin 
Instr <= Mem[{Addr[9:2]}];
end    

endmodule
