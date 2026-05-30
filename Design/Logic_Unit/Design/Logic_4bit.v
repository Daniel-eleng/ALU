`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 04:00:36 PM
// Design Name: 
// Module Name: MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Logic_4bit(
    input      [3:0] A,
    input      [3:0] B,
    input      [1:0] op_sel,
    output reg [3:0] Y
);

    always @(*) begin
        case(op_sel)
            2'b00: Y = ~(A & B);
            2'b01: Y = ~(A | B);
            2'b10: Y = ~(A ^ B);
            2'b11: Y = ~A;
            
            default: Y = 4'b0000;
        endcase
    end

endmodule