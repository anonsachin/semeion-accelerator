`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 11:00:50
// Design Name: 
// Module Name: nbit_pipeline_mult_tb
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


module nbit_pipeline_mult_tb(

    );
    
     parameter MULTIPLIER_SIZE = 8;
     parameter MULTIPLICAND_SIZE = 4;
    reg [MULTIPLIER_SIZE-1:0] multiplier;
    reg [MULTIPLICAND_SIZE-1:0] multiplicand;
    reg clk,load,reset;
    wire [(MULTIPLICAND_SIZE+MULTIPLIER_SIZE)-1:0] product;
    wire load_out;
    
    multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(MULTIPLIER_SIZE), .MULTIPLICAND_SIZE(MULTIPLICAND_SIZE)) dut ( multiplier, multiplicand, product, clk, load, reset, load_out );
    
    always
    #5 clk = ~clk;
    
    initial 
    begin
    clk <= 1;
    reset <= 1;
    load <= 0;
    multiplier <= 0;
    multiplicand <= 0;
    
    #8 reset <= 0;
    
    #10 load <= 1;
    multiplier <= 4'd7;
    multiplicand <= 4'd2;
    
    #10 load <= 1;
    multiplier <= 4'd4;
    multiplicand <= 4'd2;
    
    #10 load <= 1;
    multiplier <= 4'd6;
    multiplicand <= 4'd3;
    
    #10 load <= 1;
    multiplier <= 4'd7;
    multiplicand <= 4'd3;
    
    #10 load <= 1;
    multiplier <= 8'd200;
    multiplicand <= 4'd15;
    
    #10 $finish;
    end
    
    
    
endmodule
