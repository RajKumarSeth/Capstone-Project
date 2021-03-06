module d_ff_tb;
parameter n=8;
reg [n-1:0]d;
reg clk,clear;
wire [n-1:0]q;
D_FF d_ff(.d(d),.clk(clk),.clear(clear),.q(q));

initial 
begin 
clk=0;
forever #10 clk=~clk;
end
initial 
begin 
clear =1;
d<=0;
#100; clear=0; d<=1.1;
#100 d<=2.003;
#100 d<=3.45;
end 
initial $monitor("Input d=%b,clk=%b,clear=%b,Output q=%b",d,clk,clear,q);
initial #400 $finish;
endmodule 