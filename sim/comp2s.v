module comp2s(a,b);
input [3:0] a;
output reg [3:0] b;
reg [3:0] w;
always @(a)
begin
if(a[3]==1'b1)
begin
assign w=~a;
assign b=w+1'b1; 
end
else 
assign b=a;
end 
endmodule 

