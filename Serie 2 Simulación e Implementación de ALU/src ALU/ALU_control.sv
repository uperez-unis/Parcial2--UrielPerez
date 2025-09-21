`timescale 100ns / 1ps


module ALU_control(
    input logic [9:0] A, B,
    input logic [2:0] ALU_CONTROL,
    input logic [3:0] BITS_LEFT, BITS_RIGHT,
    output logic [9:0] RESULTADO,
    output logic [3:0] ALU_FLAGS
    );
    
logic Cout;
logic [9:0] result, sum_rest, shiftR, shiftL, aband, abor;
logic [3:0] flags;

SumaResta SUMA_RESTA(
    .ALU0(ALU_CONTROL[0]),
    .A(A),
    .B(B),
    .SUM_REST(sum_rest),
    .Cout(Cout)  
);

AandB andAB (
    .A(A),
    .B(B),
    .AandB(aband)
);

AorB orAB (
    .A(A),
    .B(B),
    .AorB(abor)
);

MOVER_DERECHA shift_Right(
    .SUM_REST(sum_rest),
    .shiftR(BITS_RIGHT),
    .DERECHA(shiftR) 
);

MOVER_IZQUIERDA shift_Left(
    .SUM_REST(sum_rest),
    .shiftL(BITS_LEFT),
    .IZQUIERDA(shiftL) 
);

ALUFLAGS BANDERAS(
    .Cout(Cout),
    .A9(A[9]),
    .B9(B[9]),
    .SUM_REST9(sum_rest[9]),
    .ALU_CONTROL(ALU_CONTROL),
    .RESULTADO(result),
    .FLAGS(flags)
);

always_comb
    case(ALU_CONTROL)
        3'b000: result <= sum_rest;
        3'b001: result <= sum_rest;
        3'b010: result <= aband;
        3'b011: result <= abor;
        3'b100: result <= shiftL;
        3'b101: result <= shiftL;
        3'b110: result <= shiftR;
        3'b111: result <= shiftR;
    endcase
    
assign RESULTADO =  result;
assign ALU_FLAGS = flags;
        


endmodule
