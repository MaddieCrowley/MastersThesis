`timescale 1ns / 100ps
/*
Title         :  Sample And Hold
Project       :  Master's Thesis

Filename      :  sah.sv
Author        :  Madeline Crowley
Created       :  10/22/2025 17:04:33
Last Modified :  10/22/2025 17:16:40
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : Sample and hold module

Mod History   : 10/22/2025 17:04:33 : created
*/
module sah #(
    parameter BITWIDTH = 32
) (
    input      [BITWIDTH-1:0] sig_in,
    input                     trig,
    output reg [BITWIDTH-1:0] sig_out
);

  always @(posedge trig) begin
    sig_out <= sig_in;
  end

endmodule : sah
