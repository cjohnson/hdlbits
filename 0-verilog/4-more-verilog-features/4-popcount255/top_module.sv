module top_module(
  input [254:0] in,
  output [7:0] out
);
  integer i, p;
  always @(*) begin
    p = 0;
    for (i = 0; i < 255; ++i) begin
      if (in[i])
        ++p;
      else
        p = p;
    end
    out = p;
  end
endmodule
