`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: comparator_1bit
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

module Multiplier_tb;

    reg  [3:0] X, Y;
    wire [7:0] P;

    Top_Multiplier uut (
        .X(X),
        .Y(Y),
        .P(P)
    );

    integer i, j;

    initial begin
        {X, Y} = 8'b0;

        $monitor("Time = %0t | X = %0d | Y = %0d | P = %0d", $time, X, Y, P);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                #5;
                X = i[3:0];
                Y = j[3:0];
            end
        end

        #500;
        $finish;
    end

endmodule