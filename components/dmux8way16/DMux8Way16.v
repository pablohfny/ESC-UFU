/* módulo DMux4Way */

`include "DMux16.v"
`include "DMux4Way16.v"

`ifndef _DMux8WAY16_
`define _DMux8WAY16_

module DMux8Way16(a , b , c, d, e, f, g, h, in, sel);
    input [15:0] in;
    input [2:0] sel;
    wire [15:0] DMux0AB, DMux0CD;
    output [15:0] a, b, c, d, e, f, g, h;

    DMux16 DMux16_module0(DMux0AB, DMux0CD, in, sel[2]);
    DMux4Way16 DMux4Way16_moduleABCD(a, b, c, d, DMux0AB, sel[1:0]);
    DMux4Way16 DMux4Way16_moduleEFGH(e, f, g, h, DMux0CD, sel[1:0]);
endmodule

`endif