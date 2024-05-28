/* módulo DMux16 */

`ifndef _DMux16_
`define _DMux16_

module DMux16(a, b, in, sel);
    input sel;
    input [15:0] in;
    wire not_sel;
    output [15:0] a, b;

    not (not_sel, sel);
    
    and(a[0], in[0], not_sel);
    and(b[0], sel, in[0]);

    and(a[1], in[1], not_sel);
    and(b[1], sel, in[1]);

    and(a[2], in[2], not_sel);
    and(b[2], sel, in[2]);

    and(a[3], in[3], not_sel);
    and(b[3], sel, in[3]);

    and(a[4], in[4], not_sel);
    and(b[4], sel, in[4]);

    and(a[5], in[5], not_sel);
    and(b[5], sel, in[5]);

    and(a[6], in[6], not_sel);
    and(b[6], sel, in[6]);

    and(a[7], in[7], not_sel);
    and(b[7], sel, in[7]);

    and(a[8], in[8], not_sel);
    and(b[8], sel, in[8]);

    and(a[9], in[9], not_sel);
    and(b[9], sel, in[9]);

    and(a[10], in[10], not_sel);
    and(b[10], sel, in[10]);

    and(a[11], in[11], not_sel);
    and(b[11], sel, in[11]);

    and(a[12], in[12], not_sel);
    and(b[12], sel, in[12]);

    and(a[13], in[13], not_sel);
    and(b[13], sel, in[13]);

    and(a[14], in[14], not_sel);
    and(b[14], sel, in[14]);

    and(a[15], in[15], not_sel);
    and(b[15], sel, in[15]);
endmodule

`endif