/* 11411ECP001 - Pablo Nunes */
/* módulo ALU */

`include "add16.v"
`include "mux16.v"
`include "not16.v"
`include "and16.v"
`include "or8way.v"

`ifndef _alu_
`define _alu_

module alu(out, zr, ng, x, y, zx, nx, zy, ny, f, no);

output [15:0] out;
output zr, ng, ovfl;

input [15:0] x, y;
input zx, nx, zy, ny, f, no;

wire [15:0] x1, y1, x1n, y1n, xF, yF, outAdd, outAnd, outN, outF;
wire zr1, zr2, zr3;

mux16 mux1(x1, x, 16'b0, zx);
mux16 mux2(y1, y, 16'b0, zy);

not16 not1(x1n, x1);
not16 not2(y1n, y1);

mux16 mux3(xF, x1, x1n, nx);
mux16 mux4(yF, y1, y1n, ny);

add16 add1(outAdd, ovfl, xF, yF);
and16 and1(outAnd, xF, yF);

mux16 mux5(outF, outAnd, outAdd, f);

not16 notF(outN, outF);

mux16 muxF(out, outF, outN, no);

or8way or1(zr1, out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]);
or8way or2(zr2, out[8], out[9], out[10], out[11], out[12], out[13], out[14], out[15]);

or(zr3, zr1, zr2);

not(zr, zr3);

assign ng = out[15];

endmodule

`endif