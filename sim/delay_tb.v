module delay_tb;
reg [3:0]a;
reg clk,clear,sel;
wire [3:0] y;
delay del(.a(a),.sel(sel),.clk(clk),.clear(clear),.y(y));
initial 
begin 
clk=0;
forever #10 clk=~clk;
end
initial 
begin 
sel=0;
forever #20 sel=~sel;
end
initial 
begin 
clear =1; 
clear=0;
a=7;
#20 a=10;
#20 a=3; 
#20 a=-4;
#20 a=5;
#20 a=-2;
#20 a=1;
#20 a=0;
//#20 a=0;
#40 clear=1;
end
initial $monitor("Input a=%d,sel=%d,clk=%d,clear=%d,Output y=%d",a,sel,clk,clear,y);
initial #400 $finish;
endmodule  