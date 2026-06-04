`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: Binary_To_Gray
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

module Binary_To_Gray(input [3:0] Binary,
                      output [3:0] Gray);

    assign Gray[3] = Binary[3];
    assign Gray[2] = Binary[3] ^ Binary[2];
    assign Gray[1] = Binary[2] ^ Binary[1];
    assign Gray[0] = Binary[1] ^ Binary[0];
    
endmodule