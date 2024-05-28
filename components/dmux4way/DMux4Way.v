/* módulo DMux4Way */

`include "DMux.v"

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