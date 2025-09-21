`timescale 100ns / 1ps


module MOVER_IZQUIERDA(
    input logic [9:0] SUM_REST,
    input logic [3:0] shiftL,
    output logic [9:0] IZQUIERDA
    );

logic Z;
assign Z = 4'b0000;

always_comb
    case(shiftL [3:0])
        4'b0000: begin
            IZQUIERDA[0] = SUM_REST[0];
            IZQUIERDA[1] = SUM_REST[1];
            IZQUIERDA[2] = SUM_REST[2];
            IZQUIERDA[3] = SUM_REST[3];
            IZQUIERDA[4] = SUM_REST[4];
            IZQUIERDA[5] = SUM_REST[5];
            IZQUIERDA[6] = SUM_REST[6];
            IZQUIERDA[7] = SUM_REST[7];
            IZQUIERDA[8] = SUM_REST[8];
            IZQUIERDA[9] = SUM_REST[9];
        end
        4'b0001: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = SUM_REST[0];
            IZQUIERDA[2] = SUM_REST[1];
            IZQUIERDA[3] = SUM_REST[2];
            IZQUIERDA[4] = SUM_REST[3];
            IZQUIERDA[5] = SUM_REST[4];
            IZQUIERDA[6] = SUM_REST[5];
            IZQUIERDA[7] = SUM_REST[6];
            IZQUIERDA[8] = SUM_REST[7];
            IZQUIERDA[9] = SUM_REST[8];
        end
        4'b0010: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = SUM_REST[0];
            IZQUIERDA[3] = SUM_REST[1];
            IZQUIERDA[4] = SUM_REST[2];
            IZQUIERDA[5] = SUM_REST[3];
            IZQUIERDA[6] = SUM_REST[4];
            IZQUIERDA[7] = SUM_REST[5];
            IZQUIERDA[8] = SUM_REST[6];
            IZQUIERDA[9] = SUM_REST[7];
        end
        4'b0011: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = SUM_REST[0];
            IZQUIERDA[4] = SUM_REST[1];
            IZQUIERDA[5] = SUM_REST[2];
            IZQUIERDA[6] = SUM_REST[3];
            IZQUIERDA[7] = SUM_REST[4];
            IZQUIERDA[8] = SUM_REST[5];
            IZQUIERDA[9] = SUM_REST[6];
        end
        4'b0100: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = SUM_REST[0];
            IZQUIERDA[5] = SUM_REST[1];
            IZQUIERDA[6] = SUM_REST[2];
            IZQUIERDA[7] = SUM_REST[3];
            IZQUIERDA[8] = SUM_REST[4];
            IZQUIERDA[9] = SUM_REST[5];
        end
        4'b0101: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = SUM_REST[0];
            IZQUIERDA[6] = SUM_REST[1];
            IZQUIERDA[7] = SUM_REST[2];
            IZQUIERDA[8] = SUM_REST[3];
            IZQUIERDA[9] = SUM_REST[4];
        end
        4'b0110: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = SUM_REST[0];
            IZQUIERDA[7] = SUM_REST[1];
            IZQUIERDA[8] = SUM_REST[2];
            IZQUIERDA[9] = SUM_REST[3];
        end
        4'b0111: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = SUM_REST[0];
            IZQUIERDA[8] = SUM_REST[1];
            IZQUIERDA[9] = SUM_REST[2];
        end
        4'b1000: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = SUM_REST[0];
            IZQUIERDA[9] = SUM_REST[1];
        end
        4'b1001: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = SUM_REST[0];
        end
        4'b1010: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
        4'b1011: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
        4'b1100: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
        4'b1101: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
        4'b1110: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
        4'b1111: begin
            IZQUIERDA[0] = Z;
            IZQUIERDA[1] = Z;
            IZQUIERDA[2] = Z;
            IZQUIERDA[3] = Z;
            IZQUIERDA[4] = Z;
            IZQUIERDA[5] = Z;
            IZQUIERDA[6] = Z;
            IZQUIERDA[7] = Z;
            IZQUIERDA[8] = Z;
            IZQUIERDA[9] = Z;
        end
            
    endcase      
        


endmodule
