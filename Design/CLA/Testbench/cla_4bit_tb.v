`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:44:38 PM
// Design Name: 
// Module Name: cla_4bit_tb
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


module cla_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg c_in;
    
    wire [3:0] sum;
    wire c_out;

    integer i, j, k;

    cla_4bit TEST (
        .c_in(c_in),
        .A(A),
        .B(B),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        {A, B, c_in} = 0;

        $monitor("Time = %0t | A = %b | B = %b | c_in = %b | sum = %b | c_out = %b", 
                 $time, A, B, c_in, sum, c_out);

        for (k = 0; k < 2; k = k + 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    #5;
                    c_in = k;
                    A = i;
                    B = j;
                end
            end
        end

        #500;
        $finish;
    end

endmodule
