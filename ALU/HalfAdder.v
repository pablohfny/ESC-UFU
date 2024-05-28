/* módulo HalfAdder */

`ifndef _HalfAdder_
`define _HalfAdder_

module HalfAdder(s, c, a, b);
    input a, b;
    output s, c;

    xor(s, a, b);
    and(c, a, b);
endmodule

`endif