/* testbench para add16 */
/* ordem de portas: out, ovfl, in1, in2 */
/* input [15:0] in1, in2; */
/* output [15:0] out; */
/* output ovfl; */

`include "add16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_add16;
    reg [15:0] in1, in2;
    wire [15:0] out;
    wire ovfl;

    add16 mymodule(out, ovfl, in1, in2);
    
    initial
    begin
        $dumpfile("tb_add16.vcd");
        $dumpvars(0, tb_add16);

        // Test case 1
        in1 = 16'b0000000000000001; in2 = 16'b0000000000000001; #1;
        `assert(out, 16'b0000000000000010)
        `assert(ovfl, 1'b0)

        // Test case 2
        in1 = 16'b0000000000000010; in2 = 16'b0000000000000010; #1;
        `assert(out, 16'b0000000000000100)
        `assert(ovfl, 1'b0)

        // Test case 3
        in1 = 16'b0000000000001111; in2 = 16'b0000000000000001; #1;
        `assert(out, 16'b0000000000010000)
        `assert(ovfl, 1'b0)

        // Test case 4
        in1 = 16'b0000000011111111; in2 = 16'b0000000000000001; #1;
        `assert(out, 16'b0000000100000000)
        `assert(ovfl, 1'b0)

        // Test case 5
        in1 = 16'b1111111111111111; in2 = 16'b0000000000000001; #1;
        `assert(out, 16'b0000000000000000)
        `assert(ovfl, 1'b1)

        // Test case 6
        in1 = 16'b1010101010101010; in2 = 16'b0101010101010101; #1;
        `assert(out, 16'b1111111111111111)
        `assert(ovfl, 1'b0)

        // Test case 7
        in1 = 16'b0000111100001111; in2 = 16'b1111000011110000; #1;
        `assert(out, 16'b1111111111111111)
        `assert(ovfl, 1'b0)

        // Test case 8
        in1 = 16'b1000000000000000; in2 = 16'b1000000000000000; #1;
        `assert(out, 16'b0000000000000000)
        `assert(ovfl, 1'b1)

        // Test case 9
        in1 = 16'b0000000000000000; in2 = 16'b0000000000000000; #1;
        `assert(out, 16'b0000000000000000)
        `assert(ovfl, 1'b0)

        // Test case 10
        in1 = 16'b1111111111111111; in2 = 16'b1111111111111111; #1;
        `assert(out, 16'b1111111111111110)
        `assert(ovfl, 1'b1)

        // Test case 11
        in1 = 16'b0000000000000001; in2 = 16'b1111111111111111; #1;
        `assert(out, 16'b0000000000000000)
        `assert(ovfl, 1'b1)

        // Test case 12
        in1 = 16'b0000000000000011; in2 = 16'b0000000000000101; #1;
        `assert(out, 16'b0000000000001000)
        `assert(ovfl, 1'b0)

        // Test case 13
        in1 = 16'b0000000000001111; in2 = 16'b0000000000001111; #1;
        `assert(out, 16'b0000000000011110)
        `assert(ovfl, 1'b0)

        // Test case 14
        in1 = 16'b0000000011110000; in2 = 16'b0000000000001111; #1;
        `assert(out, 16'b0000000011111111)
        `assert(ovfl, 1'b0)

        // Test case 15
        in1 = 16'b0000000000000001; in2 = 16'b0000000000000000; #1;
        `assert(out, 16'b0000000000000001)
        `assert(ovfl, 1'b0)

        // Test case 16
        in1 = 16'b1000000000000000; in2 = 16'b0111111111111111; #1;
        `assert(out, 16'b1111111111111111)
        `assert(ovfl, 1'b0)

        $finish;
    end
endmodule