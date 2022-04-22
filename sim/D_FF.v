module D_FF(d,clk,clear,q);
parameter n=16;
input [n-1:0]d;
input clk,clear;
output reg [n-1:0]q;
always @(negedge clk)
begin
if(clear==1)
q<=16'bx;
else
q<=d;
end
endmodule 