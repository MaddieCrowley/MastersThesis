`timescale 1ns / 100ps
/*
Title         :  Phase Accumulator
Project       :  Master's Thesis

Filename      :  pa.sv
Author        :  Madeline Crowley
Created       :  11/09/2025 14:06:39
Last Modified :  11/09/2025 14:30:04
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : Base phase accumulator for the DDS algorithm

Mod History   : 11/09/2025 14:06:39 : created
*/
module pa #(
    parameter PA_WIDTH   = 23,
    parameter TUNE_WIDTH = 16,
    parameter PA_OUT_WIDTH   = 14
) (
    input  wire [TUNE_WIDTH-1:0] tuning_word,
    input  wire                  clk,n_RST,
    output wire [  PA_OUT_WIDTH-1:0] phase_value
);

  reg [PA_WIDTH-1:0] phasereg;
  assign phase_value = phasereg[PA_WIDTH-1:PA_WIDTH-PA_OUT_WIDTH];
  always @(posedge clk) begin
    if (~n_RST) begin
      phasereg <= 0;
    end else begin
      phasereg <= phasereg + {{PA_WIDTH - TUNE_WIDTH{1'b0}}, tuning_word};
    end
  end
endmodule : pa

