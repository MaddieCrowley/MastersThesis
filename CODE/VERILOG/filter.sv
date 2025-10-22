`timescale 1ns / 100ps
/*
Title         :  Filter
Project       :  MasterThesis

Filename      :  filter.sv
Author        :  Madeline Crowley
Created       :  10/22/2025 16:59:34
Last Modified :  10/22/2025 17:52:51
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






endmodule : filter

