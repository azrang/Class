`include "2to1mux.v"

module fourto1mux(sel, D0, D1, D2, D3, out);
    parameter n=32;
    input [1:0] sel;
    input [n-1:0] D0, D1, D2, D3;
    output [n-1:0] out;
    wire [n-1:0] out1, out2; 

    twoto1mux m1(sel[0], D0, D1, out1);
    twoto1mux m2(sel[0], D2, D3, out2);
    twoto1mux m3(sel[1], out1, out2, out);

endmodule
