
module Mux2to1_tb;
reg [3:0] a,b;
reg sel;
wire [3:0] y;
Mux2to1 de(.a(a),.b(b),.sel(sel),.y(y));
initial 
begin 
a=10; b=3;
sel=0;
#10 sel=1;
end 
initial $monitor("Input a=%b,b=%b,sel=%b Output y=%b",a,b,sel,y);
initial #400 $finish;
endmodule  