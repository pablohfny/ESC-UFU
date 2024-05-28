/* módulo Mux */

`ifndef _MUX_
`define _MUX_

module Mux(out, a, b, sel);
    input a, b, sel;
    wire  not_sel, a1, b1;
    output out;

    not not0(not_sel, sel);
    and and0(a1, a, not_sel);
    and and1(b1, sel, b);
    or  or0(out, a1, b1);

endmodule

`endif