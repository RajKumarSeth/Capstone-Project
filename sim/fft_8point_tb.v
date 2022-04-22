module fft_8point_tb;
parameter n=8; 
reg [n-1:0] a_r,a_im,c_r,c_im,d_r,d_im;
reg clk,clear;
wire [n-1:0] y_r,y_im;
fft_8point fft(.a_r(a_r),.a_im(0),.c_r(c_r),.c_im(c_im),.d_r(d_r),.d_im(d_im),.clk(clk),.clear(clear),.y_r(y_r),.y_im(y_im));

initial 
begin 
clk=0;
forever #10 clk=~clk;
end

initial 
begin 
clear =1; 
clear=0;
a_r=4; //a_im=0;
#20 a_r=1; //a_im=0;
#20 a_r=2; //a_im=0;
#20 a_r=-3; //a_im=0;
#20 a_r=1; //a_im=0;
#20 a_r=-2; //a_im=0;
#20 a_r=0; //a_im=0;
#20 a_r=3; //a_im=0;
#20 a_r=8'bx; a_im=8'bx;
c_r=1; c_im=0; d_r=1; d_im=0;
#20 c_r=1; c_im=-1; d_r=0; d_im=-1;
#20 c_r=0; c_im=-1; d_r=8'bx; d_im=8'bx;
#20 c_r=-1; c_im=-1;
#20 c_r=8'bx; c_im=8'bx; d_r=1; d_im=0;
#20 d_r=0; d_im=-1;
#20 d_r=8'bx; d_im=8'bx;
#20 clear=1; 
end
initial $monitor("Input a_r=%d,a_im=%d,c_r=%d,c_im=%d,d_r,d_im=%d,clk=%d,clear=%d,Output y_r=%d,y_im=%d",
a_r,a_im,c_r,c_im,d_r,d_im,clk,clear,y_r,y_im);
initial #400 $finish;
endmodule 
