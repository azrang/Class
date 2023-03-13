// Code your testbench here
// or browse Examples

`timescale 1ns/100ps
`include "2to1mux.v"

module twoto1mux_tb;
  parameter n =32;
  reg sel;
  reg [n-1:0] D0, D1;
  wire [n-1:0] out;
  
  twoto1mux uut (.sel(sel), .D0(D0), .D1(D1), .out(out));
  initial
    begin 
      //$dumpfile("dump.vcd"); $dumpvars(1, tb_Adder4bit);
      $monitor(" select=%b, D0=%b, D1=%b, output =%b",sel,D0,D1, out);
    end

integer i;
  
  initial 
    begin
      //testing a few of them
      sel= 1'b0;  
      D0 = 32'b0;
      D1 = 32'b1;  
      #10;
      sel= 1'b1;  
      D0 = 32'b0;
      D1 = 32'b1;  
      #10;
      sel= 1'b0;  
      D0 = 32'b1;
      D1 = 32'b0;  
      #10;
      sel= 1'b1;  
      D0 = 32'b1;
      D1 = 32'b0;  
      #10; 
    end

endmodule



