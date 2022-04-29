module delay(a,sel,clk,clear,y_r,y_im);
parameter n=16;
input [n-1:0]a;
input clk,clear,sel;
wire sel_1;
output [n/2-1:0] y_r,y_im;
wire [n-1:0] a,y,w1,w2,w3,w4,w5,w6,w7,w8;
wire [n/2-1:0] temp_r,temp_im;
//assign a={a_r,a_im};
assign sel_1=~sel;

DeMux1to2 demux1(.a(a),.sel(sel),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(sel),.y(w7));

D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w3));

DeMux1to2 demux2(.a(w3),.sel(sel_1),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
Mux2to1 mux(.a(w4),.b(w6),.sel(sel_1),.y(y));

assign temp_r=y[n-1:n/2];
assign temp_im=y[n/2-1:0];

quantize q(.w_r(temp_r),.w_im(temp_im),.clear(clear),.z_r(y_r),.z_im(y_im));
endmodule 