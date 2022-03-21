module comp_tb;
reg [3:0] a,c;
wire [7:0] y;
comp2s co(.a(a),.c(c),.y(y));
initial 
begin

a=4; 	  c=1;
#10 a=-5; c=2;
#10 a=6;  c=3;
#10 a=-7; c=4;
end
initial $monitor ("Input a=%d,c=%d, Output y=%d", a,c,y);
initial #100 $finish;
endmodule 
