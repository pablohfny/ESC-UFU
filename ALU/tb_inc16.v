/* testbench para inc16 */
/* ordem de portas: out, in */
/* input [15:0] in; */
/* output [15:0] out; */

`include "inc16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_inc16;
    reg [15:0] in;
    wire [15:0] out;

    inc16 mymodule(out, in);
    
    initial
    begin
        $dumpfile("tb_inc16.vcd");
        $dumpvars(0, tb_inc16);

        in = 16'b0000001101110001; #1;
         `assert(out, 16'b0000001101110010)
        in = 16'b0000010000101011; #1;
         `assert(out, 16'b0000010000101100)
        in = 16'b0000101000110001; #1;
         `assert(out, 16'b0000101000110010)
        in = 16'b0000101100110110; #1;
         `assert(out, 16'b0000101100110111)
        in = 16'b0001010000011111; #1;
         `assert(out, 16'b0001010000100000)
        in = 16'b0001010000100010; #1;
         `assert(out, 16'b0001010000100011)
        in = 16'b0001101001101000; #1;
         `assert(out, 16'b0001101001101001)
        in = 16'b0001110111010011; #1;
         `assert(out, 16'b0001110111010100)
        in = 16'b0010011000100110; #1;
         `assert(out, 16'b0010011000100111)
        in = 16'b0010111011101000; #1;
         `assert(out, 16'b0010111011101001)
        in = 16'b0100010110001111; #1;
         `assert(out, 16'b0100010110010000)
        in = 16'b0100010110100011; #1;
         `assert(out, 16'b0100010110100100)
        in = 16'b0100110010011111; #1;
         `assert(out, 16'b0100110010100000)
        in = 16'b0100111011000011; #1;
         `assert(out, 16'b0100111011000100)
        in = 16'b0101111001100000; #1;
         `assert(out, 16'b0101111001100001)
        in = 16'b0110000001111010; #1;
         `assert(out, 16'b0110000001111011)
        in = 16'b0110000011110011; #1;
         `assert(out, 16'b0110000011110100)
        in = 16'b0110010101001101; #1;
         `assert(out, 16'b0110010101001110)
        in = 16'b0111000101110001; #1;
         `assert(out, 16'b0111000101110010)
        in = 16'b0111100110011100; #1;
         `assert(out, 16'b0111100110011101)
        in = 16'b1000010110010100; #1;
         `assert(out, 16'b1000010110010101)
        in = 16'b1001001100101110; #1;
         `assert(out, 16'b1001001100101111)
        in = 16'b1001101111101110; #1;
         `assert(out, 16'b1001101111101111)
        in = 16'b1010100110010000; #1;
         `assert(out, 16'b1010100110010001)
        in = 16'b1011110010100100; #1;
         `assert(out, 16'b1011110010100101)
        in = 16'b1100100000010001; #1;
         `assert(out, 16'b1100100000010010)
        in = 16'b1100100101111010; #1;
         `assert(out, 16'b1100100101111011)
        in = 16'b1101001100011000; #1;
         `assert(out, 16'b1101001100011001)
        in = 16'b1110101110100000; #1;
         `assert(out, 16'b1110101110100001)
        in = 16'b1111111111111101; #1;
         `assert(out, 16'b1111111111111110)

    end
endmodule