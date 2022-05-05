module booth_top(M,Q,Z);
parameter n=8;
  input [n-1:0] M, Q;
  output [2*n-1:0] Z;
  
  wire [n-1:0] A_out1;
  wire [n:0] Q_out1;
  booth bm1(.A_in(8'b0),.M(M),.Q_in({Q,1'b0}),.A_out(A_out1),.Q_out(Q_out1));
  
  wire [n-1:0] A_out2;
  wire [n:0] Q_out2;
  booth bm2(.A_in(A_out1),.M(M),.Q_in(Q_out1),.A_out(A_out2),.Q_out(Q_out2));
  
  wire [n-1:0] A_out3;
  wire [n:0] Q_out3;
  booth bm3(.A_in(A_out2),.M(M),.Q_in(Q_out2),.A_out(A_out3),.Q_out(Q_out3));
  
  wire [n-1:0] A_out4;
  wire [n:0] Q_out4;
  booth bm4(.A_in(A_out3),.M(M),.Q_in(Q_out3),.A_out(A_out4),.Q_out(Q_out4));
  
  wire [n-1:0] A_out5;
  wire [n:0] Q_out5;
  booth bm5(.A_in(A_out4),.M(M),.Q_in(Q_out4),.A_out(A_out5),.Q_out(Q_out5));
  
  wire [n-1:0] A_out6;
  wire [n:0] Q_out6;
  booth bm6(.A_in(A_out5),.M(M),.Q_in(Q_out5),.A_out(A_out6),.Q_out(Q_out6));
  
  wire [n-1:0] A_out7;
  wire [n:0] Q_out7;
  booth bm7(.A_in(A_out6),.M(M),.Q_in(Q_out6),.A_out(A_out7),.Q_out(Q_out7));
  
  wire [n-1:0] A_out8;
  wire [n:0] Q_out8; 
  booth bm8(.A_in(A_out7),.M(M),.Q_in(Q_out7),.A_out(A_out8),.Q_out(Q_out8));
  
  assign Z = {A_out8,Q_out8[n:1]};
   
endmodule
