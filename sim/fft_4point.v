module fft_4point(a,c,sel,clk,clear,y_r,y_im);
parameter n=16;
input [n-1:0]a,c;
input clk,clear;
input [1:0]sel;
wire [1:0]sel_1;
output [n/2-1:0] y_r,y_im;
wire [n-1:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;

//assign a={a_r,a_im};
//assign c={c_r,c_im};
assign sel_1=~sel;

DeMux1to2 demux1(.a(a),.sel(sel[1]),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel[1]),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w9));
D_FF dff2(.d(w9),.clk(clk),.clear(clear),.q(w3));

DeMux1to2 demux2(.a(w3),.sel(sel_1[1]),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
booth_multiplier_top ml(.a(w6),.b(c),.y(w11));
quantize q(.w(w11),.clear(clear),.z(w12));
Mux2to1 mux(.a(w4),.b(w12),.sel(sel_1[1]),.y(w10));
delay point_2fft(.a(w10),.sel(sel[0]),.clk(clk),.clear(clear),.y_r(y_r),.y_im(y_im));
endmodule
