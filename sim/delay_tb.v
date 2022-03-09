module delay_tb;
reg [3:0]a;
reg clk,clear,sel,sel_1;
wire [3:0] y;
delay del(.a(a),.sel(sel),.sel_1(sel_1),.clk(clk),.clear(clear),.y(y));
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
sel_1=0;
#20
forever #20 sel_1=~sel_1;
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
initial $monitor("Input a=%d,sel=%d,sel_1=%d,clk=%d,clear=%d,Output y=%d",a,sel,sel_1,clk,clear,y);
initial #400 $finish;
endmodule  