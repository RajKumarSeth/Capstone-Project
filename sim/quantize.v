module quantize(w,clear,z);
`define qu 3
parameter n=16;
input [n-1:0] w;
input clear;
output [n-1:0] z;
wire [n/2-1:0] w_r,w_im;
wire [n/2-1:0] z1_r,z1_im;
reg [n/2-1:0] z_r,z_im,w1_r,w1_im;

//booth_top b1(.M(b_r),.Q(a_r),.Z(w_r));
//booth_top b2(.M(b_im),.Q(a_im),.Z(w_im));
assign w_r=w[n-1:n/2];
assign w_im=w[n/2-1:0];

always @(w_im or w_r)
begin
if(w_r[7])
w1_r=~w_r+1;
else if(!w_r[7])
w1_r=w_r;

if(w_im[7])
w1_im=~w_im+1;
else if(!w_im[7]) 
w1_im=w_im;
end

assign z1_r=w1_r/`qu;
assign z1_im=w1_im/`qu;

always @(w_im or w_r or z1_r or z1_im)
begin
if(clear==1)
begin
z_r<=8'bx;
z_im<=8'bx;
end
else
begin
if(w_r[7])
z_r=~z1_r+1;
else if(!w_r[7])
z_r=z1_r;

if(w_im[7])
z_im=~z1_im+1;
else if(!w_im[7])
z_im=z1_im;

end
end
assign z={z_r,z_im};
endmodule

