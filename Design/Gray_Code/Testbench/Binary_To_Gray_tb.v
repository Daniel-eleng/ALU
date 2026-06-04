`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: Binary_To_Gray_tb
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


module Binary_To_Gray_tb;

    reg [3:0] Binary;
    wire [3:0] Gray;

    Binary_To_Gray TEST (
        .Binary(Binary),
        .Gray(Gray)
    );

    integer i;

    initial begin
        Binary = 0;

        $monitor("Time = %0t | Binary = %b (%2d) | Gray = %b", $time, Binary, Binary, Gray);

        for (i = 0; i < 16; i = i + 1) begin
            Binary = i;
            #5;
        end

        #50;
        $finish;
    end

endmodule