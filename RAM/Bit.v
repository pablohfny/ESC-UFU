/* módulo DLatch */

`ifndef _DLatch_
`define _DLatch_

module DLatch(q, d, clk);
    input d, clk;
    output q;
    wire qb, w1, w2, w3, w4, w5, w6, w7, w8, w9;

    nand nand1(w2, d, clk);
    nand nand2(w5, w2, w3);
    nand nand3(w4, clk, w1);
    nand nand4(w3, w5, w4);
    nand nand5(w8, w5, w7);
    nand nand6(q, w8, qb);
    nand nand7(w9, w7, w6);
    nand nand8(qb, q, w9);
    not not1(w1, d);
    not not2(w7, clk);
    not not3(w6, w5);

endmodule

`endif


/* módulo Mux */

`ifndef _MUX_
`define _MUX_

module Mux(out, a, b, sel);
    input a, b, sel;
    wire  not_sel, a1, b1;
    output out;

    not not0(not_sel, sel);
    and and0(a1, a, not_sel);
    and and1(b1, sel, b);
    or  or0(out, a1, b1);

endmodule

`endif

/* módulo Bit */

`ifndef _Bit_
`define _Bit_

module Bit(out, in, load, clk);

    output out;
    input in, load, clk;
    wire outMux;

    Mux mux0(outMux, out, in, load);

    DLatch dLatch0(out, outMux, clk);

endmodule

`endif