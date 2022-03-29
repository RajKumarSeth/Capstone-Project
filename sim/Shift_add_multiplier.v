module shift_add_multiplier(p,a,b,clk,s);
  
  parameter INIT = 1'b0;
  parameter START = 1'b1;
  
  output reg signed [7:0]p;
  input signed [3:0]a,b;
  input clk,s; 
  reg signed [3:0]x; 
  reg signed [7:0]y; 
  reg [3:0]count;
  
  always @(negedge clk)
  begin
  case(s)
    
    INIT:
    begin
      x=a;
      y[3:0]=b;
      y[7:4]=4'b0000;
      count = 3'b000; 
    end
    
    START:
    begin
      if(count<4'b0100)
        begin
          if(y[0])
            y[7:4]=y[7:4]+x;
            
            y={1'b0,y[7:1]};
            count = count + 1;
        end
    end
    
  endcase
  p=y;
  end
  
endmodule