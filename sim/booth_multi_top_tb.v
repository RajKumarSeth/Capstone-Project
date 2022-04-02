module booth_multi_top_tb;
  reg [3:0] M;
  reg [3:0] Q;
  wire [7:0] Z;
  
  booth_multi_top bmt(
  .M(M),
  .Q(Q),
  .Z(Z)
  );
  
  initial 
  begin
    M = 0; Q = 0;
    #60 M = 7; Q = 3;
    #60 M = -7; Q = -7;
    #60 M = 3; Q = 4;
    #60 M = 4; Q = -5;
    
    #100;
  end
  
endmodule
