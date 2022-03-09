module commp_tb;
reg [3:0] a;
wire [3:0] b;
comp2s co(.a(a),.b(b));
initial 
begin
a=4;
#10 a=-5;
end
initial $monitor ("Input a=%b,Output b=%b", a,b);
initial #100 $finish;
endmodule 
