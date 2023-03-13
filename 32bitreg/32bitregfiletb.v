`include "32bitregfile.v"
`timescale 1ns/100ps

module regfile_tb;
reg [31:0] inp;
wire [31:0] out;
reg [4:0] selin, selout;
reg read, write, EN, clk;

regfile uut(.inp(inp), .out(out), .selout(selout), .selin(selin), 
.read(read), .write(write), .reset(reset), .EN(EN), .clk(clk));

initial 
    begin 
      $monitor("Read=%b Write=%b \nInput=%b Input Sel=%b \nOutput=%b Output Sel=%b\n", read, write, inp, selin, out, selout);
    end
  //clk = 1'b0;

  always #5 clk = ~clk; 

initial 
begin
    clk <=0;
    EN = 1;
    selout = 5'b00000;
    read = 1;
    write = 0;
    #10;
    selin = 5'b00000;
    inp = 32'b10000000000000000000000000000001;
    write = 1;
    read = 0;
    #10;
    selout = 5'b00000;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00001;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00000;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00001;
    read = 1;
    write = 0;
    #10;
    selin = 5'b00001;
    inp = 32'b10000000000000000000000000000001;
    write = 1;
    read = 0;
    #10;
    selout = 5'b00000;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00001;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00000;
    read = 1;
    write = 0;
    #10;
    selout = 5'b00001;
    read = 1;
    write = 0;
    #10;
  end

endmodule 





