`timescale 100ns / 1ps


module AandB(
    input logic [9:0] A, B,
    output logic [9:0] AandB
    );
    
assign AandB = A & B;
    
endmodule
