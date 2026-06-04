`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 04:00:36 PM
// Design Name: 
// Module Name: top_shifter_4bit
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

module top_shifter_4bit(
    input [3:0] data_in,  
    input [1:0] shift_val,   
    input dir,            
    output [3:0] data_out 
);


    wire [3:0] data_to_core;
    wire [3:0] core_out;

    assign data_to_core = dir ? {data_in[0], data_in[1], data_in[2], data_in[3]} : data_in;
    Log_Shifter_Left_4bits core (
        .data_in(data_to_core),
        .numb_of_bits_to_shift(shift_val),
        .data_out(core_out)
    );

    assign data_out = dir ? {core_out[0], core_out[1], core_out[2], core_out[3]} : core_out;

endmodule