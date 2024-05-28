/* módulo Mux4Way */

`include "Mux16.v"

`ifndef _MUX4WAY16_
`define _MUX4WAY16_

module Mux4Way16(out, in_A, in_B, in_C, in_D, sel);
    input [15:0] in_A, in_B, in_C, in_D;
    input [1:0] sel;
    wire [15:0] mux16_AB, mux16_CD;
    output [15:0] out;

    Mux16 mux_moduleAB(mux16_AB, in_A, in_B, sel[0]);
    Mux16 mux_moduleCD(mux16_CD, in_C, in_D, sel[0]);
    Mux16 mux_moduleOut(out, mux16_AB, mux16_CD, sel[1]);
endmodule

`endif