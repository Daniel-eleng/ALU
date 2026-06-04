`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 04:00:36 PM
// Design Name: 
// Module Name: Logic_4bit_tb
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

module Logic_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] op_sel;
    wire [3:0] Y;

    Logic_4bit TEST (
        .A(A),
        .B(B),
        .op_sel(op_sel),
        .Y(Y)
    );

    integer i, j, k;

    initial begin
        {op_sel, A, B} = 0;

        $monitor("Time = %0t | op_sel = %b | A = %b | B = %b | Y = %b", 
                 $time, op_sel, A, B, Y);

        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 16; k = k + 1) begin
                    op_sel = i;
                    A = j;
                    B = k;
                    #5;
                end
            end
        end

        #500;
        $finish;
    end

endmodule