`timescale 1ns/100ps
/*
Title         :  Pulse
Project       :  Master's Thesis

Filename      :  pulse.sv
Author        :  Madeline Crowley
Created       :  11/09/2025 14:23:34
Last Modified :  11/09/2025 14:27:28
Copyright (c) :  Madeline (Liam) Crowley

INPUTS        :
OUTPUTS       :
PARAMETERS    :

Description   : Creates a square wave for the DDS algorithm

Mod History   : 11/09/2025 14:23:34 : created
*/
module pulse # (
    parameter BITWIDTH=32,
                parameter PA_OUT_WIDTH = 14
)   (
    input wire [PA_OUT_WIDTH-1:0] phase_value,
     output wire [BITWIDTH-1:0] pulse_out
);
    assign pulse_out={BITWIDTH{phase_value[PA_OUT_WIDTH-1]}};    
endmodule: pulse

