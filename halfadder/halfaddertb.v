//this works 

`timescale 1ns/100ps
`include "halfadder.v"

module halfadder_tb;
  reg a, b;
  wire carry, sum;
  
  halfadder uut (.a(a), .b(b), .carry(carry), .sum(sum));
  initial
    begin 
      //$dumpfile("dump.vcd"); $dumpvars(1, tb_Adder4bit);
      $monitor(" a=%b, b=%b, s=%b, carry =%b",a,b,sum, carry); //USE MONITOR
      //$dumpvars(0,halfadder_tb);
    end

integer i;
  
  initial 
    begin
      //initialize  
      for (i=0; i<4; i=i+1) begin
        {a, b}=i;  //treating a & b as one binary number with MSB=a
       #10;
    end
    end
endmodule



