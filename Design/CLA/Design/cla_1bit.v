`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:42:24 PM
// Design Name: 
// Module Name: cla_1bit
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


module cla_1bit(input A, B, c_in,
                output sum, prop, gen);

    assign prop = A | B;
    assign gen = A & B;
    assign sum = ~(~prop | gen) ^ c_in;

endmodule
