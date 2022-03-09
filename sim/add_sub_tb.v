module add_sub_tb;
reg [3:0] a,b;
reg c;
wire [3:0]sum;
wire carry;
add_sub as(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
reg [8:0]i;
initial 
begin 
 for(i=0;i<512;i=i+1)
begin
a=i[8:5];
b=i[4:1];
c=i[0];
#10;
end
end
initial $monitor ("Input a=%b,b=%b,c=%c,Output sum=%b,carry=%b", a,b,c,sum,carry);
initial #10000 $finish;
endmodule 
