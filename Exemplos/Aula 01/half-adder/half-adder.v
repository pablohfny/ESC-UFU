module halfadder(a,b,sum,carry);
  input a,b;
  output sum,carry;

  xor xor_1(s,a,b);
  and and_1(c,a,b);
endmodule


module test_halfadder;

  reg a,b;
  wire sum,carry;

  halfadder ha(a,b,sum,carry);

  initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0,test_halfadder);
    a = 0;
    b = 0;
    #10;
    a = 0;
    b = 1;
    #10;
    a = 1;
    b = 0;
    #10;
    a = 1;
    b = 1;
    #10;
    $finish;
  end
endmodule;