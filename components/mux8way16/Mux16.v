/* módulo Mux16 */

`ifndef _Mux16_
`define _Mux16_

module Mux16(out, a, b, sel);
    input sel;
    input [15:0] a, b;

    wire not_sel;
    wire [15:0] a1, b1;

    output [15:0] out;

    not (not_sel, sel);
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            and (a1[i], a[i], not_sel);
            and (b1[i], sel, b[i]);
            or  (out[i], a1[i], b1[i]);
        end
    endgenerate
endmodule

`endif