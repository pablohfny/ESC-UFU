/* módulo Mux4Way */

`include "Mux.v"

`ifndef _MUX4WAY_
`define _MUX4WAY_

module Mux4Way(out, in0, in1, in2, in3, sel);
    input in0, in1, in2, in3;
    input [1:0] sel;
    wire mux01, mux23;
    output out;

    Mux mux_module0(mux01, in0, in1, sel[0]);
    Mux mux_module1(mux23, in2, in3, sel[0]);
    Mux mux_moduleOut(out, mux01, mux23, sel[1]);
endmodule

`endif