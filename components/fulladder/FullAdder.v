/* módulo FullAdder */

`include "HalfAdder.v"

`ifndef _FullAdder_
`define _FullAdder_

module FullAdder(s, cout, a, b, cin);
    input a, b, cin;
    output s, cout;

    wire s1, c1, c2;

    HalfAdder ha1(s1, c1, a, b);
    HalfAdder ha2(s, c2, s1, cin);
    or(cout, c1, c2);

endmodule

`endif