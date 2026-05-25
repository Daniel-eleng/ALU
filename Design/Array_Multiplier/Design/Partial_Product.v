`timescale 1ns / 1ps
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

module Partial_Product(input [3:0] X, Y,
                       output [3:0] PP0,PP1,PP2,PP3);

    assign PP0 = X & {4{Y[0]}};
    assign PP1 = X & {4{Y[1]}};
    assign PP2 = X & {4{Y[2]}};
    assign PP3 = X & {4{Y[3]}};
    
endmodule