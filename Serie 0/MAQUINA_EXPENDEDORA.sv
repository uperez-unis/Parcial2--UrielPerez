`timescale 1ns / 1ps

module MAQUINA_EXPENDEDORA(
    input logic clk, reset, A, B,
    input logic [1:0] C,
    output logic [1:0] P,
    output logic Confimado
    );
    
logic [1:0] Credit;
   
Moore FSM_moore (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .C(Credit)
   );
   
FSM_Mealy Mealy (
    .clk(clk),
    .reset(reset),
    .B(Credit),
    .C(C),
    .P(P),
    .A(Confimado)
   );
endmodule
