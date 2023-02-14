`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 10:52:08
// Design Name: 
// Module Name: layer_1_signed_tb
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


module layer_1_signed_tb(

    );
    
    parameter SIZE = 8;
    reg [265:0] images [0:9];
    reg [265:0] data;
    reg [SIZE - 1:0] weights [0:19][0:255] ;
    integer i;
    

     // port setup
     reg [SIZE -1:0]  vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5;
     reg  valid, accumulate, clk, load, reset;
     wire [2*SIZE -1 :0]  accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5;
     reg [255:0] shift_input;
     wire [255:0] shift_output;
     wire mask_input, accumulate_signal;
     
     wire shift_load,shift_valid;
     
     // level to pulse control for shift
//     level_to_pulse valid_pulse(.level_input(valid), .pulse_output(shift_valid), .clk(clk), .reset(reset));
     level_to_pulse load_pulse(.level_input(load), .pulse_output(shift_load), .clk(clk), .reset(reset));
     
     // shifting a driving input
     shift_n_bit_synchronous #(.SIZE(256)) inp(.shift_input(shift_input), .shift_output(shift_output), .clk(clk), .load(shift_load), .reset(reset), .valid(valid));
     assign mask_input = shift_output[255];
     
     layer_1_5_multiply #(.SIZE(SIZE)) dut (vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5, mask_input, clk, load, reset, accumulate, accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5,accumulate_signal);
     
     always
    #5 clk <= ~clk;
    
    initial
    begin
    $readmemb("C:/Users/sachi/playground/tabtonone/image_data.mem",images);
    $readmemb("C:/Users/sachi/Downloads/weight_12.mem",weights);
    data <= images[0];
    clk <= 1;
    reset <= 1;
    load <= 0;
    valid <= 0;
    accumulate <= 0;
    vector_input_1 <= 0;
    vector_input_2 <= 0;
    vector_input_3 <= 0;
    vector_input_4 <= 0;
    vector_input_5 <= 0;
    shift_input <= 0;
    
    #8 reset <= 0;
    
    for (i =0; i < 256; i = i+1) begin
        #10 vector_input_1 <= weights[0][i];
         vector_input_2 <= weights[1][i];
         vector_input_3 <= weights[2][i];
         vector_input_4 <= weights[3][i];
         vector_input_5 <= weights[4][i];
         load <= 1;
         accumulate <= 1;
         shift_input <= data[265:10];
         valid <= 1;
    
    end
    
    #10 
    load <= 1;
    accumulate <= 0;
    valid <=0;
    
    #10
    load <= 0;
    #30 $finish;
    
    end
endmodule
