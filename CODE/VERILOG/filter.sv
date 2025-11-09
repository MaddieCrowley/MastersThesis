`timescale 1ns / 100ps
/*
Title         :  Filter
Project       :  MasterThesis

Filename      :  filter.sv
Author        :  Madeline Crowley
Created       :  10/22/2025 16:59:34
Last Modified :  11/09/2025 14:37:33
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : A small-transistor count variable digital filter

Mod History   : 10/22/2025 16:59:34 : created
*/
module filter #(
    parameter BITWIDTH = 32
) (
    input      [BITWIDTH-1:0] sig_in,
    input      [BITWIDTH-1:0] fco,
    input                     clk,
    output reg [BITWIDTH-1:0] sig_out
);

    wire [BITWIDTH-1:0] sum_out=sah_out+sig_in;
    wire [BITWIDTH-1:0] zneg1_out;
    wire [BITWIDTH-1:0] sah_out;
    wire [BITWIDTH-1:0] dds_out;

    zneg1 # (
        .BITWIDTH(BITWIDTH)
    ) I_ZNEG1 (
        .clk     (clk),
        .sig_in  (sum_out),
        .sig_out (zneg1_out)
    );

    sah # (
        .BITWIDTH(BITWIDTH)
    ) I_SAH (
        .sig_in  (zneg1_out),
        .trig    (&dds_out),
        .sig_out (sah_out)
    );

    dds # (
        .BITWIDTH     (BITWIDTH),
        .TUNE_WIDTH   (TUNE_WIDTH),
        .PA_OUT_WIDTH (PA_OUT_WIDTH),
        .PA_WIDTH     (PA_WIDTH)
    ) I_DDS (
        .clk         (clk),
        .tuning_word (tuning_word),
        .SEL         (SEL),
        .n_RST       (n_RST),
        .sig_out     (dds_out)
    );

endmodule : filter

