// https://hdlbits.01xz.net/wiki/Count15

module top_module (
    input clk,
    input reset,
    output [3:0] q
);
  reg [3:0] counter_reg;
  always @(posedge clk) begin
    if (reset) begin
      counter_reg <= 4'd0;
    end else begin
      counter_reg <= counter_reg + 1;
    end
  end
  assign q = counter_reg;
endmodule
