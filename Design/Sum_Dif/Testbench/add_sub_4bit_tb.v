`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:42:54 PM
// Design Name: 
// Module Name: add_sub_4bit_tb
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

module add_sub_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg is_sub;
    
    wire [3:0] sum;
    wire carry_out;

    integer i, j, k;

    add_sub_4bit TEST (
        .A(A),
        .B(B),
        .is_sub(is_sub),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        {A, B, is_sub} = 0;

        $monitor("Time = %0t | is_sub = %b | A = %b | B = %b | sum = %b | carry_out = %b", 
                 $time, is_sub, A, B, sum, carry_out);

        for (k = 0; k < 2; k = k + 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    
                    #5;
                    is_sub = k;
                    A = i;
                    B = j;
                    
                end
            end
        end

        #500;
        $finish;
    end

endmodule