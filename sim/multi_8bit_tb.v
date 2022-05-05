module multi_8bit_tb;
parameter n=16; 
reg [n-1:0] a,b;
wire [2*n-1:0] y;
multi_8bit_top mul(.y(y),.a(a),.b(b));
initial 
begin 
a=16'hff02;
b=16'h06fe;
end
initial $monitor("Input a=%d,b=%d Output y=%d",a,b,y);
initial #10000 $finish;
endmodule 
