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

/* módulo Register16 */
`ifndef _Register16_
`define _Register16_

module Register16(out, in, load, clk);
    output [15:0] out;
    input [15:0] in; 
    input load, clk;
    
    Bit bit0(out[0], in[0], load, clk);
    Bit bit1(out[1], in[1], load, clk);
    Bit bit2(out[2], in[2], load, clk);
    Bit bit3(out[3], in[3], load, clk);
    Bit bit4(out[4], in[4], load, clk);
    Bit bit5(out[5], in[5], load, clk);
    Bit bit6(out[6], in[6], load, clk);
    Bit bit7(out[7], in[7], load, clk);
    Bit bit8(out[8], in[8], load, clk);
    Bit bit9(out[9], in[9], load, clk);
    Bit bit10(out[10], in[10], load, clk);
    Bit bit11(out[11], in[11], load, clk);
    Bit bit12(out[12], in[12], load, clk);
    Bit bit13(out[13], in[13], load, clk);
    Bit bit14(out[14], in[14], load, clk);
    Bit bit15(out[15], in[15], load, clk);

endmodule

`endif

