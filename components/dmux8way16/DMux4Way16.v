/* módulo DMux4Way */

`include "DMux16.v"

`ifndef _DMux4WAY16_
`define _DMux4WAY16_

module DMux4Way16(a , b , c, d, in, sel);
    input [15:0] in;
    input [1:0] sel;
    wire [15:0] DMux0AB, DMux0CD;
    output [15:0] a, b, c, d;

    DMux16 DMux16_module0(DMux0AB, DMux0CD, in, sel[1]);
    DMux16 DMux16_moduleOutAB(a, b, DMux0AB, sel[0]);
    DMux16 DMux16_moduleOutCD(c, d, DMux0CD, sel[0]);
endmodule

`endif