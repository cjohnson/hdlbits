// https://hdlbits.01xz.net/wiki/Exams/m2014_q4k

module top_module (
    input  clk,
    input  resetn,  // synchronous reset
    input  in,
    output out
);
  reg [3:0] q;
  always @(posedge clk) begin
    if (~resetn) q <= 4'b0;
    else begin
      q[0] <= q[1];
      q[1] <= q[2];
      q[2] <= q[3];
      q[3] <= in;
    end
  end
  assign out = q[0];
endmodule
