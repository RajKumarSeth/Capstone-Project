module DeMux1to2_tb;
reg [3:0]a;
reg sel;
wire [3:0] y1,y2;
DeMux1to2 de(.a(a),.sel(sel),.y1(y1),.y2(y2));
initial 
begin 
a=10;
sel=0;
#10 a=3;
sel=1;
end 
initial $monitor("Input a=%b, sel=%b Output y1=%b,y2=%b",a,sel,y1,y2);
initial #400 $finish;
endmodule  