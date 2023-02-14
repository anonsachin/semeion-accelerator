`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2023 12:59:24
// Design Name: 
// Module Name: leaky_relu_signed
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


module leaky_relu_signed(
    input_value, output_value
    );
    // this implements a leaky relu where alpha is for 8 bit 00000001
    // if the sign bit are 4 alpha become 0.0625 or if it is 5 0.03125
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    
    input [SIZE-1:0] input_value;
    output [2*SIZE-1:0] output_value;
    
    assign output_value = input_value[SIZE-1] ? {{SIZE{input_value[SIZE-1]}},input_value} : {{SIZE-SIGN_BIT_SIZE{input_value[SIZE-1]}},input_value,{SIGN_BIT_SIZE{1'b0}}} ;
    
endmodule
