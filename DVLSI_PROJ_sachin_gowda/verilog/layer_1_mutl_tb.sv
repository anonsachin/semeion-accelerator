`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 16:44:56
// Design Name: 
// Module Name: layer_1_mutl_tb
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


module layer_1_mutl_tb(

    );
    
    parameter LAYER_1_INPUT_SIZE = 256;
    parameter OUTPUT_BUT_SIZE = 16;
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    
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
    
    wire done_complete;
    
    // complete multiply 
    layer_1_complete #(.LAYER_1_INPUT_SIZE(LAYER_1_INPUT_SIZE), .OUTPUT_BUT_SIZE(OUTPUT_BUT_SIZE), .SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE)) dut (layer_1_input, load, clk, reset, done_complete, layer_1_output_leaky_1, layer_1_output_leaky_2,
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
    layer_1_output_leaky_20);
    
    // image data
    reg [265:0] images [0:9];
    reg [265:0] data;
    
    always
    #5 clk = ~clk;
    
    initial
    begin
    $readmemb("C:/Users/sachi/playground/tabtonone/image_data.mem",images);
    data <= images[0];
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
