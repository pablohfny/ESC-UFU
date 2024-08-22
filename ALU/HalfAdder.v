/* módulo HalfAdder */

`ifndef _halfadder_
`define _halfadder_

module halfadder(s, c, a, b);
    input a, b;
    output s, c;

    xor(s, a, b);
    and(c, a, b);
endmodule

`endif