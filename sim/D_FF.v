module D_FF(d,clk,clear,q);
input [3:0]d;
input clk,clear;
output reg [3:0]q;
always @(negedge clk)
begin
if(clear==1)
q<=4'bx;
else
q<=d;
end
endmodule 