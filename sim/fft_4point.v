module fft_4point(a,c,sel,clk,clear,y);
parameter n=8;
input [n-1:0]a,c;
input clk,clear;
input [1:0]sel;
wire [1:0]sel_1;
output [n-1:0] y;
wire [n-1:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

assign sel_1=~sel;

DeMux1to2 demux1(.a(a),.sel(sel[1]),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel[1]),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w9));
D_FF dff2(.d(w9),.clk(clk),.clear(clear),.q(w3));

DeMux1to2 demux2(.a(w3),.sel(sel_1[1]),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
booth_top ml(.M(w6),.Q(c),.Z(w11));
Mux2to1 mux(.a(w4),.b(w11),.sel(sel_1[1]),.y(w10));
delay point_2fft(.a(w10),.sel(sel[0]),.clk(clk),.clear(clear),.y(y));
endmodule