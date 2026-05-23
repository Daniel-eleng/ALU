`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 11:07:15 PM
// Design Name: 
// Module Name: comparator_4bits_tb
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


module comparator_4bits_tb();

    reg [3:0] A;
    reg [3:0] B;
    
    wire lt, eq, gt;

    integer i, j;

    comparator_4bits TEST (
        .A(A),
        .B(B),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

    initial begin
        {A, B} = 0;

        $monitor("Time = %0t | A = %b | B = %b | lt = %b | eq = %b | gt = %b", 
                 $time, A, B, lt, eq, gt);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                #5;
                A = i;
                B = j;
            end
        end

        #500;
        $finish;
    end

endmodule