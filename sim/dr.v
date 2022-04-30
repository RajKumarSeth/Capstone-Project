module dr(d,s0,s1,clk,clear,a);
parameter n=8;
input clk,clear;
input [n-1:0]d;
input s0,s1;
output [n-1:0]a;
wire [n-1:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

Mux2to1 mux1(.a(w2),.b(d),.sel(s1),.y(w0));
D_FF dff1(.d(w0),.clk(clk),.clear(clear),.q(w1));
D_FF dff2(.d(w1),.clk(clk),.clear(clear),.q(w2));
Mux2to1 mux2(.a(d),.b(w2),.sel(s1),.y(w3));

Mux2to1 mux3(.a(w11),.b(w3),.sel(s0),.y(w4));
D_FF dff3(.d(w4),.clk(clk),.clear(clear),.q(w5));
D_FF dff4(.d(w5),.clk(clk),.clear(clear),.q(w6));
D_FF dff5(.d(w6),.clk(clk),.clear(clear),.q(w7));
D_FF dff6(.d(w7),.clk(clk),.clear(clear),.q(w8));
D_FF dff7(.d(w8),.clk(clk),.clear(clear),.q(w9));
D_FF dff8(.d(w9),.clk(clk),.clear(clear),.q(w10));
D_FF dff9(.d(w10),.clk(clk),.clear(clear),.q(w11));
Mux2to1 mux4(.a(w3),.b(w11),.sel(s0),.y(a));
endmodule
