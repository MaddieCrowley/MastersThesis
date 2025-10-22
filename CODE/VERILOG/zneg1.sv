`timescale 1ns / 100ps
/*
Title         :  Unit Delay
Project       :  Master's Thesis

Filename      :  zneg1.sv
Author        :  Madeline Crowley
Created       :  10/22/2025 17:12:45
Last Modified :  10/22/2025 17:16:50
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : Unit delay function

Mod History   : 10/22/2025 17:12:45 : created
*/
module zneg1 #(
    parameter BITWIDTH = 32
) (
    input                 clk,
    input  [BITWIDTH-1:0] sig_in,
    output [BITWIDTH-1:0] sig_out
);

  always @(posedge clk) begin
    sig_out <= sig_in;
  end

endmodule : zneg1

