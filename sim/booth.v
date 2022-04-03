module booth_multi(A_in, M, Q_in, Q_out, A_out);
parameter n=8;
  input [n-1:0] A_in, M;
  input [n:0] Q_in;
  output [n-1:0] A_out;
  output [n:0] Q_out;
  
  reg [n-1:0] A_temp;
  reg [n:0] Q_temp;
  
  wire [n-1:0] A_sum = A_in + M;
  wire [n-1:0] A_diff = A_in + ~M + 1;
  
  
  always @(A_in,M,Q_in,A_sum,A_diff)
  begin
    case(Q_in[1:0])
      
      2'b00,2'b11:
      begin
        A_temp = {A_in[n-1],A_in[n-1:1]};
        Q_temp = {A_in[0],Q_in[n:1]};
      end
      
      2'b10:
      begin
        A_temp = {A_diff[n-1],A_diff[n-1:1]};
        Q_temp = {A_diff[0],Q_in[n:1]};
      end
      
      2'b01:
      begin
        A_temp = {A_sum[n-1],A_sum[n-1:1]};
        Q_temp = {A_sum[0],Q_in[n:1]};   
      end
    endcase
  end
  
  assign A_out = A_temp;
  assign Q_out = Q_temp;
      
endmodule
