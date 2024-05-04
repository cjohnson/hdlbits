module top_module(
  input clk,
  input d,
  output q
);
  reg rp, rn;
  always @(negedge clk) begin
    rn <= d;
  end
  always @(posedge clk) begin
    rp <= d;
  end
  assign q = clk ? rp : rn;
endmodule
