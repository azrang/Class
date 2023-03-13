// Code your testbench here

//Using SystemVerilog, design, implement, and test an 8-bit register (D flip-flop, using gate logic). Your test vectors should cover at least 4 example input numbers; write to register, wait one click cycle, read the register, reset the register then begin next test cycle. Show the state of the input and put pins of the register using Verilog output text and GTKWave graphs.

`timescale 1ns/100ps
`include "32bitreg.v"

module bitreg_tb;
  reg [31:0] D;
  wire [31:0] Q;
  wire [31:0] Qb; 
  reg clk=0;
  
  bit_reg uut(.D(D), .clk(clk), .Q(Q), .Qb(Qb));
  
  initial 
    begin 
      $monitor("D=%b, clk=%b, Q=%b", D, clk, Q);
      //$dumpfile("dump.vcd"); $dumpvars(0, bitreg_tb);
    end
  //clk = 1'b0;
  always #5 clk = ~clk;
 
  initial
    begin
    D = 32'b00000000000000000000000000000000;
    #10;
    D = 32'b11111111111111111111111111111100;
    #10;
    D = 32'b11111111111111111111111111111100;
    #10;
    D = 32'b11111111111111110001111111111100;
    #10;
    D = 32'b11111111100011110001111111111100;
    end 
  
endmodule

