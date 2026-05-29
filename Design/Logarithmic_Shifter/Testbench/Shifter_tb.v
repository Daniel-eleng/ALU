`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 04:00:36 PM
// Design Name: 
// Module Name: MUX
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

module Shifter_tb;

    reg [3:0] data_in;
    reg [1:0] shift_val;
    reg dir;
    wire [3:0] data_out;

    top_shifter_4bit TEST (
        .data_in(data_in),
        .shift_val(shift_val),
        .dir(dir),
        .data_out(data_out)
    );

    integer i, j, k;

    initial begin
        {dir, shift_val, data_in} = 0;

        $monitor("Time = %0t | Dir = %s | data_in = %b | shift_val = %d | data_out = %b", 
                 $time, (dir ? "RIGHT" : "LEFT "), data_in, shift_val, data_out);

        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                for (k = 0; k < 16; k = k + 1) begin
                    dir = i;
                    shift_val = j;
                    data_in = k;
                    #5;
                end
            end
        end

        #500;
        $finish;
    end

endmodule