/* testbench para RAM16 */
/* ordem de portas: out, in, addr, write, clk */
/* input [15:0] in; */
/* input [3:0] addr; */
/* input write, clk; */
/* output [15:0] out; */

`include "RAM16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_RAM16;
    reg [15:0] in;
    reg [3:0] addr;
    reg write, clk;
    wire [15:0] out;

    RAM16 ram0(out, in, addr, write, clk);
    
    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_RAM16.vcd");
        $dumpvars(0, tb_RAM16);

        clk = 0;

        /* Inicializa a memória zerando todos os registradores */
        in = 16'b0000000000000000; addr = 4'b0000; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0001; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0010; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0011; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0100; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0101; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0110; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0111; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0000; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0001; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0010; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0011; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0100; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0101; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0110; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b0111; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1000; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1001; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1010; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1011; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1100; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1101; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1110; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1111; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1000; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1001; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1010; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1011; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1100; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1101; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1110; write = 1; #3;
        in = 16'b0000000000000000; addr = 4'b1111; write = 1; #3;

        /* Testando leitura e escrita */
        in = 16'b0000000001110000; addr = 4'b0000; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100101; addr = 4'b0001; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100011; addr = 4'b0010; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110101; addr = 4'b0011; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001101100; addr = 4'b0100; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001101001; addr = 4'b0101; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100001; addr = 4'b0110; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110010; addr = 4'b0111; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110000; addr = 4'b0000; write = 1; #3;
        `assert(out, 16'b0000000001110000);

        in = 16'b0000000001100101; addr = 4'b0001; write = 1; #3;
        `assert(out, 16'b0000000001100101);

        in = 16'b0000000001100011; addr = 4'b0010; write = 1; #3;
        `assert(out, 16'b0000000001100011);

        in = 16'b0000000001110101; addr = 4'b0011; write = 1; #3;
        `assert(out, 16'b0000000001110101);

        in = 16'b0000000001101100; addr = 4'b0100; write = 1; #3;
        `assert(out, 16'b0000000001101100);

        in = 16'b0000000001101001; addr = 4'b0101; write = 1; #3;
        `assert(out, 16'b0000000001101001);

        in = 16'b0000000001100001; addr = 4'b0110; write = 1; #3;
        `assert(out, 16'b0000000001100001);

        in = 16'b0000000001110010; addr = 4'b0111; write = 1; #3;
        `assert(out, 16'b0000000001110010);

        in = 16'b0000000000000000; addr = 4'b0000; write = 0; #3;
        `assert(out, 16'b0000000001110000);

        in = 16'b0000000000000000; addr = 4'b0001; write = 0; #3;
        `assert(out, 16'b0000000001100101);

        in = 16'b0000000000000000; addr = 4'b0010; write = 0; #3;
        `assert(out, 16'b0000000001100011);

        in = 16'b0000000000000000; addr = 4'b0011; write = 0; #3;
        `assert(out, 16'b0000000001110101);

        in = 16'b0000000000000000; addr = 4'b0100; write = 0; #3;
        `assert(out, 16'b0000000001101100);

        in = 16'b0000000000000000; addr = 4'b0101; write = 0; #3;
        `assert(out, 16'b0000000001101001);

        in = 16'b0000000000000000; addr = 4'b0110; write = 0; #3;
        `assert(out, 16'b0000000001100001);

        in = 16'b0000000000000000; addr = 4'b0111; write = 0; #3;
        `assert(out, 16'b0000000001110010);

        in = 16'b0000000001110000; addr = 4'b1000; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100101; addr = 4'b1001; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100011; addr = 4'b1010; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110101; addr = 4'b1011; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001101100; addr = 4'b1100; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001101001; addr = 4'b1101; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001100001; addr = 4'b1110; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110010; addr = 4'b1111; write = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000000001110000; addr = 4'b1000; write = 1; #3;
        `assert(out, 16'b0000000001110000);

        in = 16'b0000000001100101; addr = 4'b1001; write = 1; #3;
        `assert(out, 16'b0000000001100101);

        in = 16'b0000000001100011; addr = 4'b1010; write = 1; #3;
        `assert(out, 16'b0000000001100011);

        in = 16'b0000000001110101; addr = 4'b1011; write = 1; #3;
        `assert(out, 16'b0000000001110101);

        in = 16'b0000000001101100; addr = 4'b1100; write = 1; #3;
        `assert(out, 16'b0000000001101100);

        in = 16'b0000000001101001; addr = 4'b1101; write = 1; #3;
        `assert(out, 16'b0000000001101001);

        in = 16'b0000000001100001; addr = 4'b1110; write = 1; #3;
        `assert(out, 16'b0000000001100001);

        in = 16'b0000000001110010; addr = 4'b1111; write = 1; #3;
        `assert(out, 16'b0000000001110010);

        in = 16'b0000000000000000; addr = 4'b1000; write = 0; #3;
        `assert(out, 16'b0000000001110000);

        in = 16'b0000000000000000; addr = 4'b1001; write = 0; #3;
        `assert(out, 16'b0000000001100101);

        in = 16'b0000000000000000; addr = 4'b1010; write = 0; #3;
        `assert(out, 16'b0000000001100011);

        in = 16'b0000000000000000; addr = 4'b1011; write = 0; #3;
        `assert(out, 16'b0000000001110101);

        in = 16'b0000000000000000; addr = 4'b1100; write = 0; #3;
        `assert(out, 16'b0000000001101100);

        in = 16'b0000000000000000; addr = 4'b1101; write = 0; #3;
        `assert(out, 16'b0000000001101001);

        in = 16'b0000000000000000; addr = 4'b1110; write = 0; #3;
        `assert(out, 16'b0000000001100001);

        in = 16'b0000000000000000; addr = 4'b1111; write = 0; #3;
        `assert(out, 16'b0000000001110010);

        $finish;
    end

endmodule
