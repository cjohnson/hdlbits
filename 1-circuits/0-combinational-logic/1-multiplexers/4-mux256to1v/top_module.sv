module top_module(
  input [1023:0] in,
  input [7:0] sel,
  output [3:0] out
);
  integer i;
  always @(*) begin
    out = 4'b0000;
    for (i = 0; i < 256; ++i) begin
      if (sel == i) out = in[4*sel +: 4];
    end
  end
endmodule
