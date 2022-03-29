module fft_8point_tb;
parameter n=8; 
reg [n-1:0]a,c,d;
reg clk,clear;
wire [n-1:0] y;
fft_8point fft(.a(a),.c(c),.d(d),.clk(clk),.clear(clear),.y(y));
initial 
begin 
clk=0;
forever #10 clk=~clk;
end
initial 
begin 
clear =1; 
clear=0;
a=4;
#20 a=1;
#20 a=2;
#20 a=-3;
#20 a=1;
#20 a=-2;
#20 a=0;
#20 a=3;
#20 a=8'bx;
c=1; d=-2;
#20 c=-1; d=1;
#20 c=-2; d=4'bx;
#20 c=1;
#20 d=-1;
#20 d=2;  
#40 clear=1; 
end
initial $monitor("Input a=%d,c=%d,clk=%d,clear=%d,Output y=%d",a,c,clk,clear,y);
initial #400 $finish;
endmodule 
