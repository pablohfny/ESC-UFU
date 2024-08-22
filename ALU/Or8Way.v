/* módulo or8way */

`ifndef _or8way_
`define _or8way_

module or8way(out, in0, in1, in2, in3, in4, in5, in6, in7);
    input in0, in1, in2, in3, in4, in5, in6, in7;
    wire or0, or1, or2, or3, or12, or34;
    output out;

    or(or0, in0, in1);
    or(or1, in2, in3);
    or(or2, in4, in5);
    or(or3, in6, in7);
    or(or12, or0, or1);
    or(or34, or2, or3);
    or(out, or12, or34);
endmodule

`endif