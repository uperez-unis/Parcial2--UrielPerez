`timescale 100ns / 1ps


module AorB(
    input logic [9:0] A, B,
    output logic [9:0] AorB
    );

assign AorB = A | B;   

endmodule
