/* 11411ECP001 - Pablo Nunes */
/* módulo Add16 */

`include "halfadder.v"

`ifndef _inc16_
`define _inc16_

module inc16(out, in);
    input [15:0] in;
    wire [15:0] c;
    output [15:0] out;

    halfadder ha1(out[0], c[0], in[0], 1'b1);
    halfadder ha2(out[1], c[1], in[1], c[0]);
    halfadder ha3(out[2], c[2], in[2], c[1]);
    halfadder ha4(out[3], c[3], in[3], c[2]);
    halfadder ha5(out[4], c[4], in[4], c[3]);
    halfadder ha6(out[5], c[5], in[5], c[4]);
    halfadder ha7(out[6], c[6], in[6], c[5]);
    halfadder ha8(out[7], c[7], in[7], c[6]);
    halfadder ha9(out[8], c[8], in[8], c[7]);
    halfadder ha10(out[9], c[9], in[9], c[8]);
    halfadder ha11(out[10], c[10], in[10], c[9]);
    halfadder ha12(out[11], c[11], in[11], c[10]);
    halfadder ha13(out[12], c[12], in[12], c[11]);
    halfadder ha14(out[13], c[13], in[13], c[12]);
    halfadder ha15(out[14], c[14], in[14], c[13]);
    halfadder ha16(out[15], c[15], in[15], c[14]);

endmodule

`endif