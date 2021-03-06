module multiplier(d,c,y);
parameter n=4;
input [n-1:0]d,c;
output reg [2*n-1:0]y;
wire [39:0]w;
reg [n-1:0] a,b,w1,w4;
wire [2*n-1:0] w2;
reg [2*n-1:0] w3;

always @(d)
begin
if(d[3]==1'b1)
begin
assign w1=~d;
assign a=w1+1'b1; 
end
else 
assign a=d;
end 

always @(c)
begin
if(c[3]==1'b1)
begin
assign w4=~c;
assign b=w4+1'b1; 
end
else 
assign b=c;
end 


and a1(w[0],a[0],b[0]);
and a2(w[1],a[1],b[0]);
and a3(w[2],a[2],b[0]);
and a4(w[3],a[3],b[0]);

and a5(w[4],a[0],b[1]);
and a6(w[5],a[1],b[1]);
and a7(w[6],a[2],b[1]);
and a8(w[7],a[3],b[1]);

and a9(w[8],a[0],b[2]);
and a10(w[9],a[1],b[2]);
and a11(w[10],a[2],b[2]);
and a12(w[11],a[3],b[2]);

and a13(w[12],a[0],b[3]);
and a14(w[13],a[1],b[3]);
and a15(w[14],a[2],b[3]);
and a16(w[15],a[3],b[3]);

assign w2[0]=w[0];
half_adder a17(w[1],w[4],w[16],w[17]);
half_adder a18(w[2],w[5],w[18],w[19]);
half_adder a19(w[3],w[6],w[20],w[21]);

full_adder a20(w[8],w[17],w[18],w[22],w[23]);
full_adder a21(w[9],w[19],w[20],w[24],w[25]);
full_adder a22(w[10],w[7],w[21],w[26],w[27]);

full_adder a23(w[12],w[23],w[24],w[28],w[29]);
full_adder a24(w[13],w[25],w[26],w[30],w[31]);
full_adder a25(w[14],w[11],w[27],w[32],w[33]);

half_adder a26(w[29],w[30],w[34],w[35]);
full_adder a27(w[31],w[32],w[35],w[36],w[37]);
full_adder a28(w[15],w[33],w[37],w[38],w[39]);


assign w2[1]=w[16];
assign w2[2]=w[22];
assign w2[3]=w[28];
assign w2[4]=w[34];
assign w2[5]=w[36];
assign w2[6]=w[38];
assign w2[7]=w[39];

always @(c or d)
begin
if(d[3]==1'b1 && c[3]==1'b1)
assign y=w2;
else if(c[3]==1'b1 || d[3]==1'b1)
begin
assign w3=~w2;
assign y=w3+1'b1; 
end
else
assign y=w2;
end 

endmodule
