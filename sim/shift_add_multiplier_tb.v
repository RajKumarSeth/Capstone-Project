module shift_add_multiplier_tb;
  wire signed [7:0] p;
  reg signed [3:0] a,b; 
  reg clk,s;
  
  shift_add_multiplier sam(.p(p),.a(a),.b(b),.clk(clk),.s(s));
  
  initial
  begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial
  begin
    a = 6;
    b = 9;
    s = 0;
    #20;
    s = 1;
  end
  
  initial $monitor("Input a=%d, b=%d, clk=%d, s=%d, Output p=%d",a,b,clk,s,p);
  initial #120 $finish;
    
endmodule
  
