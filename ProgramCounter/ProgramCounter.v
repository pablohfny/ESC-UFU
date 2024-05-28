`include "Increment16.v"
`include "Mux16.v"
`include "Register16.v"

`ifndef _ProgramCounter_
`define _ProgramCounter_

module ProgramCounter(out, in, load, inc, reset, clk);
    input [15:0] in; 
    input load, inc, reset, clk;

    wire [15:0] outInc, outMuxInc, outMuxLoad, outMuxReset;

    output [15:0] out;

    Increment16 inc16(outInc, out);
    
    Mux16 mux16Inc(outMuxInc, out,  outInc, inc);

    Mux16 mux16Load(outMuxLoad, outMuxInc, in,  load);

    Mux16 mux16Reset(outMuxReset, outMuxLoad, 16'b0000000000000000,  reset);

    Register16 reg0(out, outMuxReset, 1'b1, clk);

endmodule

`endif
