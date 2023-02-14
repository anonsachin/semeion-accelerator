`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 23:49:21
// Design Name: 
// Module Name: full_neural_network_tb
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


module full_neural_network_tb(

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
    wire done;
    wire [3:0] max;
    
    full_neural_network_v1 #(.LAYER_1_INPUT_SIZE(LAYER_1_INPUT_SIZE), .OUTPUT_BUT_SIZE(OUTPUT_BUT_SIZE), .SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE),
    .BIAS_SIZE_L1(BIAS_SIZE_L1), .BIAS_DATA_LOCATION_L1(BIAS_DATA_LOCATION_L1), .WEIGHT_DATA_LOCATION_L1(WEIGHT_DATA_LOCATION_L1),
    .LEAKY_LAYER_SIZE(LEAKY_LAYER_SIZE), .WEIGHT_SIZE(WEIGHT_SIZE), .WEIGHT_DATA_LOCATION(WEIGHT_DATA_LOCATION),
     .INPUT_VECTOR_SIZE(INPUT_VECTOR_SIZE), .l2_SIZE(l2_SIZE), .BIAS_SIZE(BIAS_SIZE), .l2_SIGN_BIT_SIZE(l2_SIGN_BIT_SIZE),
     .BIAS_DATA_LOCATION(BIAS_DATA_LOCATION), .MAX_INPUT_SIZE(MAX_INPUT_SIZE)) dut (
    layer_1_input,
    load, clk, reset,
    done, max
    );
    
    // image data
    reg [265:0] images [0:9];
    reg [265:0] data;
    
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
