`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 14:10:49
// Design Name: 
// Module Name: look_ahead_adder_n_bit
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


module look_ahead_adder_n_bit(
    input_1, input_2, carry_in , sum, carry
    );
    
    parameter SIZE = 8;
    // SETUP ports
    input [SIZE-1:0] input_1,input_2;
    input carry_in;
    output [SIZE-1:0] sum;
    output carry;
    
    //intermediate signals
    wire [SIZE:0] carry_wire;
    wire  [SIZE-1:0]  carry_gen, carry_prop;
    
    // assign values
    assign carry_wire[0] = carry_in;
    
    // generating the sum and cary signals
    genvar i;
    generate
    for (i = 0; i < SIZE; i = i+1) begin
        assign carry_prop[i] = input_1[i] ^ input_2[i];
        assign carry_gen[i] = input_1[i] & input_2[i];
        assign sum[i] = carry_prop[i] ^ carry_wire[i];
    end
    endgenerate
    
    // carry signals
    genvar j;
    generate
    for (j = 0; j < SIZE; j = j+1) begin
        assign carry_wire[j+1] = carry_gen[j] | (carry_prop[j] & carry_wire[j]) ;
    end
    endgenerate
    
    assign carry = carry_wire[SIZE];
    
    
endmodule
