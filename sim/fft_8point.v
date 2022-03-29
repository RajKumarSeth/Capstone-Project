module fft_8point(a,c,d,clk,clear,y);
parameter n=8;
input [n-1:0]a,c,d;
input clk,clear;
output [n-1:0] y;
wire [n-1:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;
wire [2:0] sel,sel_1;

up_counter co1(.clk(clk),.reset(clear),.count(sel));
assign sel_1=~sel;

DeMux1to2 demux1(.a(a),.sel(sel[2]),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel[2]),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w9));
D_FF dff2(.d(w9),.clk(clk),.clear(clear),.q(w11));
D_FF dff3(.d(w11),.clk(clk),.clear(clear),.q(w12));
D_FF dff4(.d(w12),.clk(clk),.clear(clear),.q(w3));

DeMux1to2 demux2(.a(w3),.sel(sel_1[2]),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
multiplier ml(.d(w6),.c(c),.y(w13));
Mux2to1 mux(.a(w4),.b(w13),.sel(sel_1[2]),.y(w10));
fft_4point point_4fft(.a(w10),.c(d),.sel(sel[1:0]),.clk(clk),.clear(clear),.y(y));
endmodule
