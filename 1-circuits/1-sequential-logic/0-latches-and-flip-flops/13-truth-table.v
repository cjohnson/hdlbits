module top_module(
  input clk,
  input j,
  input k,
  output reg Q
);
  wire next_Q;
  always @(*) begin
    case ({j, k})
      2'b00: next_Q = Q;
      2'b01: next_Q = 0;
      2'b10: next_Q = 1;
      2'b11: next_Q = ~Q;
    endcase
  end

  always @(posedge clk) begin
    Q <= next_Q;
  end
endmodule
