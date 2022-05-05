module multi_8bit_top(a,b,y);
parameter n=16;
input [n-1:0]a,b;
output [n-1:0]y;
wire [n/2-1:0] a_r,a_im,b_r,b_im;
wire [n-1:0] y1_r,y1_im,y2_r,y2_im,y_r,y_im;

assign a_r=a[n-1:n/2];
assign a_im=a[n/2-1:0];
assign b_r=b[n-1:n/2];
assign b_im=b[n/2-1:0];

multi_8bit bo1(.d(a_r),.e(b_r),.y(y1_r));
multi_8bit bo2(.d(a_im),.e(b_im),.y(y2_r));
multi_8bit bo3(.d(a_r),.e(b_im),.y(y1_im));
multi_8bit bo4(.d(a_im),.e(b_r),.y(y2_im));

assign y_r=y1_r-y2_r;//add_sub sub(.a(y1_r),.b(y2_r),.c(1),.sum(y_r),.carry());
assign y_im=y1_im+y2_im;//add_sub add(.a(y1_im),.b(y2_im),.c(0),.sum(y_im),.carry());

assign y={y_r[n/2-1:0],y_im[n/2-1:0]};
endmodule
