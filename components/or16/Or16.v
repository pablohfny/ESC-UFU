/* módulo Or16 */

`ifndef _Or16_
`define _Or16_

module Or16(out, in1, in2);
    input [15:0] in1, in2;
    output [15:0] out;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            or(out[i], in1[i], in2[i]);
        end
    endgenerate
endmodule

`endif