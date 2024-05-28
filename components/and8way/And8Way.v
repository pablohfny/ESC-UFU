/* módulo And8Way */

`ifndef _And8Way_
`define _And8Way_

module And8Way(out, in0, in1, in2, in3, in4, in5, in6, in7);
    input in0, in1, in2, in3, in4, in5, in6, in7;
    wire and0, and1, and2, and3, and12, and34;
    output out;

    and(and0, in0, in1);
    and(and1, in2, in3);
    and(and2, in4, in5);
    and(and3, in6, in7);
    and(and12, and0, and1);
    and(and34, and2, and3);
    and(out, and12, and34);
endmodule

`endif