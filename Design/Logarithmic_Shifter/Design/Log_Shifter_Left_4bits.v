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


module Log_Shifter_Left_4bits(input [3:0] data_in,
                              input [1:0] numb_of_bits_to_shift,
                              output [3:0] data_out);

    wire [3:0] intermediate_wire;

    MUX_2_1 MOD00(.s(numb_of_bits_to_shift[0]),
                 .i({1'b0,data_in[0]}),
                 .y(intermediate_wire[0]));

    MUX_2_1 MOD01(.s(numb_of_bits_to_shift[0]),
                  .i({data_in[0],data_in[1]}),
                  .y(intermediate_wire[1]));

    MUX_2_1 MOD02(.s(numb_of_bits_to_shift[0]),
                  .i({data_in[1],data_in[2]}),
                  .y(intermediate_wire[2]));

    MUX_2_1 MOD03(.s(numb_of_bits_to_shift[0]),
                  .i({data_in[2],data_in[3]}),
                  .y(intermediate_wire[3]));

    MUX_2_1 MOD10(.s(numb_of_bits_to_shift[1]),
                  .i({1'b0,intermediate_wire[0]}),
                  .y(data_out[0]));

    MUX_2_1 MOD11(.s(numb_of_bits_to_shift[1]),
                  .i({1'b0,intermediate_wire[1]}),
                  .y(data_out[1]));

    MUX_2_1 MOD12(.s(numb_of_bits_to_shift[1]),
                  .i({intermediate_wire[0],intermediate_wire[2]}),
                  .y(data_out[2]));
                
    MUX_2_1 MOD13(.s(numb_of_bits_to_shift[1]),
                  .i({intermediate_wire[1],intermediate_wire[3]}),
                  .y(data_out[3]));
endmodule