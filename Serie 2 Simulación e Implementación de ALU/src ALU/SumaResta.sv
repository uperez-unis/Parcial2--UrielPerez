`timescale 100ns / 1ps


module SumaResta(
    input logic [9:0] A, B,
    input logic ALU0,
    output logic [9:0]SUM_REST,
    output logic Cout
    );
    
logic [9:0] bneg;

always_comb
    if(ALU0) bneg <= ~B;
    else bneg <= B;
    
RippleCarry sum_rest (
    .a(A[9:0]),
    .b(bneg[9:0]),
    .cin(ALU0),
    .s(SUM_REST[9:0]),
    .cout(Cout)
);   
    
    
    
endmodule
