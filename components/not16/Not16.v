/* módulo Not16 */

`ifndef _Not16_
`define _Not16_

module Not16(out, in);
    input [15:0] in;
    output [15:0] out;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            not(out[i], in[i]);
        end
    endgenerate
endmodule

`endif