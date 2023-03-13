/*You will create a Verilog module that provides 
thirty-two 32-bit registers. It will require inputs 
that address the specific 32-bit register you want 
either to read from which will 
return the 32-bit value or to write a 32-bit value*/

//register

module dff(D, clk, Q, Qb);
  input D, clk;
  output Q, Qb;   //output reg, wire reg
  wire Db, clkout1, clkout2;
  not(Db,D); 
  nand(clkout1,clk,D);
  nand(clkout2,clk,Db); 
  nand(Q, clkout1, Qb);
  nand(Qb, clkout2, Q);
endmodule

module bit_reg(D, clk, Q, Qb);
  
  input[31:0] D;   //inputs
  input clk;
  output [31:0] Q;
  output [31:0] Qb;  //register values 
  
genvar i;

  generate for (i=0; i<32; i= i+1) begin
     dff dff(.D(D[i]), .clk(clk), .Q(Q[i]), .Qb(Qb[i]));
  end
  endgenerate
//   dff dff1(.D(D[0]), .clk(clk), .Q(Q[0]), .Qb(Qb[0]));
//   dff dff2(.D(D[1]), .clk(clk), .Q(Q[1]), .Qb(Qb[1]));
//   dff dff3(.D(D[2]), .clk(clk), .Q(Q[2]), .Qb(Qb[2]));
//   dff dff4(.D(D[3]), .clk(clk), .Q(Q[3]), .Qb(Qb[3]));
//   dff dff5(.D(D[4]), .clk(clk), .Q(Q[4]), .Qb(Qb[4]));
//   dff dff6(.D(D[5]), .clk(clk), .Q(Q[5]), .Qb(Qb[5]));
//   dff dff7(.D(D[6]), .clk(clk), .Q(Q[6]), .Qb(Qb[6]));
//   dff dff8(.D(D[7]), .clk(clk), .Q(Q[7]), .Qb(Qb[7]));
  
  //initial #40 $finish
  endmodule

