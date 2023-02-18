`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 23:25:02
// Design Name: 
// Module Name: subtractor_lookahead
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


module subtractor_lookahead(
    input_1, input_2, difference, borrow_out
    );
    
    // setting high level parameters
    parameter SIZE = 5;

    // setting the inputs and outputs
    input [SIZE -1 :0] input_1 ;
    input [SIZE -1 :0] input_2 ;
    output [SIZE -1 :0] difference;
    output borrow_out;
    
    wire [SIZE -1 :0] input_2_compliment;
    
    assign input_2_compliment = input_2 ^ {SIZE{1'b1}};
    
    look_ahead_adder_n_bit #(.SIZE(SIZE)) la(.input_1(input_1), .input_2(input_2_compliment), .carry_in(1'b1), .sum(difference), .carry(borrow_out));
    
endmodule
