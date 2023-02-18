`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 21:52:45
// Design Name: 
// Module Name: layer_2_complete
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


module layer_2_complete(
    layer_1_output_leaky_1, 
    layer_1_output_leaky_2,
    layer_1_output_leaky_3,
    layer_1_output_leaky_4,
    layer_1_output_leaky_5,
    layer_1_output_leaky_6,
    layer_1_output_leaky_7,
    layer_1_output_leaky_8,
    layer_1_output_leaky_9,
    layer_1_output_leaky_10,
    layer_1_output_leaky_11,
    layer_1_output_leaky_12,
    layer_1_output_leaky_13,
    layer_1_output_leaky_14,
    layer_1_output_leaky_15,
    layer_1_output_leaky_16,
    layer_1_output_leaky_17,
    layer_1_output_leaky_18,
    layer_1_output_leaky_19,
    layer_1_output_leaky_20,
    load,clk,reset,done_complete,
    layer_2_output_leaky_1, 
    layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10
    );
    
    // layer 2 params
    parameter LEAKY_LAYER_SIZE = 32;
    parameter WEIGHT_SIZE = 8;
    parameter WEIGHT_DATA_LOCATION = "C:/Users/sachi/Downloads/weight_23.mem";
    parameter INPUT_VECTOR_SIZE = 19;

    // layer 2 bias params
    parameter l2_SIZE = LEAKY_LAYER_SIZE+WEIGHT_SIZE+1;
    parameter BIAS_SIZE = 8;
    parameter l2_SIGN_BIT_SIZE = 20;
    parameter BIAS_DATA_LOCATION = "C:/Users/sachi/Downloads/bias_23.mem";
    
    // leaky
    input load, clk, reset;
    input wire [LEAKY_LAYER_SIZE-1:0] layer_1_output_leaky_1, layer_1_output_leaky_2,
    layer_1_output_leaky_3,
    layer_1_output_leaky_4,
    layer_1_output_leaky_5,
    layer_1_output_leaky_6,
    layer_1_output_leaky_7,
    layer_1_output_leaky_8,
    layer_1_output_leaky_9,
    layer_1_output_leaky_10,
    layer_1_output_leaky_11,
    layer_1_output_leaky_12,
    layer_1_output_leaky_13,
    layer_1_output_leaky_14,
    layer_1_output_leaky_15,
    layer_1_output_leaky_16,
    layer_1_output_leaky_17,
    layer_1_output_leaky_18,
    layer_1_output_leaky_19,
    layer_1_output_leaky_20;
    
    wire done_l2_mult, done_bias, done_leaky;
    output done_complete;
    
    // layer 2 setup
    wire [(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_1, layer_2_output_2, 
    layer_2_output_3,
    layer_2_output_4,
    layer_2_output_5,
    layer_2_output_6,
    layer_2_output_7,
    layer_2_output_8,
    layer_2_output_9,
    layer_2_output_10;
    // bias output
    wire [(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_bias_1, layer_2_output_bias_2, 
    layer_2_output_bias_3,
    layer_2_output_bias_4,
    layer_2_output_bias_5,
    layer_2_output_bias_6,
    layer_2_output_bias_7,
    layer_2_output_bias_8,
    layer_2_output_bias_9,
    layer_2_output_bias_10;
    // leaky output
    output wire [2*(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_leaky_1, layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10;
    
     // layer to mult wiring
    layer_2_matrix_mult #(.LEAKY_LAYER_SIZE(LEAKY_LAYER_SIZE), .WEIGHT_SIZE(WEIGHT_SIZE), .WEIGHT_DATA_LOCATION(WEIGHT_DATA_LOCATION), .INPUT_VECTOR_SIZE(INPUT_VECTOR_SIZE)) l2mult (
   .layer_1_output_leaky_1( layer_1_output_leaky_1), 
   .layer_1_output_leaky_2( layer_1_output_leaky_2),
   .layer_1_output_leaky_3( layer_1_output_leaky_3),
   .layer_1_output_leaky_4( layer_1_output_leaky_4),
   .layer_1_output_leaky_5( layer_1_output_leaky_5),
   .layer_1_output_leaky_6( layer_1_output_leaky_6),
   .layer_1_output_leaky_7( layer_1_output_leaky_7),
   .layer_1_output_leaky_8( layer_1_output_leaky_8),
   .layer_1_output_leaky_9( layer_1_output_leaky_9),
   .layer_1_output_leaky_10( layer_1_output_leaky_10),
   .layer_1_output_leaky_11( layer_1_output_leaky_11),
   .layer_1_output_leaky_12( layer_1_output_leaky_12),
   .layer_1_output_leaky_13( layer_1_output_leaky_13),
   .layer_1_output_leaky_14( layer_1_output_leaky_14),
   .layer_1_output_leaky_15( layer_1_output_leaky_15),
   .layer_1_output_leaky_16( layer_1_output_leaky_16),
   .layer_1_output_leaky_17( layer_1_output_leaky_17),
   .layer_1_output_leaky_18( layer_1_output_leaky_18),
   .layer_1_output_leaky_19( layer_1_output_leaky_19),
   .layer_1_output_leaky_20( layer_1_output_leaky_20), 
    .load(load), .clk(clk), .reset(reset), .done(done_l2_mult), .layer_2_output_1(layer_2_output_1), .layer_2_output_2(layer_2_output_2),
    .layer_2_output_3(layer_2_output_3),
    .layer_2_output_4(layer_2_output_4),
    .layer_2_output_5(layer_2_output_5),
    .layer_2_output_6(layer_2_output_6),
    .layer_2_output_7(layer_2_output_7),
    .layer_2_output_8(layer_2_output_8),
    .layer_2_output_9(layer_2_output_9),
    .layer_2_output_10(layer_2_output_10));
    
    // layer 2 bias add
    layer_2_bias_add #(.SIZE(l2_SIZE), .BIAS_SIZE(BIAS_SIZE), .SIGN_BIT_SIZE(l2_SIGN_BIT_SIZE), .BIAS_DATA_LOCATION(BIAS_DATA_LOCATION)) l2_bias (
    .layer_2_input_1(layer_2_output_1),
    .layer_2_input_2(layer_2_output_2),
    .layer_2_input_3(layer_2_output_3),
    .layer_2_input_4(layer_2_output_4),
    .layer_2_input_5(layer_2_output_5),
    .layer_2_input_6(layer_2_output_6),
    .layer_2_input_7(layer_2_output_7),
    .layer_2_input_8(layer_2_output_8),
    .layer_2_input_9(layer_2_output_9),
    .layer_2_input_10(layer_2_output_10),
    .load(done_l2_mult), .clk(clk), .reset(reset), .done(done_bias),
    .layer_2_output_1(layer_2_output_bias_1),
    .layer_2_output_2(layer_2_output_bias_2),
    .layer_2_output_3(layer_2_output_bias_3),
    .layer_2_output_4(layer_2_output_bias_4),
    .layer_2_output_5(layer_2_output_bias_5),
    .layer_2_output_6(layer_2_output_bias_6),
    .layer_2_output_7(layer_2_output_bias_7),
    .layer_2_output_8(layer_2_output_bias_8),
    .layer_2_output_9(layer_2_output_bias_9),
    .layer_2_output_10(layer_2_output_bias_10)
    );

    // layer 2 leaky relu
    layer_2_leaky_relu #(.SIZE(l2_SIZE), .SIGN_BIT_SIZE(l2_SIGN_BIT_SIZE)) l2_leaky (
    .layer_2_input_1(layer_2_output_bias_1),
    .layer_2_input_2(layer_2_output_bias_2),
    .layer_2_input_3(layer_2_output_bias_3),
    .layer_2_input_4(layer_2_output_bias_4),
    .layer_2_input_5(layer_2_output_bias_5),
    .layer_2_input_6(layer_2_output_bias_6),
    .layer_2_input_7(layer_2_output_bias_7),
    .layer_2_input_8(layer_2_output_bias_8),
    .layer_2_input_9(layer_2_output_bias_9),
    .layer_2_input_10(layer_2_output_bias_10),
    .load(done_bias), .clk(clk), .reset(reset), .done(done_leaky),
    .layer_2_output_1(layer_2_output_leaky_1),
    .layer_2_output_2(layer_2_output_leaky_2),
    .layer_2_output_3(layer_2_output_leaky_3),
    .layer_2_output_4(layer_2_output_leaky_4),
    .layer_2_output_5(layer_2_output_leaky_5),
    .layer_2_output_6(layer_2_output_leaky_6),
    .layer_2_output_7(layer_2_output_leaky_7),
    .layer_2_output_8(layer_2_output_leaky_8),
    .layer_2_output_9(layer_2_output_leaky_9),
    .layer_2_output_10(layer_2_output_leaky_10)
    );
    
    assign done_complete = done_leaky;
    
endmodule
