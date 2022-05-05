module multi_8bit(output reg [15:0] y,input [7:0] d,e);

integer i, j ;
wire [63:0] s ,c ;
reg [7:0] a,b;//w1,w4;
//reg [15:0] w3;
wire [15:0] product;
reg p [7:0][7:0];

always @(d or e)
begin
if(d[7])
a=~d+1;
else if(!d[7])
a=d;

if(e[7])
b=~e+1;
else if(!e[7]) 
b=e;
end

always@(d,e)
begin

for (i = 0; i <= 7; i = i + 1)
for (j = 0; j <= 7; j = j + 1)
p[i][j] <= a[j] & b[i];

end
half_adder ha_11 ( .sum(s[0]), .carry(c[0]), .a(p[1][0]), .b( p[0][1]) );
full_adder fa_11 ( .sum(s[1]), .carry(c[1]), .a(p[2][0]), .b( p[1][1]), .c( p[0][2]) );
full_adder fa_12 ( .sum(s[2]), .carry(c[2]), .a(p[3][0]), .b( p[2][1]), .c( p[1][2]) );
full_adder fa_13 ( .sum(s[3]), .carry(c[3]), .a(p[4][0]), .b( p[3][1]), .c( p[2][2]) );
full_adder fa_14 ( .sum(s[4]), .carry(c[4]), .a(p[5][0]), .b( p[4][1]), .c( p[3][2]) );
full_adder fa_15 ( .sum(s[5]), .carry(c[5]), .a(p[6][0]), .b( p[5][1]), .c( p[4][2]) );
full_adder fa_16 ( .sum(s[6]), .carry(c[6]), .a(p[7][0]), .b( p[6][1]), .c( p[5][2]) );
half_adder ha_12 ( .sum(s[7]), .carry(c[7]), .a( p[7][1]), .b ( p[6][2]) );



half_adder ha_21 ( .sum( s[8] ), .carry( c[8 ]), .a( p[1][3]), .b( p[0][4]) );
full_adder fa_21 ( .sum( s[9] ), .carry( c[9 ]), .a( p[2][3]), .b( p[1][4]), .c( p[0][5]) );
full_adder fa_22 ( .sum( s[10]), .carry( c[10]), .a( p[3][3]), .b( p[2][4]), .c( p[1][5]) );
full_adder fa_23 ( .sum( s[11]), .carry( c[11]), .a( p[4][3]), .b( p[3][4]), .c( p[2][5]) );
full_adder fa_24 ( .sum( s[12]), .carry( c[12]), .a( p[5][3]), .b( p[4][4]), .c( p[3][5]) );
full_adder fa_25 ( .sum( s[13]), .carry( c[13]), .a( p[6][3]), .b( p[5][4]), .c( p[4][5]) );
full_adder fa_26 ( .sum( s[14]), .carry( c[14]), .a( p[7][3]), .b( p[6][4]), .c( p[5][5]) );
half_adder ha_22 ( .sum( s[15]), .carry( c[15]), .a( p[7][4]), .b ( p[6][5]) );



half_adder ha_31 ( .sum( s[16]), .carry( c[16]), .a( c[0]) , .b ( s[1]) );
full_adder fa_31 ( .sum( s[17]), .carry( c[17]), .a( c[1]) , .b ( s[2]) , .c ( p[0][3]) );
full_adder fa_32 ( .sum( s[18]), .carry( c[18]), .a( c[2]) , .b ( s[3]) , .c ( s[8] ) );
full_adder fa_33 ( .sum( s[19]), .carry( c[19]), .a( c[3]) , .b ( s[4]) , .c ( s[9] ) );
full_adder fa_34 ( .sum( s[20]), .carry( c[20]), .a( c[4]) , .b ( s[5]) , .c ( s[10]) );
full_adder fa_35 ( .sum( s[21]), .carry( c[21]), .a( c[5]) , .b ( s[6]) , .c ( s[11]) );
full_adder fa_36 ( .sum( s[22]), .carry( c[22]), .a( c[6]) , .b ( s[7]) , .c ( s[12]) );
full_adder fa_37 ( .sum( s[23]), .carry( c[23]), .a( c[7]) , .b ( p[7][2]), .c ( s[13]) );




half_adder ha_41 ( .sum( s[24]), .carry( c[24]), .a( c[9] ) , .b( p[0][6]) );
full_adder fa_41 ( .sum( s[25]), .carry( c[25]), .a( c[10]) , .b( p[1][6]), .c( p[0][7]) );
full_adder fa_42 ( .sum( s[26]), .carry( c[26]), .a( c[11]) , .b( p[2][6]), .c( p[1][7]) );
full_adder fa_43 ( .sum( s[27]), .carry( c[27]), .a( c[12]) , .b( p[3][6]), .c( p[2][7]) );
full_adder fa_44 ( .sum( s[28]), .carry( c[28]), .a( c[13]) , .b( p[4][6]), .c( p[3][7]) );
full_adder fa_45 ( .sum( s[29]), .carry( c[29]), .a( c[14]) , .b( p[5][6]), .c( p[4][7]) );
full_adder fa_46 ( .sum( s[30]), .carry( c[30]), .a( c[15]) , .b( p[6][6]), .c( p[5][7]) );
half_adder fa_47 ( .sum( s[31]), .carry( c[31]), .a( p[7][6]), .b ( p[6][7]) );



