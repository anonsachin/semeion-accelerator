`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 11:56:16
// Design Name: 
// Module Name: layer_2_5_mult_tb
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


module layer_2_5_mult_tb(

    );
    
    parameter VECTOR_SIZE = 8;
     parameter MULTIPLIER_SIZE = 8;
     // port setup
     reg [VECTOR_SIZE -1:0]  vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5;
     reg [MULTIPLIER_SIZE -1:0] multiply_input;
     reg accumulate, clk, load, reset;
     wire [(VECTOR_SIZE+MULTIPLIER_SIZE) :0]  accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5;
     wire accumulate_signal;
     
     layer_2_5_multiply #(.VECTOR_SIZE(VECTOR_SIZE), .MULTIPLIER_SIZE(MULTIPLIER_SIZE)) dut (vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5, multiply_input, clk, load, reset, accumulate, accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5,accumulate_signal);
    
    always
    #5 clk = ~clk;
    
    initial 
    begin
    clk <= 1;
    reset <= 1;
    load <= 0;
    vector_input_1 <= 0;
    vector_input_2 <= 0;
    vector_input_3 <= 0;
    vector_input_4 <= 0;
    vector_input_5 <= 0;
    multiply_input <= 0;
    accumulate<=0;
    
    #8 reset <= 0;
    
    #10 load <= 1;
    vector_input_1 <= 4'd7;
    vector_input_2 <= 4'd7;
    vector_input_3 <= 4'd7;
    vector_input_4 <= 4'd7;
    vector_input_5 <= 4'd7;
    multiply_input <= 4'd2;
    accumulate <= 0;
    
    #10 load <= 1;
    vector_input_1 <= 4'd4;
    vector_input_2 <= 4'd7;
    vector_input_3 <= 4'd7;
    vector_input_4 <= 4'd7;
    vector_input_5 <= 4'd7;
    multiply_input <= 4'd2;
    accumulate <= 1;
    
    #10 load <= 1;
    vector_input_1 <= 4'd6;
    vector_input_2 <= 4'd7;
    vector_input_3 <= 4'd7;
    vector_input_4 <= 4'd7;
    vector_input_5 <= 4'd7;
    multiply_input <= 4'd3;
    accumulate <= 1;
    
    #10 load <= 1;
    vector_input_1 <= 4'd7;
    vector_input_2 <= 4'd7;
    vector_input_3 <= 4'd7;
    vector_input_4 <= 4'd7;
    vector_input_5 <= 4'd7;
    multiply_input <= 4'd3;
    accumulate <= 0;
    
    #10 load <= 1;
    vector_input_1 <= 8'd200;
    vector_input_2 <= 8'd71;
    vector_input_3 <= 8'd71;
    vector_input_4 <= 8'd71;
    vector_input_5 <= 8'd71;
    multiply_input <= 4'd15;
    accumulate <= 1;
    
    #10 accumulate <= 0;
    load <= 0;
    
    #80 $finish;
    end
    
endmodule
