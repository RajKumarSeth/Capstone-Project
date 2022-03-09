module multiplier_tb;
reg [3:0] d,c;
wire [7:0]y;
multiplier mu(.d(d),.c(c),.y(y));
reg [7:0]i;
initial 
begin 
for(i=0;i<256;i=i+1)
begin
d=i[7:4];
c=i[3:0];
#10;
end
//a=4;
//c=-3;
end
initial $monitor ("Input d=%b,c=%b,Output y=%b", d,c,y);
initial #10000 $finish;
endmodule 