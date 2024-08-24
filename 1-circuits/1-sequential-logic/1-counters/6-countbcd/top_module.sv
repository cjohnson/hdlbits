// https://hdlbits.01xz.net/wiki/Countbcd

module bcd (
    input clk,
    input ena,
    input reset,
    output reg [3:0] q
);
  always @(posedge clk) begin
    if (reset) begin
      q <= 4'd0;
    end else if (ena) begin
      if (q == 4'd9) begin
        q <= 4'd0;
      end else begin
        q <= q + 1;
      end
    end
  end
endmodule

module top_module (
    input clk,
    input reset,
    output reg [3:1] ena,
    output [15:0] q
);
  bcd bcd1 (
      .clk(clk),
      .ena(1'b1),
      .reset(reset),
      .q(q[3:0])
  );

  assign ena[1] = q[3:0] == 4'd9;
  bcd bcd2 (
      .clk(clk),
      .ena(ena[1]),
      .reset(reset),
      .q(q[7:4])
  );

  assign ena[2] = ena[1] && q[7:4] == 4'd9;
  bcd bcd3 (
      .clk(clk),
      .ena(ena[2]),
      .reset(reset),
      .q(q[11:8])
  );

  assign ena[3] = ena[2] && q[11:8] == 4'd9;
  bcd bcd4 (
      .clk(clk),
      .ena(ena[3]),
      .reset(reset),
      .q(q[15:12])
  );
endmodule
