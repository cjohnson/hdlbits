// https://hdlbits.01xz.net/wiki/Count_clock

module bcd (
    input clk,
    input ena,
    input reset,
    input [3:0] initial_value,
    output reg [3:0] q
);
  always @(posedge clk) begin
    if (reset) begin
      q <= initial_value;
    end else if (ena) begin
      q <= q + 1;
    end
  end
endmodule

module top_module (
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);
  wire rollover_ss0 = ena && ss[3:0] == 4'd9;
  bcd bcd_ss0 (
      .clk(clk),
      .ena(ena),
      .reset(reset || rollover_ss0),
      .initial_value(4'd0),
      .q(ss[3:0])
  );

  wire rollover_ss1 = ss[7:4] == 4'd5 && rollover_ss0;
  bcd bcd_ss1 (
      .clk(clk),
      .ena(ena && rollover_ss0),
      .reset(reset || rollover_ss1),
      .initial_value(4'd0),
      .q(ss[7:4])
  );

  wire rollover_mm0 = mm[3:0] == 4'd9 && rollover_ss1;
  bcd bcd_mm0 (
      .clk(clk),
      .ena(ena && rollover_ss1),
      .reset(reset || rollover_mm0),
      .initial_value(4'd0),
      .q(mm[3:0])
  );

  wire rollover_mm1 = mm[7:4] == 4'd5 && rollover_mm0;
  bcd bcd_mm1 (
      .clk(clk),
      .ena(ena && rollover_mm0),
      .reset(reset || rollover_mm1),
      .initial_value(4'd0),
      .q(mm[7:4])
  );

  wire [7:0] hh_internal;
  wire rollover_hh = hh_internal[7:4] == 4'd1 && hh_internal[3:0] == 4'd1;
  wire rollover_hh_digits = hh_internal[7:4] == 4'd0 && hh_internal[3:0] == 4'd9;
  wire rollover_hh0 = rollover_mm1 && (rollover_hh || rollover_hh_digits);
  bcd bcd_hh0 (
      .clk(clk),
      .ena(ena && rollover_mm1),
      .reset(reset || rollover_hh0),
      .initial_value(4'd0),
      .q(hh_internal[3:0])
  );

  wire rollover_hh1 = rollover_mm1 && rollover_hh;
  bcd bcd_hh1 (
      .clk(clk),
      .ena(ena && rollover_hh0),
      .reset(reset || rollover_hh1),
      .initial_value(4'd0),
      .q(hh_internal[7:4])
  );

  always @(posedge clk) begin
    if (reset) begin
      pm <= 1'b0;
    end else if (ena && rollover_hh1) begin
      pm <= ~pm;
    end
  end

  always_comb begin
    if (hh_internal[7:4] == 0 && hh_internal[3:0] == 0) begin
      hh[7:4] = 4'd1;
      hh[3:0] = 4'd2;
    end else begin
      hh[7:0] = hh_internal[7:0];
    end
  end
endmodule
