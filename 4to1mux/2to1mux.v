//this works
//2 way multiplexer

module twoto1mux(sel, D0, D1, out);
  parameter n = 32;
  input sel;
  input [n-1:0] D0, D1;
  output [n-1:0] out;
  wire selnot;
  wire [n-1:0] out1, out2;
  
  genvar i; 
  not(selnot, sel);
  generate for (i=0; i<32; i= i+1) begin
    and u1(out1[i], D0[i], selnot);
    and u2(out2[i], sel, D1[i]);
    or u3(out[i], out1[i], out2[i]); 
  end
  endgenerate
  
endmodule