`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:42:39 PM
// Design Name: 
// Module Name: lookahead_generator
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


module lookahead_generator(input carry_0,
                           input [3:0] prop, 
                           input [3:0] gen,
                           output [4:1] carry_out);
    
    assign carry_out[1] = gen[0] | (prop[0] & carry_0);
    assign carry_out[2] = gen[1] | (prop[1] & (gen[0] | (prop[0] & carry_0)));
    assign carry_out[3] = gen[2] | (prop[2] & (gen[1] | (prop[1] & (gen[0] | (prop[0] & carry_0)))));
    assign carry_out[4] = gen[3] | (prop[3] & (gen[2] | (prop[2] & (gen[1] | (prop[1] & (gen[0] | (prop[0] & carry_0)))))));

endmodule
