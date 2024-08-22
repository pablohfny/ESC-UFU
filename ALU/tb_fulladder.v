/* 11411ECP001 - Pablo Nunes */
/* testbench para fulladder */
/* ordem de portas: s, cout, a, b, cin */
/* input a; input b; input cin; */
/* output s; output cout; */

`include "fulladder.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_fulladder;
    reg a;
    reg b;
    reg cin;
    wire s;
    wire cout;

    fulladder mymodule(s, cout, a, b, cin);
    
    initial
    begin
        $dumpfile("tb_fulladder.vcd");
        $dumpvars(0, tb_fulladder);

        a = 1'b0; b = 1'b0; cin = 1'b0; #1;
         `assert(s, 1'b0) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b0; cin = 1'b1; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b1; cin = 1'b0; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b1; cin = 1'b1; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b0; cin = 1'b0; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b1; b = 1'b0; cin = 1'b1; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b1; cin = 1'b0; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b1; cin = 1'b1; #1;
         `assert(s, 1'b1) `assert(cout, 1'b1)

    end
endmodule