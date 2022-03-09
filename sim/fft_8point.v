module fft_8point(a,sel,sel_1,clk,clear,y);
input [3:0]a;
input clk,clear,sel,sel_1;
output [3:0] y;
wire [3:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;

DeMux1to2 demux1(.a(a),.sel(sel),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w9));
D_FF dff2(.d(w9),.clk(clk),.clear(clear),.q(w11));
D_FF dff3(.d(w11),.clk(clk),.clear(clear),.q(w12));
D_FF dff4(.d(w12),.clk(clk),.clear(clear),.q(w3));

DeMux1to2 demux2(.a(w3),.sel(sel_1),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
Mux2to1 mux(.a(w4),.b(w6),.sel(sel_1),.y(y));
//delay point_2fft(.a(w10),.sel(clk),.sel_1(sel_1),.clk(clk),.clear(clear),.y(y));
endmodule
