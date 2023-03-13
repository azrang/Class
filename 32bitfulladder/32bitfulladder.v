// finish
module halfadder(a, b, carry, sum);
  input a, b;
  output carry, sum;
   assign sum= a ^ b;   //output of assign is a net
   assign carry= a & b;
  
endmodule 
    
  module Fulladder(a, b, cin, cout, s);
    input a, b, cin;
    output cout, s;
    //2 instances of half adder module 
    wire sum1, cout1, cout2;
    halfadder HA1(.a(a), .b(b), .carry(cout1), .sum(sum1));
    halfadder HA2(.a(sum1), .b(cin), .carry(cout2), .sum(s));
    assign cout= cout2 | cout1;
   endmodule
     
     module Adder32bit(a, b, cin, cout, s);
      input [31:0] a, b;  
      input cin;
      output [31:0] s;
      output cout;
      wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c19,
      c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31;  //not outputs
  
//instantiate 32 times

  Fulladder Fa1(a[0],b[0],cin,c1,s[0]);
  Fulladder Fa2(c1,a[1],b[1],c2,s[1]);
  Fulladder Fa3(c2,a[2],b[2],c3,s[2]);
  Fulladder Fa4(c3,a[3],b[3],c4,s[3]);
  Fulladder Fa5(c4,a[4],b[4],c5,s[4]);
  Fulladder Fa6(c5,a[5],b[5],c6,s[5]);
  Fulladder Fa7(c6,a[6],b[6],c7,s[6]);
  Fulladder Fa8(c7,a[7],b[7],c8,s[7]);
  Fulladder Fa9(c8,a[8],b[8],c9,s[8]);
  Fulladder Fa10(c9,a[9],b[9],c10,s[9]);
  Fulladder Fa11(c10,a[10],b[10],c11,s[10]);
  Fulladder Fa12(c11,a[11],b[11],c12,s[11]);
  Fulladder Fa13(c12,a[12],b[12],c13,s[12]);
  Fulladder Fa14(c13,a[13],b[13],c14,s[13]);
  Fulladder Fa15(c14,a[14],b[14],c15,s[14]);
  Fulladder Fa16(c15,a[15],b[15],c16,s[15]);
  Fulladder Fa17(c16,a[16],b[16],c17,s[16]);
  Fulladder Fa18(c17,a[17],b[17],c18,s[17]);
  Fulladder Fa19(c18,a[18],b[18],c19,s[18]);
  Fulladder Fa20(c19,a[19],b[19],c20,s[19]);
  Fulladder Fa21(c20,a[20],b[20],c21,s[20]);
  Fulladder Fa22(c21,a[21],b[21],c22,s[21]);
  Fulladder Fa23(c22,a[22],b[22],c23,s[22]);
  Fulladder Fa24(c23,a[23],b[23],c24,s[23]);
  Fulladder Fa25(c24,a[24],b[24],c25,s[24]);
  Fulladder Fa26(c25,a[25],b[25],c26,s[25]);
  Fulladder Fa27(c26,a[26],b[26],c27,s[26]);
  Fulladder Fa28(c27,a[27],b[27],c28,s[27]);
  Fulladder Fa29(c28,a[28],b[28],c29,s[28]);
  Fulladder Fa30(c29,a[29],b[29],c30,s[29]);
  Fulladder Fa31(c30,a[30],b[30],c31,s[30]);
  Fulladder Fa32(c31,a[31],b[31],cout,s[31]);
       
       endmodule

      
    
