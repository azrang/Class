module halfadder(a, b, carry, sum);
  input a, b;
  output carry, sum;
   assign sum= a ^ b;   //output of assign is a net
   assign carry= a & b;
  
endmodule 