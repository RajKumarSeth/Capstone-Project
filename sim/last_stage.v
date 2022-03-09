module delay(a,sel,sel_1,clk,clear,y);
input [3:0]a;
input clk,clear,sel,sel_1;
output [3:0] y;
wire [3:0] w1,w2,w3,w4,w5,w6,w7,w8;
//D_FF dff1(.d(a),.clk(clk),.clear(clear),.q(w1));
//butterfly but(.a(w1),.b(a),.y1(y1),.y2(y2));
wire w9;
or or1(w9,sel,sel_1);


DeMux1to2 demux1(.a(a),.sel(sel),.y1(w1),.y2(w2));
Mux2to1 mux1(.a(w1),.b(w5),.sel(w9),.y(w7));
D_FF dff1(.d(w7),.clk(clk),.clear(clear),.q(w3));
DeMux1to2 demux2(.a(w3),.sel(sel_1),.y1(w8),.y2(w6));
butterfly but(.a(w8),.b(w2),.y1(w4),.y2(w5));
//D_FF dff2(.d(w5),.clk(clk),.clear(clear),.q(w6));
Mux2to1 mux(.a(w4),.b(w6),.sel(sel),.y(y));
//or or1(y,w4,w6);
endmodule 