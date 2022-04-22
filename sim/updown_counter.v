module up_counter(clk,reset,count);
parameter stage=4;
input clk,reset;
output [stage-1:0] count;
reg [stage-1:0] count = -1;  
always @(negedge(clk))
begin
if(reset == 1)
count <= -1;
else
if(count == 4'b1111)
count <= 0;
else
count <= count + 1;
end    
endmodule
