`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: Gray_To_Binary
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

module Gray_To_Binary (input [3:0] Gray,
                       output [3:0] Binary);

    assign Binary[3] = Gray[3];
    assign Binary[2] = Binary[3] ^ Gray[2];
    assign Binary[1] = Binary[2] ^ Gray[1];
    assign Binary[0] = Binary[1] ^ Gray[0];
    
endmodule