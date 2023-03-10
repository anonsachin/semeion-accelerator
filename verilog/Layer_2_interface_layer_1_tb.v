`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 16:04:50
// Design Name: 
// Module Name: Layer_2_interface_layer_1_tb
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


module Layer_2_interface_layer_1_tb(

    );
    
     parameter LAYER_1_INPUT_SIZE = 256;
    parameter OUTPUT_BUT_SIZE = 16;
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    parameter BIAS_SIZE_L1 = 8;
    parameter BIAS_DATA_LOCATION_L1 = "C:/Users/sachi/Downloads/bias_12.mem";
    parameter WEIGHT_DATA_LOCATION_L1 = "C:/Users/sachi/Downloads/weight_12.mem";
    
    // layer 2 params
    parameter LEAKY_LAYER_SIZE = 2*OUTPUT_BUT_SIZE;
    parameter WEIGHT_SIZE = 8;
    parameter WEIGHT_DATA_LOCATION = "C:/Users/sachi/Downloads/weight_23.mem";
    parameter INPUT_VECTOR_SIZE = 19;

    // layer 2 bias params
    parameter l2_SIZE = LEAKY_LAYER_SIZE+WEIGHT_SIZE+1;
    parameter BIAS_SIZE = 8;
    parameter l2_SIGN_BIT_SIZE = 20;
    parameter BIAS_DATA_LOCATION = "C:/Users/sachi/Downloads/bias_23.mem";
    
    // max
    parameter MAX_INPUT_SIZE = 2*(LEAKY_LAYER_SIZE+WEIGHT_SIZE)+1;
    
    reg load, clk, reset;
    reg [LAYER_1_INPUT_SIZE -1:0] layer_1_input;

    // leaky
    wire [2*OUTPUT_BUT_SIZE-1:0] layer_1_output_leaky_1, layer_1_output_leaky_2,
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
    
    wire done_complete, done_complete_2;
    wire done;
    wire [3:0] max;
    // leaky output
    wire [2*(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_leaky_1, layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10;
    
    // complete layer 1 
    layer_1_complete #(.LAYER_1_INPUT_SIZE(LAYER_1_INPUT_SIZE), .OUTPUT_BUT_SIZE(OUTPUT_BUT_SIZE), .SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE), .BIAS_SIZE(BIAS_SIZE_L1), .BIAS_DATA_LOCATION(BIAS_DATA_LOCATION_L1), .WEIGHT_DATA_LOCATION(WEIGHT_DATA_LOCATION_L1)) l1 (layer_1_input, load, clk, reset, done_complete, layer_1_output_leaky_1, layer_1_output_leaky_2,
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
    
    // complete layer 2
    layer_2_complete #(.LEAKY_LAYER_SIZE(LEAKY_LAYER_SIZE),.WEIGHT_SIZE(WEIGHT_SIZE),.WEIGHT_DATA_LOCATION(WEIGHT_DATA_LOCATION),.INPUT_VECTOR_SIZE(INPUT_VECTOR_SIZE),.BIAS_SIZE(BIAS_SIZE), .l2_SIGN_BIT_SIZE(l2_SIGN_BIT_SIZE),.BIAS_DATA_LOCATION(BIAS_DATA_LOCATION)) l2 (
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
    done_complete,clk,reset,done_complete_2,
    layer_2_output_leaky_1, 
    layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10);
    
    // max calculation
    max_of_10 #(.INPUT_SIZE(MAX_INPUT_SIZE)) max10 (
    layer_2_output_leaky_1, layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10,
    clk,done_complete_2,reset, done,
    max
    );
    
    // image data
    reg [265:0] images [0:9];
    reg [265:0] data;
    
    //l2 weigth
     // weights
    reg [WEIGHT_SIZE-1:0] weights [0:10*20-1];
    
    initial
    begin 
    $readmemb(WEIGHT_DATA_LOCATION,weights);
    end
    
    always
    #5 clk = ~clk;
    
    initial
    begin
    $readmemb("C:/Users/sachi/playground/tabtonone/image_data.mem",images);
    data <= images[4];
    layer_1_input <= 0;
    clk <= 1;
    reset <= 1;
    load <= 0;
    
    #8 reset <= 0;
    
    #10 
    layer_1_input <= data[265:10];
    load <= 1;
    
    #10 load <= 0;
    #3000 $finish;
    end
    
endmodule