half_adder ha_51 ( .sum( s[32]), .carry( c[32]), .a( s[17]) , .b( c[16]) );
half_adder fa_51 ( .sum( s[33]), .carry( c[33]), .a( s[18]) , .b( c[17]) );
full_adder fa_52 ( .sum( s[34]), .carry( c[34]), .a( s[19]) , .b( c[18]), .c( c[8] ) );
full_adder fa_53 ( .sum( s[35]), .carry( c[35]), .a( s[20]) , .b( c[19]), .c( s[24]) );
full_adder fa_54 ( .sum( s[36]), .carry( c[36]), .a( s[21]) , .b( c[20]), .c( s[25]) );
full_adder fa_55 ( .sum( s[37]), .carry( c[37]), .a( s[22]) , .b( c[21]), .c( s[26]) );
full_adder fa_56 ( .sum( s[38]), .carry( c[38]), .a( s[23]) , .b( c[22]), .c( s[27]) );
full_adder fa_57 ( .sum( s[39]), .carry( c[39]), .a( s[14]) , .b( c[23]), .c( s[28]) );
half_adder ha_52 ( .sum( s[40]), .carry( c[40]), .a( s[15]) , .b ( s[29]) );
half_adder ha_53 ( .sum( s[41]), .carry( c[41]), .a( p[7][5]), .b ( s[30]) );


half_adder ha_61 ( .sum( s[42]), .carry( c[42]), .a( s[33]) , .b( c[32]) );
half_adder ha_62 ( .sum( s[43]), .carry( c[43]), .a( s[34]) , .b( c[33]) );
half_adder ha_63 ( .sum( s[44]), .carry( c[44]), .a( s[35]) , .b( c[34]) );
full_adder fa_61 ( .sum( s[45]), .carry( c[45]), .a( s[36]) , .b( c[35]), .c( c[24]) );
full_adder fa_62 ( .sum( s[46]), .carry( c[46]), .a( s[37]) , .b( c[36]), .c( c[25]) );
full_adder fa_63 ( .sum( s[47]), .carry( c[47]), .a( s[38]) , .b( c[37]), .c( c[26]) );
full_adder fa_64 ( .sum( s[48]), .carry( c[48]), .a( s[39]) , .b( c[38]), .c( c[27]) );
full_adder fa_65 ( .sum( s[49]), .carry( c[49]), .a( s[40]) , .b( c[39]), .c( c[28]) );
full_adder fa_66 ( .sum( s[50]), .carry( c[50]), .a( s[41]) , .b( c[40]), .c( c[29]) );
full_adder fa_67 ( .sum( s[51]), .carry( c[51]), .a( s[31]) , .b( c[41]), .c( c[30]) );
half_adder ha_64 ( .sum( s[52]), .carry( c[52]), .a( p[7][7]), .b ( c[31]) );



half_adder ha_71 ( .sum( s[53]), .carry( c[53]), .a( s[43]) , .b( c[42]) );
full_adder fa_71 ( .sum( s[54]), .carry( c[54]), .a( s[44]) , .b( c[43]), .c ( c[53]) );
full_adder fa_72 ( .sum( s[55]), .carry( c[55]), .a( s[45]) , .b( c[44]), .c ( c[54]) );
full_adder fa_73 ( .sum( s[56]), .carry( c[56]), .a( s[46]) , .b( c[45]), .c ( c[55]) );
full_adder fa_74 ( .sum( s[57]), .carry( c[57]), .a( s[47]) , .b( c[46]), .c ( c[56]) );
full_adder fa_75 ( .sum( s[58]), .carry( c[58]), .a( s[48]) , .b( c[47]), .c ( c[57]) );
full_adder fa_76 ( .sum( s[59]), .carry( c[59]), .a( s[49]) , .b( c[48]), .c ( c[58]) );
full_adder fa_77 ( .sum( s[60]), .carry( c[60]), .a( s[50]) , .b( c[49]), .c ( c[59]) );
full_adder fa_78 ( .sum( s[61]), .carry( c[61]), .a( s[51]) , .b( c[50]), .c ( c[60]) );
full_adder fa_79 ( .sum( s[62]), .carry( c[62]), .a( s[52]) , .b( c[51]), .c ( c[61]) );
half_adder ha_72 ( .sum( s[63]), .carry( c[63]), .a( c[52]), .b ( c[62]) );

assign product = {s[63 : 53],s[42],s[32],s[16],s[0],p[0][0]};

always @(e or d)
begin
if(d[7] && e[7])
y=product;
else if(e[7] || d[7])
begin
y=~product+1; 
end
else
y=product;
end 

endmodule
