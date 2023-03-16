module halfadder(a,b,sum,carry);
  input a,b;
  output sum,carry;

  xor xor_1(s,a,b);
  and and_1(c,a,b);
endmodule
