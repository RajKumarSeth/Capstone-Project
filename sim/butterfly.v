module butterfly(a,b,y1,y2);
parameter n=8;
input [n-1:0]a,b;
output [n-1:0]y1,y2;
add_sub add(.a(a),.b(b),.c(0),.sum(y1),.carry());
add_sub sub(.a(a),.b(b),.c(1),.sum(y2),.carry());
endmodule
