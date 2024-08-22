/* módulo FullAdder */

`include "halfadder.v"

`ifndef _fulladder_
`define _fulladder_

module fulladder(s, cout, a, b, cin);
    input a, b, cin;
    output s, cout;

    wire s1, c1, c2;

    halfadder ha1(s1, c1, a, b);
    halfadder ha2(s, c2, s1, cin);
    or(cout, c1, c2);

endmodule

`endif