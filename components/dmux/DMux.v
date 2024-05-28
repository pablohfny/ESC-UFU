/* módulo DMux */

`ifndef _DMux_
`define _DMux_

module DMux(a, b, in, sel);
    input in, sel;
    wire  not_sel;
    output a, b;

    not not0(not_sel, sel);
    and and0(a, in, not_sel);
    and and1(b, sel, in);
endmodule

`endif