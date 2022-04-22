module fft_16point(a_r,a_im,b_r,b_im,c_r,c_im,d_r,d_im,clk,clear,y_r,y_im);
parameter n=16;
input [n/2-1:0]a_r,a_im,b_r,b_im,c_r,c_im,d_r,d_im;
input clk,clear;
output [n/2-1:0] y_r,y_im;
wire [n-1:0] a,b,c,d,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17;
wire [3:0] sel,sel_1;

up_counter co1(.clk(clk),.reset(clear),.count(sel));
assign sel_1=~sel;
assign a={a_r,a_im};
assign b={b_r,b_im};
assign c={c_r,c_im};
assign d={d_r,d_im};

DeMux1to2 demux1(.a(a),.sel(sel[3]),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel[3]),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w9));
D_FF dff2(.d(w9),.clk(clk),.clear(clear),.q(w11));
D_FF dff3(.d(w11),.clk(clk),.clear(clear),.q(w12));
D_FF dff4(.d(w12),.clk(clk),.clear(clear),.q(w14));
D_FF dff5(.d(w14),.clk(clk),.clear(clear),.q(w15));
D_FF dff6(.d(w15),.clk(clk),.clear(clear),.q(w16));
D_FF dff7(.d(w16),.clk(clk),.clear(clear),.q(w17));
D_FF dff8(.d(w17),.clk(clk),.clear(clear),.q(w3));


DeMux1to2 demux2(.a(w3),.sel(sel_1[3]),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
booth_top ml(.M(w6),.Q(b),.Z(w13));
Mux2to1 mux(.a(w4),.b(w13),.sel(sel_1[3]),.y(w10));
fft_8point point_8fft(.a(w10),.c(d),.d(d),.sel(sel[2:0]),.clk(clk),.clear(clear),.y_r(y_r),.y_im(y_im));
endmodule
