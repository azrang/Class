`include "32bitreg.v"

/*code was based off of https://esrd2014.blogspot.com/p/register-file.html
since I found it to be a good resource to learn how a
reg file works*/

module regfile(inp, out, selout, selin, read, 
write,  reset, EN, clk);

input [31:0] inp; //32bit data input line
input [4:0] selin, selout; //output and input selectino 
input read, write; //used to signal data read and write operation
input EN, clk, reset;
output [31:0] out; //2 32bit data outputs
reg [31:0] out;
reg [31:0] regfile [0:31]; //for 32 registers

integer i;

  initial begin
    for (i = 0; i < 32; i=i+1)
    begin
      regfile[i] = 32'b0;
    end
  end
  
  always @ (posedge clk)  //writes on positive edge
  begin
    if (EN == 1)
      if (write == 1)
      begin
        regfile [selin] = inp;
      end
    else;
  end

  always @ (negedge clk) //reads on neg edge
  begin
    if (EN ==1)
      if (read == 1)
      begin
        out = regfile [selout];
      end
    else;
  end
endmodule 
