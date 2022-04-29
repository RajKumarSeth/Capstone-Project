module fft_16point_tb;
`define qu 3
parameter n=8; 
reg [n-1:0] a_r,a_im,b_r,b_im,c_r,c_im,d_r,d_im;
reg clk,clear;
wire [n-1:0] y_r,y_im;
fft_16point fft(.a_r(a_r),.a_im(0),.b_r(b_r),.b_im(b_im),.c_r(c_r),.c_im(c_im),.d_r(d_r),.d_im(d_im),.clk(clk),.clear(clear),.y_r(y_r),.y_im(y_im));

initial 
begin 
clk=0;
forever #10 clk=~clk;
end

initial 
begin 
clear =1; 
clear=0;
a_r=1;
#20 a_r=2;
#20 a_r=5;
#20 a_r=6;
#20 a_r=8;
#20 a_r=1;
#20 a_r=2;
#20 a_r=3;
#20 a_r=2;
#20 a_r=4;
#20 a_r=3;
#20 a_r=2;
#20 a_r=1;
#20 a_r=3;
#20 a_r=6;
#20 a_r=9;
#20 a_r=8'bx; a_im=8'bx;

    b_r=`qu*1; b_im=`qu*0;            c_r=`qu*1; c_im=`qu*0;          d_r=`qu*1; d_im=`qu*0;
#20 b_r=`qu*0.924; b_im=`qu*-0.382;   c_r=`qu*0.707; c_im=`qu*-0.707; d_r=`qu*0; d_im=`qu*-1;
#20 b_r=`qu*0.707; b_im=`qu*-0.707;   c_r=`qu*0; c_im=`qu*-1;         d_r=8'bx; d_im=8'bx;
#20 b_r=`qu*0.382; b_im=`qu*-0.924;   c_r=`qu*-0.707; c_im=`qu*-0.707;
#20 b_r=`qu*0; b_im=`qu*-1;           c_r=8'bx; c_im=8'bx;            d_r=`qu*1; d_im=`qu*0;
#20 b_r=`qu*-0.382; b_im=`qu*-0.924;                                  d_r=`qu*0; d_im=`qu*-1;
#20 b_r=`qu*-0.707; b_im=`qu*-0.707;                                  d_r=8'bx; d_im=8'bx;
#20 b_r=`qu*-0.942; b_im=`qu*-0.382;      
#20 b_r=8'bx; b_im=8'bx;              c_r=`qu*1; c_im=`qu*0;          d_r=`qu*1; d_im=`qu*0;
#20                                   c_r=`qu*0.707; c_im=`qu*-0.707; d_r=`qu*0; d_im=`qu*-1;
#20                                   c_r=`qu*0; c_im=`qu*-1;         d_r=8'bx; d_im=8'bx;
#20                                   c_r=`qu*-0.707; c_im=`qu*-0.707;
#20                                   c_r=8'bx; c_im=8'bx;            d_r=`qu*1; d_im=`qu*0;
#20                                                                   d_r=`qu*0; d_im=`qu*-1;
#20                                                                   d_r=8'bx; d_im=8'bx;
#20 clear=1; 
end
initial $monitor("Input a_r=%d,a_im=%d,c_r=%d,c_im=%d,d_r,d_im=%d,clk=%d,clear=%d,Output y_r=%d,y_im=%d",
a_r,a_im,c_r,c_im,d_r,d_im,clk,clear,y_r,y_im);
initial #1000 $finish;
endmodule 
