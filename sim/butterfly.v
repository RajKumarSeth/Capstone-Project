module butterfly(a,b,y1,y2);
parameter n=16;
input [n-1:0]a,b;
output [n-1:0]y1,y2;
wire [n/2-1:0] a_r,a_im,b_r,b_im,y1_r,y1_im,y2_r,y2_im;

assign a_r=a[n-1:n/2];
assign a_im=a[n/2-1:0];
assign b_r=b[n-1:n/2];
assign b_im=b[n/2-1:0];

add_sub add1(.a(a_r),.b(b_r),.c(0),.sum(y1_r),.carry());
add_sub add2(.a(a_im),.b(b_im),.c(0),.sum(y1_im),.carry());
add_sub sub1(.a(a_r),.b(b_r),.c(1),.sum(y2_r),.carry());
add_sub sub2(.a(a_im),.b(b_im),.c(1),.sum(y2_im),.carry());

assign y1={y1_r,y1_im};
assign y2={y2_r,y2_im};
endmodule
