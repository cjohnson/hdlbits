module top_module(
  input [99:0] in,
  output [98:0] out_both,
  output [99:1] out_any,
  output [99:0] out_different
);
  integer i;
  integer j;
  integer k;
  always @(*) begin
    for (i = 0; i < 99; ++i) begin
      out_both[i] = in[i+1] & in[i];
    end

    for (j = 1; j < 100; ++j) begin
      out_any[j] = in[j] | in[j-1];
    end

    for (k = 0; k < 99; ++k) begin
      out_different[k] = in[k+1] ^ in[k];
    end
    out_different[99] = in[0] ^ in[99];
  end
endmodule
