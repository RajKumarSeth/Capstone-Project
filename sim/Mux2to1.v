module Mux2to1(a,b,sel,y);
parameter n=16;
input [n-1:0] a,b;
input sel;
output reg [n-1:0] y;
always @(sel or a or b)
begin 
if(sel==0)
begin 
y<=a;
end 
else 
begin 
y<=b;
end
end 
endmodule 