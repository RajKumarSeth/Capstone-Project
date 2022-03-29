module comp2s(a,c,y);
parameter n=8;
input [n-1:0] a,c;
output [2*n-1:0] y;
multiplier ml(.d(a),.c(c),.y(y));
endmodule 

