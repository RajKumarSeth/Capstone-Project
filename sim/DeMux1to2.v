module DeMux1to2(a,sel,y1,y2);
parameter n=8;
input [n-1:0] a;
input sel;
output reg [n-1:0] y1,y2;
always @(sel or a)
begin 
if(sel==0)
begin 
y1<=a;
end 
else 
begin 
y2<=a;
end
end 
endmodule 