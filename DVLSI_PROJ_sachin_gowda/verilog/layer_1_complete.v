`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 13:22:40
// Design Name: 
// Module Name: layer_1_complete
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


module layer_1_complete(
    layer_1_input, load, clk, reset, done_complete, layer_1_output_leaky_1, layer_1_output_leaky_2,
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
    layer_1_output_leaky_20
    );
    
    // complete later one computation
    
     parameter LAYER_1_INPUT_SIZE = 256;
    parameter OUTPUT_BUT_SIZE = 16;
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    parameter BIAS_SIZE = 8;
    parameter BIAS_DATA_LOCATION = "C:/Users/sachi/Downloads/bias_12.mem";
    parameter WEIGHT_DATA_LOCATION = "C:/Users/sachi/Downloads/weight_12.mem";
    
    input load, clk, reset;
    input [LAYER_1_INPUT_SIZE -1:0] layer_1_input;
    output done_complete;
    wire [OUTPUT_BUT_SIZE-1:0] layer_1_output_1, layer_1_output_2,
    layer_1_output_3,
    layer_1_output_4,
    layer_1_output_5,
    layer_1_output_6,
    layer_1_output_7,
    layer_1_output_8,
    layer_1_output_9,
    layer_1_output_10,
    layer_1_output_11,
    layer_1_output_12,
    layer_1_output_13,
    layer_1_output_14,
    layer_1_output_15,
    layer_1_output_16,
    layer_1_output_17,
    layer_1_output_18,
    layer_1_output_19,
    layer_1_output_20;
    wire done;

    // bias
    wire [OUTPUT_BUT_SIZE-1:0] layer_1_output_bias_1, layer_1_output_bias_2,
    layer_1_output_bias_3,
    layer_1_output_bias_4,
    layer_1_output_bias_5,
    layer_1_output_bias_6,
    layer_1_output_bias_7,
    layer_1_output_bias_8,
    layer_1_output_bias_9,
    layer_1_output_bias_10,
    layer_1_output_bias_11,
    layer_1_output_bias_12,
    layer_1_output_bias_13,
    layer_1_output_bias_14,
    layer_1_output_bias_15,
    layer_1_output_bias_16,
    layer_1_output_bias_17,
    layer_1_output_bias_18,
    layer_1_output_bias_19,
    layer_1_output_bias_20;

    // leaky
    output wire [2*OUTPUT_BUT_SIZE-1:0] layer_1_output_leaky_1, layer_1_output_leaky_2,
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

    
    
    wire done_bias,done_leaky;
    
    // multiply
    
    Layer_1_matrix_multiply #(.LAYER_1_INPUT_SIZE(LAYER_1_INPUT_SIZE),.OUTPUT_BUT_SIZE(OUTPUT_BUT_SIZE), .SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE), .WEIGHT_DATA_LOCATION(WEIGHT_DATA_LOCATION)) dut (.layer_1_input(layer_1_input), .load(load), .clk(clk), .reset(reset), .done(done),
    .layer_1_output_1(layer_1_output_1),
    .layer_1_output_2(layer_1_output_2),
    .layer_1_output_3(layer_1_output_3),
    .layer_1_output_4(layer_1_output_4),
    .layer_1_output_5(layer_1_output_5),
    .layer_1_output_6(layer_1_output_6),
    .layer_1_output_7(layer_1_output_7),
    .layer_1_output_8(layer_1_output_8),
    .layer_1_output_9(layer_1_output_9),
    .layer_1_output_10(layer_1_output_10),
    .layer_1_output_11(layer_1_output_11),
    .layer_1_output_12(layer_1_output_12),
    .layer_1_output_13(layer_1_output_13),
    .layer_1_output_14(layer_1_output_14),
    .layer_1_output_15(layer_1_output_15),
    .layer_1_output_16(layer_1_output_16),
    .layer_1_output_17(layer_1_output_17),
    .layer_1_output_18(layer_1_output_18),
    .layer_1_output_19(layer_1_output_19),
    .layer_1_output_20(layer_1_output_20));

    // add bias
    // BIAS_SIZE and SIGN_BIT_SIZE is extra bits required for the bias data
    layer_1_bias_add #(.SIZE(OUTPUT_BUT_SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE), .BIAS_SIZE(BIAS_SIZE), .BIAS_DATA_LOCATION(BIAS_DATA_LOCATION)) dut1(
    .layer_1_input_1(layer_1_output_1),
    .layer_1_input_2(layer_1_output_2),
    .layer_1_input_3(layer_1_output_3),
    .layer_1_input_4(layer_1_output_4),
    .layer_1_input_5(layer_1_output_5),
    .layer_1_input_6(layer_1_output_6),
    .layer_1_input_7(layer_1_output_7),
    .layer_1_input_8(layer_1_output_8),
    .layer_1_input_9(layer_1_output_9),
    .layer_1_input_10(layer_1_output_10),
    .layer_1_input_11(layer_1_output_11),
    .layer_1_input_12(layer_1_output_12),
    .layer_1_input_13(layer_1_output_13),
    .layer_1_input_14(layer_1_output_14),
    .layer_1_input_15(layer_1_output_15),
    .layer_1_input_16(layer_1_output_16),
    .layer_1_input_17(layer_1_output_17),
    .layer_1_input_18(layer_1_output_18),
    .layer_1_input_19(layer_1_output_19),
    .layer_1_input_20(layer_1_output_20),
    .load(done), .clk(clk), .reset(reset), .done(done_bias),
    .layer_1_output_1(layer_1_output_bias_1),
    .layer_1_output_2(layer_1_output_bias_2),
    .layer_1_output_3(layer_1_output_bias_3),
    .layer_1_output_4(layer_1_output_bias_4),
    .layer_1_output_5(layer_1_output_bias_5),
    .layer_1_output_6(layer_1_output_bias_6),
    .layer_1_output_7(layer_1_output_bias_7),
    .layer_1_output_8(layer_1_output_bias_8),
    .layer_1_output_9(layer_1_output_bias_9),
    .layer_1_output_10(layer_1_output_bias_10),
    .layer_1_output_11(layer_1_output_bias_11),
    .layer_1_output_12(layer_1_output_bias_12),
    .layer_1_output_13(layer_1_output_bias_13),
    .layer_1_output_14(layer_1_output_bias_14),
    .layer_1_output_15(layer_1_output_bias_15),
    .layer_1_output_16(layer_1_output_bias_16),
    .layer_1_output_17(layer_1_output_bias_17),
    .layer_1_output_18(layer_1_output_bias_18),
    .layer_1_output_19(layer_1_output_bias_19),
    .layer_1_output_20(layer_1_output_bias_20));
    
    // add leaky layer
    // SIZE is to specify the size of the incoming bits and
    // SIGN_BIT_SIZE is the number of bits in this which are sign for 
    // correct calculations.
    layer_1_leaky_relu #(.SIZE(OUTPUT_BUT_SIZE),.SIGN_BIT_SIZE(2*SIGN_BIT_SIZE)) dut2 (
     .layer_1_input_1(layer_1_output_bias_1),
    .layer_1_input_2(layer_1_output_bias_2),
    .layer_1_input_3(layer_1_output_bias_3),
    .layer_1_input_4(layer_1_output_bias_4),
    .layer_1_input_5(layer_1_output_bias_5),
    .layer_1_input_6(layer_1_output_bias_6),
    .layer_1_input_7(layer_1_output_bias_7),
    .layer_1_input_8(layer_1_output_bias_8),
    .layer_1_input_9(layer_1_output_bias_9),
    .layer_1_input_10(layer_1_output_bias_10),
    .layer_1_input_11(layer_1_output_bias_11),
    .layer_1_input_12(layer_1_output_bias_12),
    .layer_1_input_13(layer_1_output_bias_13),
    .layer_1_input_14(layer_1_output_bias_14),
    .layer_1_input_15(layer_1_output_bias_15),
    .layer_1_input_16(layer_1_output_bias_16),
    .layer_1_input_17(layer_1_output_bias_17),
    .layer_1_input_18(layer_1_output_bias_18),
    .layer_1_input_19(layer_1_output_bias_19),
    .layer_1_input_20(layer_1_output_bias_20),
    .load(done_bias), .clk(clk), .reset(reset), .done(done_leaky),
    .layer_1_output_1(layer_1_output_leaky_1),
    .layer_1_output_2(layer_1_output_leaky_2),
    .layer_1_output_3(layer_1_output_leaky_3),
    .layer_1_output_4(layer_1_output_leaky_4),
    .layer_1_output_5(layer_1_output_leaky_5),
    .layer_1_output_6(layer_1_output_leaky_6),
    .layer_1_output_7(layer_1_output_leaky_7),
    .layer_1_output_8(layer_1_output_leaky_8),
    .layer_1_output_9(layer_1_output_leaky_9),
    .layer_1_output_10(layer_1_output_leaky_10),
    .layer_1_output_11(layer_1_output_leaky_11),
    .layer_1_output_12(layer_1_output_leaky_12),
    .layer_1_output_13(layer_1_output_leaky_13),
    .layer_1_output_14(layer_1_output_leaky_14),
    .layer_1_output_15(layer_1_output_leaky_15),
    .layer_1_output_16(layer_1_output_leaky_16),
    .layer_1_output_17(layer_1_output_leaky_17),
    .layer_1_output_18(layer_1_output_leaky_18),
    .layer_1_output_19(layer_1_output_leaky_19),
    .layer_1_output_20(layer_1_output_leaky_20));
    
    assign done_complete = done_leaky;
    
endmodule
