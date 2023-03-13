// Code your testbench here
// or browse Examples

`timescale 1ns/100ps
`include "4to1mux.v"

module fourto1mux_tb;
  parameter n =32;
  reg [1:0] sel;
  reg [n-1:0] D0, D1, D2, D3;
  wire [n-1:0] out;
  
  fourto1mux uut (.sel(sel), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .out(out));
  initial
    begin 
      //$dumpfile("dump.vcd"); $dumpvars(1, tb_Adder4bit);
      $monitor(" select=%b, D0=%b, D1=%b, D2=%b, D3=%b, output =%b",sel,D0,D1, D2, D3, out);
    end

integer i;
  
  initial 
    begin
      //testing a few of them
      sel= 2'b0;  
      D0 = 32'b0;
      D1 = 32'b1;
      D2 = 32'b10101010101010101010101010101010;
      D3 = 32'b10000000000000000000000000000001;
      #10;
      sel= 2'b01;  
      D0 = 32'b0;
      D1 = 32'b1;  
      D2 = 32'b10101010101010101010101010101010;
      D3 = 32'b10000000000000000000000000000001;
      #10;
      sel= 2'b10;  
      D0 = 32'b0;
      D1 = 32'b1; 
      D2 = 32'b10101010101010101010101010101010;
      D3 = 32'b10000000000000000000000000000001; 
      #10; 
      sel= 2'b11;  
      D0 = 32'b1;
      D1 = 32'b0; 
      D2 = 32'b10101010101010101010101010101010;
      D3 = 32'b10000000000000000000000000000001; 
      #10;
    end

endmodule



