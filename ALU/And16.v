/* 11411ECP001 - Pablo Nunes */
/* módulo and16 */

`ifndef _and16_
`define _and16_

module and16(out, in1, in2);
    input [15:0] in1, in2;
    output [15:0] out;

    and(out[0], in1[0], in2[0]);
    and(out[1], in1[1], in2[1]);
    and(out[2], in1[2], in2[2]);
    and(out[3], in1[3], in2[3]);
    and(out[4], in1[4], in2[4]);
    and(out[5], in1[5], in2[5]);
    and(out[6], in1[6], in2[6]);
    and(out[7], in1[7], in2[7]);
    and(out[8], in1[8], in2[8]);
    and(out[9], in1[9], in2[9]);
    and(out[10], in1[10], in2[10]);
    and(out[11], in1[11], in2[11]);
    and(out[12], in1[12], in2[12]);
    and(out[13], in1[13], in2[13]);
    and(out[14], in1[14], in2[14]);
    and(out[15], in1[15], in2[15]);

endmodule

`endif