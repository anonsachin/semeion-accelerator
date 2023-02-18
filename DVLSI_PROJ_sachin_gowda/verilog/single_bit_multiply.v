`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2022 18:12:57
// Design Name: 
// Module Name: single_bit_multiply
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


module single_bit_multiply(
    multiplier, multiplicand, product
    );
    parameter SIZE = 5;
    input [SIZE - 1:0] multiplier;
    input multiplicand;
    output [SIZE - 1:0] product;
    
    genvar i;
    // gernerate an and with all the bits
    generate 
        for (i =0; i< SIZE; i = i+1 ) begin
            assign product[i] = multiplicand & multiplier[i];
         end
    endgenerate
    
endmodule
