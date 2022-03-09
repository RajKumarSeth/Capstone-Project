module delay_tb;
reg [3:0]a;
reg clk,clear,sel,sel_1;
wire [3:0] y;
delay del(.a(a),.sel(sel),.sel_1(sel_1),.clk(clk),.clear(clear),.y(y));
initial 
begin 
clk=0;
forever #10 clk=~clk;
end
initial 
begin 
clear =1; 
clear=0;
sel=0; sel_1=0; a=4;
#10 sel=1; a=1;
#10 sel=0; sel_1=1;
#10 sel=1;
end
initial $monitor("Input a=%d,sel=%d,sel_1=%d,clk=%d,clear=%d,Output y=%d",a,sel,sel_1,clk,clear,y);
initial #400 $finish;
endmodule  
