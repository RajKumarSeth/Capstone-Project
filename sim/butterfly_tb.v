module butterfly_tb;
reg [3:0] a,b;
wire [3:0] y1,y2;
butterfly bu(.a(a),.b(b),.y1(y1),.y2(y2));
initial 
begin
a=0;b=0;
#10 a=1;b=1;
#10 a=4;b=2;
#10 a=3;b=6;
end
initial $monitor ("Input a=%b,b=%b, Output y1=%b,y2=%b", a,b,y1,y2);
initial #50 $finish;
endmodule 