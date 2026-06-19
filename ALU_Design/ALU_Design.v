`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: ALU_Design
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

module ALU_Design(input [3:0] A,
                  input [3:0] B,
                  input [3:0] Opcode,
                  output reg[7:0] Result);
    
    wire [3:0] logic_result;
    wire [3:0] gray_binary_result;
    wire [3:0] binary_gray_result;
    wire [7:0] multiplier_result;
    wire lt, eq, gt;
    wire [3:0] shifter_result;
    wire [3:0] sum_dif_result;
    wire carry_out;
    wire shift_dir = (Opcode == 4'b0111)?1'b1:1'b0;
    Top_Multiplier Multiplier_Module(.X(A),
                                     .Y(B),
                                     .P(multiplier_result));
                                
    comparator_4bits Comparator_Module(.A(A),
                                       .B(B),
                                       .lt(lt),
                                       .eq(eq),
                                       .gt(gt));

    Binary_To_Gray B_G_Module(.Binary(A),
                              .Gray(binary_gray_result));

    Gray_To_Binary G_B_Module(.Gray(A),
                              .Binary(gray_binary_result));

    top_shifter_4bit Shifter_Module(.data_in(A),
                                    .shift_val(B[1:0]),
                                    .dir(shift_dir),
                                    .data_out(shifter_result));
                                    
    Logic_4bit Logic_Module(.A(A),
                            .B(B),
                            .op_sel(Opcode[1:0]),
                            .Y(logic_result));
                            
    add_sub_4bit Sum_Dif_Module(.A(A),
                                .B(B),
                                .is_sub(Opcode[0]),
                                .sum(sum_dif_result),
                                .carry_out(carry_out));

    always@(*) begin
        case (Opcode)
            4'b0000 : Result = {3'b000,carry_out,sum_dif_result};
            4'b0001 : Result = {3'b000,carry_out,sum_dif_result};
            4'b0010 : Result = multiplier_result;
            4'b0011 : Result = {5'b00000,lt,eq,gt};
            4'b0100 : Result = {4'b0000,binary_gray_result};
            4'b0101 : Result = {4'b0000,gray_binary_result};
            4'b0110 : Result = {4'b0000,shifter_result};
            4'b0111 : Result = {4'b0000,shifter_result};
            4'b1000 : Result = {4'b0000,logic_result};
            4'b1001 : Result = {4'b0000,logic_result};
            4'b1010 : Result = {4'b0000,logic_result};
            4'b1011 : Result = {4'b0000,logic_result};
            default: Result = 8'b00000000; 
        endcase
    end
endmodule