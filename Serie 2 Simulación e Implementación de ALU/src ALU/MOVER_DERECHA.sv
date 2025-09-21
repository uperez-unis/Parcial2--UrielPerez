`timescale 100ns / 1ps


module MOVER_DERECHA(
    input logic [9:0] SUM_REST,
    input logic [3:0] shiftR,
    output logic [9:0] DERECHA
    );

logic Z;
assign Z = 4'b0000;

always_comb
    case (shiftR [3:0])
        4'b0000: begin
            DERECHA[0] = SUM_REST[0];
            DERECHA[1] = SUM_REST[1];
            DERECHA[2] = SUM_REST[2];
            DERECHA[3] = SUM_REST[3];
            DERECHA[4] = SUM_REST[4];
            DERECHA[5] = SUM_REST[5];
            DERECHA[6] = SUM_REST[6];
            DERECHA[7] = SUM_REST[7];
            DERECHA[8] = SUM_REST[8];
            DERECHA[9] = SUM_REST[9]; 
        end
        4'b0001: begin
            DERECHA[0] = SUM_REST[1];
            DERECHA[1] = SUM_REST[2];
            DERECHA[2] = SUM_REST[3];
            DERECHA[3] = SUM_REST[4];
            DERECHA[4] = SUM_REST[5];
            DERECHA[5] = SUM_REST[6];
            DERECHA[6] = SUM_REST[7];
            DERECHA[7] = SUM_REST[8];
            DERECHA[8] = SUM_REST[9];
            DERECHA[9] = Z; 
        end
        4'b0010: begin
            DERECHA[0] = SUM_REST[2];
            DERECHA[1] = SUM_REST[3];
            DERECHA[2] = SUM_REST[4];
            DERECHA[3] = SUM_REST[5];
            DERECHA[4] = SUM_REST[6];
            DERECHA[5] = SUM_REST[7];
            DERECHA[6] = SUM_REST[8];
            DERECHA[7] = SUM_REST[9];
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b0011: begin
            DERECHA[0] = SUM_REST[3];
            DERECHA[1] = SUM_REST[4];
            DERECHA[2] = SUM_REST[5];
            DERECHA[3] = SUM_REST[6];
            DERECHA[4] = SUM_REST[7];
            DERECHA[5] = SUM_REST[8];
            DERECHA[6] = SUM_REST[9];
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b0100: begin
            DERECHA[0] = SUM_REST[4];
            DERECHA[1] = SUM_REST[5];
            DERECHA[2] = SUM_REST[6];
            DERECHA[3] = SUM_REST[7];
            DERECHA[4] = SUM_REST[8];
            DERECHA[5] = SUM_REST[9];
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b0101: begin
            DERECHA[0] = SUM_REST[5];
            DERECHA[1] = SUM_REST[6];
            DERECHA[2] = SUM_REST[7];
            DERECHA[3] = SUM_REST[8];
            DERECHA[4] = SUM_REST[9];
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b0110: begin
            DERECHA[0] = SUM_REST[6];
            DERECHA[1] = SUM_REST[7];
            DERECHA[2] = SUM_REST[8];
            DERECHA[3] = SUM_REST[9];
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b0111: begin
            DERECHA[0] = SUM_REST[7];
            DERECHA[1] = SUM_REST[8];
            DERECHA[2] = SUM_REST[9];
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1000: begin
            DERECHA[0] = SUM_REST[8];
            DERECHA[1] = SUM_REST[9];
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1001: begin
            DERECHA[0] = SUM_REST[9];
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1010: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1011: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1100: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1101: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1110: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        4'b1111: begin
            DERECHA[0] = Z;
            DERECHA[1] = Z;
            DERECHA[2] = Z;
            DERECHA[3] = Z;
            DERECHA[4] = Z;
            DERECHA[5] = Z;
            DERECHA[6] = Z;
            DERECHA[7] = Z;
            DERECHA[8] = Z;
            DERECHA[9] = Z; 
        end
        
     endcase 
 
endmodule
