// https://hdlbits.01xz.net/wiki/Count10

module top_module (
    input clk,
    input reset,
    output [3:0] q
);
  always @(posedge clk) begin
    if (reset) begin
      q <= 4'd0;
    end else if (q == 4'd9) begin
      q <= 4'd0;
    end else begin
      q <= q + 1;
    end
  end
endmodule
