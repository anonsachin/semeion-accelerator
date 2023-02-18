`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 20:13:18
// Design Name: 
// Module Name: passthrough_adder_tb
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


module passthrough_adder_tb(

    );
    
    parameter SIZE = 4;
    parameter PASS_THROUGH_SIZE = 8;
    parameter STAGE = 2;
    // SETUP ports
    //inputs
    reg [SIZE-1:0] input_1,input_2;
    reg carry_in, load, clk, reset;
//    reg [(STAGE-1)*(SIZE+1)+PASS_THROUGH_SIZE -1:0] passthrough_in;
    //outputs
    wire [SIZE-1:0] sum [STAGE-1:0];
    wire carry[STAGE-1:0], load_out[STAGE-1:0];
    wire [(STAGE-1)*(SIZE+1)+PASS_THROUGH_SIZE -1:0] passthrough_out [STAGE-1:0];
    
    look_ahead_pass_through #(.SIZE(SIZE),.PASS_THROUGH_SIZE(PASS_THROUGH_SIZE)) add1(.input_1(input_1), .input_2(input_2), .carry_in(carry_in), 
    .sum(sum[0]), 
   .carry(carry[0]), .clk(clk), .reset(reset), .load(load), .load_out(load_out[0]), .passthrough_in({input_1,input_2}), .passthrough_out(passthrough_out[0]) );
   
    look_ahead_pass_through #(.SIZE(SIZE),.PASS_THROUGH_SIZE(SIZE+1+PASS_THROUGH_SIZE)) add2(.input_1(passthrough_out[0][2*SIZE-1:SIZE]), .input_2(sum[0]), .carry_in(carry[0]), 
    .sum(sum[1]), 
   .carry(carry[1]), .clk(clk), .reset(reset), .load(load_out[0]), .load_out(load_out[1]), .passthrough_in({carry[0],sum[0],passthrough_out[0][2*SIZE-1:0]}), .passthrough_out(passthrough_out[1]) );
    
    always
    #5 clk = ~clk;
    
    initial
    begin
    clk <= 1;
    reset <= 1;
    load <= 0;
    carry_in <= 0;
    input_1 <= 0;
    input_2 <= 0;
    
    #8 reset <= 0;
    
    #10 load <=1;
    input_1 <= 4'd1;
    input_2 <= 4'd2;
    
    #10 load <=1;
    input_1 <= 4'd3;
    input_2 <= 4'd4;
    
    #10 load <= 0;
    
    #50 $finish;
    
    
    end
    
endmodule
