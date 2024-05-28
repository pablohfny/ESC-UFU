/* módulo Add16 */
`include "FullAdder.v"

`ifndef _Adder16_
`define _Adder16_

module Adder16(out, ovfl, in1, in2);
    input [15:0] in1, in2;
    wire [14:0] c;
    output [15:0] out;
    output ovfl;

    FullAdder fa1(out[0], c[0], in1[0], in2[0], 1'b0);
    FullAdder fa2(out[1], c[1], in1[1], in2[1], c[0]);
    FullAdder fa3(out[2], c[2], in1[2], in2[2], c[1]);
    FullAdder fa4(out[3], c[3], in1[3], in2[3], c[2]);
    FullAdder fa5(out[4], c[4], in1[4], in2[4], c[3]);
    FullAdder fa6(out[5], c[5], in1[5], in2[5], c[4]);
    FullAdder fa7(out[6], c[6], in1[6], in2[6], c[5]);
    FullAdder fa8(out[7], c[7], in1[7], in2[7], c[6]);
    FullAdder fa9(out[8], c[8], in1[8], in2[8], c[7]);
    FullAdder fa10(out[9], c[9], in1[9], in2[9], c[8]);
    FullAdder fa11(out[10], c[10], in1[10], in2[10], c[9]);
    FullAdder fa12(out[11], c[11], in1[11], in2[11], c[10]);
    FullAdder fa13(out[12], c[12], in1[12], in2[12], c[11]);
    FullAdder fa14(out[13], c[13], in1[13], in2[13], c[12]);
    FullAdder fa15(out[14], c[14], in1[14], in2[14], c[13]);
    FullAdder fa16(out[15], ovfl, in1[15], in2[15], c[14]);

endmodule

`endif