`timescale 1ns / 100ps
/*
Title         :  DDS Main Module
Project       :  Master's Thesis

Filename      :  dds.sv
Author        :  Madeline Crowley
Created       :  11/09/2025 14:27:38
Last Modified :  11/09/2025 15:26:12
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : Top level DDS module for the project

Mod History   : 11/09/2025 14:27:38 : created
*/
module dds #(
    parameter BITWIDTH     = 32,
    parameter TUNE_WIDTH   = 16,
    parameter PA_OUT_WIDTH = 14,
    parameter PA_WIDTH     = 23
) (
    input  wire                  clk,
    input  wire [TUNE_WIDTH-1:0] tuning_word,
    input  wire                  SEL,
    input  wire                  n_RST,
    output wire [  BITWIDTH-1:0] sig_out
);
  wire [PA_OUT_WIDTH-1:0] phase_value;
  wire [BITWIDTH-1:0]     pulse_out;
    
  pa #(
      .PA_WIDTH     (PA_WIDTH),
      .TUNE_WIDTH   (TUNE_WIDTH),
      .PA_OUT_WIDTH (PA_OUT_WIDTH)
  ) I_PA (
      .tuning_word (tuning_word),
      .clk         (clk),
      .n_RST       (n_RST),
      .phase_value (phase_value)
  );
  pulse #(
      .BITWIDTH     (BITWIDTH),
      .PA_OUT_WIDTH (PA_OUT_WIDTH)
  ) I_PULSE (
      .phase_value (phase_value),
      .pulse_out   (pulse_out)
  );
  assign sig_out = pulse_out;

endmodule : dds

