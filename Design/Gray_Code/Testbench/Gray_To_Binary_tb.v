`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: Gray_To_Binary_tb
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


module Gray_To_Binary_tb;

    reg [3:0] Gray;
    wire [3:0] Binary;

    Gray_To_Binary TEST (
        .Gray(Gray),
        .Binary(Binary)
    );

    integer i;

    initial begin
        Gray = 0;

        $monitor("Time = %0t | Gray = %b | Binary = %b (%2d)", $time, Gray, Binary, Binary);

        for (i = 0; i < 16; i = i + 1) begin
            Gray = i;
            #5;
        end

        #50;
        $finish;
    end

endmodule