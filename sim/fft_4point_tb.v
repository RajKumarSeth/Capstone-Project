module fft_4point_tb;
reg [3:0]a;
reg clk,clear;
reg [1:0]sel,sel_1;
wire [3:0] y;
fft_4point fft(.a(a),.sel(sel),.sel_1(sel_1),.clk(clk),.clear(clear),.y(y));
initial 
begin 
clk=0;
forever #10 clk=~clk;
end
initial 
begin 
//sel=0;
forever 
begin
sel=0; #20
sel=1; #20
sel=2; #20
sel=3; #20;

//#40 sel=~sel;
end
end
initial 
begin 
//sel_1=0;
//#40;
forever 
begin
sel_1=3; #20
sel_1=2; #20
sel_1=1; #20
sel_1=0; #20;
//sel_1=3; #20
//sel_1=2; #20;

//#40 sel_1=~sel_1;
end
end
initial 
begin 
clear =1; 
clear=0; 
a=5;
#20 a=3;
#20 a=2;
#20 a=7;
#20 a=3;
#20 a=-1;
#20 a=2;
#20 a=-1;
#20 a=0;
#60 clear=1;
end
initial $monitor("Input a=%d,sel=%d,sel_1=%d,clk=%d,clear=%d,Output y=%d",a,sel,sel_1,clk,clear,y);
initial #400 $finish;
endmodule 