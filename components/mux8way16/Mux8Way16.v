/* módulo Mux4Way */

`include "Mux16.v"
`include "Mux4Way16.v"

`ifndef _MUX8WAY16_
`define _MUX8WAY16_

module Mux8Way16(out, in_A, in_B, in_C, in_D, in_E, in_F, in_G, in_H, sel);
    input [15:0] in_A, in_B, in_C, in_D , in_E, in_F, in_G, in_H;
    input [2:0] sel;
    wire [15:0] mux4way16_ABCD, mux4way16_EFGH;
    output [15:0] out;

    Mux4Way16 mux_moduleABCD(mux4way16_ABCD, in_A, in_B,in_C, in_D, sel[1:0]);
    Mux4Way16 mux_moduleEFGH(mux4way16_EFGH, in_E, in_F, in_G, in_H, sel[1:0]);
    Mux16 mux_moduleOut(out, mux4way16_ABCD, mux4way16_EFGH, sel[2]);
endmodule

`endif