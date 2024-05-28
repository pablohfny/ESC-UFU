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

/* módulo DMux4Way */

`ifndef _DMux4WAY_
`define _DMux4WAY_

module DMux4Way(a , b , c, d, in, sel);
    input in;
    input [1:0] sel;
    wire DMux0AB, DMux0CD;
    output a, b, c, d;

    DMux DMux_module0(DMux0AB, DMux0CD, in, sel[1]);
    DMux DMux_moduleOutAB(a, b, DMux0AB, sel[0]);
    DMux DMux_moduleOutCD(c, d, DMux0CD, sel[0]);
endmodule

`endif

`endif
/* módulo DMux8Way */

`ifndef _DMux8Way_
`define _DMux8Way_

module DMux8Way(a, b, c, d, e ,f ,g ,h, in, sel);
    input in;
    input [2:0] sel;
    wire DMux0AB, DMux0CD;
    output a, b, c, d, e, f, g, h;

    DMux DMux_module0(DMux0AB, DMux0CD, in, sel[2]);
    DMux4Way DMux4Way_moduleABCD(a, b, c, d, DMux0AB, sel[1:0]);
    DMux4Way DMux4Way_moduleEFGH(e, f, g, h, DMux0CD, sel[1:0]);

endmodule

`endif
