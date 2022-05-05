module data_reordering_tb;
parameter n=8; 
reg [n-1:0]d;
reg [3:0] i;
reg clk,clear,s0,s1;
wire [n-1:0] a;
dr da_re(.d(d),.s0(s0),.s1(s1),.clk(clk),.clear(clear),.a(a));
initial 
begin 
clk=0;
forever #10 clk=~clk;
end

initial 
begin 
i=-1;
forever 
begin 
i=i+1;
s0= ~i[3]+i[0];
s1= ~i[2]+i[1];
if(i==4'b1111)
i=-1;
end
end 

initial 
begin 
clear =1; 
clear=0;
d=1;
#20 d=2;
#20 d=5;
#20 d=6;
#20 d=8;
#20 d=10;
#20 d=12;
#20 d=13;
#20 d=12;
#20 d=4;
#20 d=3;
#20 d=2;
#20 d=1;
#20 d=0;
#20 d=6;
#20 d=9; 
end
initial $monitor("Input d=%d,s0=%d,s1=%d,clk=%d,clear=%d, Output a=%d",d,s0,s1,clk,clear,a);
initial #400 $finish;
endmodule 
