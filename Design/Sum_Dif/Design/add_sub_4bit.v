`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:42:54 PM
// Design Name: 
// Module Name: add_sub_4bit
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

module add_sub_4bit(input [3:0] A,
                    input [3:0] B,
                    input is_sub, // 0 for sum, 1 for dif
                    output [3:0] sum,
                    output carry_out);

    wire [3:0]B_XOR;
    assign B_XOR[0] = B[0] ^ is_sub;
    assign B_XOR[1] = B[1] ^ is_sub;
    assign B_XOR[2] = B[2] ^ is_sub;
    assign B_XOR[3] = B[3] ^ is_sub;

    cla_4bit sum_dif(.c_in(is_sub),
                     .A(A),
                     .B(B_XOR),
                     .sum(sum),
                     .c_out(carry_out));

endmodule