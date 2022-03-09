module d_ff_tb;
reg [3:0]d;
reg clk,clear;
wire [3:0]q;
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
#100; clear=0; d<=1;
#100 d<=2;
#100 d<=3;
end 
initial $monitor("Input d=%b,clk=%b,clear=%b,Output q=%b",d,clk,clear,q);
initial #400 $finish;
endmodule 