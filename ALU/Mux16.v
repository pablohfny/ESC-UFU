/* módulo Mux16 */

`ifndef _Mux16_
`define _Mux16_

module Mux16(out, a, b, sel);
    input sel;
    input [15:0] a, b;

    wire not_sel;
    wire [15:0] a1, b1;

    output [15:0] out;

    not (not_sel, sel);
    
    and (a1[0], a[0], not_sel);
    and (b1[0], sel, b[0]);
    or (out[0], a1[0], b1[0]);

    and (a1[1], a[1], not_sel);
    and (b1[1], sel, b[1]);
    or (out[1], a1[1], b1[1]);

    and (a1[2], a[2], not_sel);
    and (b1[2], sel, b[2]);
    or (out[2], a1[2], b1[2]);

    and (a1[3], a[3], not_sel);
    and (b1[3], sel, b[3]);
    or (out[3], a1[3], b1[3]);

    and (a1[4], a[4], not_sel);
    and (b1[4], sel, b[4]);
    or (out[4], a1[4], b1[4]);

    and (a1[5], a[5], not_sel);
    and (b1[5], sel, b[5]);
    or (out[5], a1[5], b1[5]);

    and (a1[6], a[6], not_sel);
    and (b1[6], sel, b[6]);
    or (out[6], a1[6], b1[6]);

    and (a1[7], a[7], not_sel);
    and (b1[7], sel, b[7]);
    or (out[7], a1[7], b1[7]);

    and (a1[8], a[8], not_sel);
    and (b1[8], sel, b[8]);
    or (out[8], a1[8], b1[8]);

    and (a1[9], a[9], not_sel);
    and (b1[9], sel, b[9]);
    or (out[9], a1[9], b1[9]);

    and (a1[10], a[10], not_sel);
    and (b1[10], sel, b[10]);
    or (out[10], a1[10], b1[10]);

    and (a1[11], a[11], not_sel);
    and (b1[11], sel, b[11]);
    or (out[11], a1[11], b1[11]);

    and (a1[12], a[12], not_sel);
    and (b1[12], sel, b[12]);
    or (out[12], a1[12], b1[12]);

    and (a1[13], a[13], not_sel);
    and (b1[13], sel, b[13]);
    or (out[13], a1[13], b1[13]);

    and (a1[14], a[14], not_sel);
    and (b1[14], sel, b[14]);
    or (out[14], a1[14], b1[14]);

    and (a1[15], a[15], not_sel);
    and (b1[15], sel, b[15]);
    or (out[15], a1[15], b1[15]);

endmodule

`endif