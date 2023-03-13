// Code your testbench here
// Using SystemVerilog, design, implement, and test a 4-bit full adder (ripple style, using gate logic) with only two inputs. Your test vectors must cover all possible values represented by 4 bits.

`timescale 1ns/100ps
`include "32bitfulladder.v"

module Adder32bit_tb;
  reg [31:0] a, b;
  reg cin;  
  wire [31:0] s; 
  wire cout;
  
  Adder32bit uut (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
  initial
    begin 
      //$dumpfile("dump.vcd"); $dumpvars(1, tb_Adder4bit);
      $monitor(" a=%b,b=%b, cin= %b, s=%b, cout=%b",a,b,cin, s, cout);
    end

integer i;
  
  initial 
    begin
      //testing a few of them
      cin= 1'b0;  
      for (i=7; i<17; i=i+1) begin
        a=i;
        b=a;  
       #10;
    end 
      cin= 1'b1;
      for (i=2; i<19; i=i+1) begin
        b=i; 
       #10;
    end 
    end

endmodule



