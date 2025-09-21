`timescale 100ns / 1ps


module ALUFLAGS(
    input logic Cout, A9, B9, SUM_REST9,
    input logic [2:0] ALU_CONTROL,
    input logic [9:0] RESULTADO,
    output logic [3:0] FLAGS
    );
    
logic negativo, cero, overflow, carry;

assign negativo = RESULTADO[9];
assign cero = (~RESULTADO[9]) & (~RESULTADO[8]) & (~RESULTADO[7]) & (~RESULTADO[6]) & (~RESULTADO[5]) & (~RESULTADO[4]) & (~RESULTADO[3]) & (~RESULTADO[2]) & (~RESULTADO[1]) & (~RESULTADO[0]);
assign overflow = (~ALU_CONTROL[2]) & (~ALU_CONTROL[1]) & (SUM_REST9 ^ A9) & (~(ALU_CONTROL[0] ^ A9 ^ B9));
assign carry = (~ALU_CONTROL[2]) & (~ALU_CONTROL[1]) & Cout;

assign FLAGS[3] = negativo;
assign FLAGS[2] = cero;
assign FLAGS[1] = carry;
assign FLAGS[0] = overflow;
    
endmodule
