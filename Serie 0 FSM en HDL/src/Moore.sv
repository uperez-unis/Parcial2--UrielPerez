`timescale 100ns / 1ps

module Moore(
 input  logic clk, reset,    
 input  logic A, B,     
 output logic [1:0] C     
);

typedef enum logic [1:0] {S0,S1,S2,S3} statetype;
statetype state, nextstate;

typedef enum logic [1:0] {Q00, Q05, Q10, Q15} outtype;
outtype l;

always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else state <= nextstate;
    
always_comb
    case (state)    
        S0: if (B && ~A) nextstate = S1;
            else nextstate = S0;

        S1: if (~B && A) nextstate = S0;
            else if (B && ~A) nextstate = S2;
            else nextstate = S1;

        S2: if (~B && A) nextstate = S0;
            else if (B && ~A) nextstate = S3;
            else nextstate = S2;

        S3: if (~B && A) nextstate = S0;
            else nextstate = S3;

        default: nextstate = S0;
    endcase
    
always_comb 
    case (state)
        S0: l = Q00;
        S1: l = Q05;
        S2: l = Q10;
        S3: l = Q15;
    endcase
    
assign C = state;

endmodule
