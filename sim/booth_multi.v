module booth_multi(A_in, M, Q_in, Q_out, A_out);
  input [3:0] A_in, M;
  input [4:0] Q_in;
  output [3:0] A_out;
  output [4:0] Q_out;
  
  reg [3:0] A_temp;
  reg [4:0] Q_temp;
  
  wire [3:0] A_sum = A_in + M;
  wire [3:0] A_diff = A_in + ~M + 1;
  
  
  always @(A_in,M,Q_in,A_sum,A_diff)
  begin
    case(Q_in[1:0])
      
      2'b00,2'b11:
      begin
        A_temp = {A_in[3],A_in[3:1]};
        Q_temp = {A_in[0],Q_in[4:1]};
      end
      
      2'b10:
      begin
        A_temp = {A_diff[3],A_diff[3:1]};
        Q_temp = {A_diff[0],Q_in[4:1]};
      end
      
      2'b01:
      begin
        A_temp = {A_sum[3],A_sum[3:1]};
        Q_temp = {A_sum[0],Q_in[4:1]};   
      end
    endcase
  end
  
  assign A_out = A_temp;
  assign Q_out = Q_temp;
      
endmodule