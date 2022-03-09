module butterfly(a,b,y1,y2);
input [3:0]a,b;
output [3:0]y1,y2;
add_sub add(.a(a),.b(b),.c(0),.sum(y1),.carry());
add_sub sub(.a(a),.b(b),.c(1),.sum(y2),.carry());
endmodule
