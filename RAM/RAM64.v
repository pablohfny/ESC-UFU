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

/* módulo DMux */

`ifndef _DMux_
`define _DMux_

module DMux(a, b, in, sel);
    input in, sel;
    wire  not_sel;
    output a, b;

    not not0(not_sel, sel);
    and and0(a, in, not_sel);
    and and1(b, sel, in);
endmodule

/* módulo DMux4Way */

`ifndef _DMux4WAY_
`define _DMux4WAY_

module DMux4Way(a , b , c, d, in, sel);
    input in;
    input [1:0] sel;
    wire DMux0AB, DMux0CD;
    output a, b, c, d;

    DMux DMux_module0(DMux0AB, DMux0CD, in, sel[1]);
    DMux DMux_moduleOutAB(a, b, DMux0AB, sel[0]);
    DMux DMux_moduleOutCD(c, d, DMux0CD, sel[0]);
endmodule

`endif

`endif
/* módulo DMux8Way */

`ifndef _DMux8Way_
`define _DMux8Way_

module DMux8Way(a, b, c, d, e ,f ,g ,h, in, sel);
    input in;
    input [2:0] sel;
    wire DMux0AB, DMux0CD;
    output a, b, c, d, e, f, g, h;

    DMux DMux_module0(DMux0AB, DMux0CD, in, sel[2]);
    DMux4Way DMux4Way_moduleABCD(a, b, c, d, DMux0AB, sel[1:0]);
    DMux4Way DMux4Way_moduleEFGH(e, f, g, h, DMux0CD, sel[1:0]);

endmodule

`endif

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

/* módulo Mux4Way */

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

/* módulo RAM8 */

`ifndef _RAM8_
`define _RAM8_

module RAM8(out, in, addr, write, clk);

    output [15:0] out;
    input [15:0] in;
    input [2:0] addr;
    input write, clk;

    wire [7:0] dmuxWrite;
    wire [15:0] outRegister0, outRegister1, outRegister2, outRegister3, outRegister4, outRegister5, outRegister6, outRegister7;

    DMux8Way dmux0(dmuxWrite[0], dmuxWrite[1], dmuxWrite[2], dmuxWrite[3], dmuxWrite[4], dmuxWrite[5], dmuxWrite[6], dmuxWrite[7], write, addr);

    Register16 register0(outRegister0, in, dmuxWrite[0], clk);
    Register16 register1(outRegister1, in, dmuxWrite[1], clk);
    Register16 register2(outRegister2, in, dmuxWrite[2], clk);
    Register16 register3(outRegister3, in, dmuxWrite[3], clk);
    Register16 register4(outRegister4, in, dmuxWrite[4], clk);
    Register16 register5(outRegister5, in, dmuxWrite[5], clk);
    Register16 register6(outRegister6, in, dmuxWrite[6], clk);
    Register16 register7(outRegister7, in, dmuxWrite[7], clk);

    Mux8Way16 mux0(out, outRegister0, outRegister1, outRegister2, outRegister3, outRegister4, outRegister5, outRegister6, outRegister7, addr);

endmodule

`endif

/* módulo RAM16 */

`ifndef _RAM16_
`define _RAM16_

module RAM16(out, in, addr, write, clk);

    output [15:0] out;
    input [15:0] in;
    input [3:0] addr;
    input write, clk;

    wire [15:0] outRam8_0, outRam8_1;
    wire out0Dmux0, out1Dmux;

    DMux dmux0(out0Dmux0, out1Dmux, write, addr[3]);

    RAM8 ram0(outRam8_0, in, addr[2:0], out0Dmux0, clk);
    RAM8 ram1(outRam8_1, in, addr[2:0], out1Dmux, clk);

    Mux16 mux0(out, outRam8_0, outRam8_1, addr[3]);

endmodule

`endif


/* módulo RAM64 */

`ifndef _RAM32_
`define _RAM32_

module RAM32(out, in, addr, write, clk);

    output [15:0] out;
    input [15:0] in;
    input [4:0] addr;
    input write, clk;

    wire [15:0] outRam16_0, outRam16_1;
    wire out0Dmux0, out1Dmux;

    DMux dmux0(out0Dmux0, out1Dmux, write, addr[4]);

    RAM16 ram0(outRam16_0, in, addr[3:0], out0Dmux0, clk);
    RAM16 ram1(outRam16_1, in, addr[3:0], out1Dmux, clk);

    Mux16 mux0(out, outRam16_0, outRam16_1, addr[4]);

endmodule

`endif

/* módulo RAM64 */

`ifndef _RAM64_
`define _RAM64_

module RAM64(out, in, addr, write, clk);

    output [15:0] out;
    input [15:0] in;
    input [5:0] addr;
    input write, clk;

    wire [15:0] outRam32_0, outRam32_1;
    wire out0Dmux0, out1Dmux;

    DMux dmux0(out0Dmux0, out1Dmux, write, addr[5]);

    RAM32 ram0(outRam32_0, in, addr[4:0], out0Dmux0, clk);
    RAM32 ram1(outRam32_1, in, addr[4:0], out1Dmux, clk);

    Mux16 mux0(out, outRam32_0, outRam32_1, addr[5]);

endmodule

`endif