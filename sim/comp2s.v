module comp2s(a,c,y);
parameter n=8;
input [n-1:0] a,c;
//wire [3:0] c[0:3];
output [2*n-1:0] y;
//always @(a)
//begin
//if(a[3]==1'b1)
//begin
//assign w=~a;
//assign b=w+1'b1; 
//end
//else 
//assign b=a;
//end
//for(i=0;i<4;i=i+1)
multiplier ml(.d(a),.c(c),.y(y));
endmodule 

