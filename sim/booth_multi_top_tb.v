module booth_multi_top_tb;
parameter n=8;
  reg [n-1:0] M;
  reg [n-1:0] Q;
  
  wire [2*n-1:0] P;
  
  booth_top bmt(
  .M(M),
  .Q(Q),
  .P(P)
  );
  
  initial 
  begin
    M = 0; Q = 0;
    #60 M = -7; Q = 3;
    #60 M = -7; Q = -7;
    #60 M = 3; Q = 4;
    #60 M = 4; Q = -5;
    
    #100;
  end
  
endmodule