module up_counter(clk,reset,count);
input clk,reset;
output [2:0] count;
reg [2:0] count = -1;  
always @(negedge(clk))
begin
if(reset == 1)
count <= -1;
else
if(count == 3'b111)
count <= 0;
else
count <= count + 1;
end    
endmodule
