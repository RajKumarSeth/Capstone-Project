module booth_multi_top(M,Q,Z);
  input [3:0] M, Q;
  output [7:0] Z;
  
  wire [3:0] A_out1;
  wire [4:0] Q_out1;
  
  booth_multi bm1(
  .A_in(4'b0000),
  .M(M),
  .Q_in({Q,1'b0}),
  .A_out(A_out1),
  .Q_out(Q_out1)
  );
  
  wire [3:0] A_out2;
  wire [4:0] Q_out2;
  
  booth_multi bm2(
  .A_in(A_out1),
  .M(M),
  .Q_in(Q_out1),
  .A_out(A_out2),
  .Q_out(Q_out2)
  );
  
  wire [3:0] A_out3;
  wire [4:0] Q_out3;
  
  booth_multi bm3(
  .A_in(A_out2),
  .M(M),
  .Q_in(Q_out2),
  .A_out(A_out3),
  .Q_out(Q_out3)
  );
  
  wire [3:0] A_out4;
  wire [4:0] Q_out4;
  
  booth_multi bm4(
  .A_in(A_out3),
  .M(M),
  .Q_in(Q_out3),
  .A_out(A_out4),
  .Q_out(Q_out4)
  );
  
  assign Z = {A_out4,Q_out4[4:1]};
   
endmodule
