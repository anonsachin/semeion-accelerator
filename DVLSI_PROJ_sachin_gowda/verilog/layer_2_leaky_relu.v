`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 19:01:11
// Design Name: 
// Module Name: layer_2_leaky_relu
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


module layer_2_leaky_relu(
    layer_2_input_1,
    layer_2_input_2,
    layer_2_input_3,
    layer_2_input_4,
    layer_2_input_5,
    layer_2_input_6,
    layer_2_input_7,
    layer_2_input_8,
    layer_2_input_9,
    layer_2_input_10,
    load, clk, reset,done,
    layer_2_output_1,
    layer_2_output_2,
    layer_2_output_3,
    layer_2_output_4,
    layer_2_output_5,
    layer_2_output_6,
    layer_2_output_7,
    layer_2_output_8,
    layer_2_output_9,
    layer_2_output_10
    );

    parameter SIZE = 41;
    parameter SIGN_BIT_SIZE = 20;

    input load, clk, reset;
    input [SIZE -1:0] layer_2_input_1,
    layer_2_input_2,
    layer_2_input_3,
    layer_2_input_4,
    layer_2_input_5,
    layer_2_input_6,
    layer_2_input_7,
    layer_2_input_8,
    layer_2_input_9,
    layer_2_input_10;

    output reg [2*SIZE -1:0] layer_2_output_1,
    layer_2_output_2,
    layer_2_output_3,
    layer_2_output_4,
    layer_2_output_5,
    layer_2_output_6,
    layer_2_output_7,
    layer_2_output_8,
    layer_2_output_9,
    layer_2_output_10;
    output reg done;

    // intermediate wires
    wire [2*SIZE -1:0] layer_2_output_w_1,
    layer_2_output_w_2,
    layer_2_output_w_3,
    layer_2_output_w_4,
    layer_2_output_w_5,
    layer_2_output_w_6,
    layer_2_output_w_7,
    layer_2_output_w_8,
    layer_2_output_w_9,
    layer_2_output_w_10;

    // leaky relu calculations
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l1 (.input_value(layer_2_input_1), .output_value(layer_2_output_w_1));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l2 (.input_value(layer_2_input_2), .output_value(layer_2_output_w_2));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l3 (.input_value(layer_2_input_3), .output_value(layer_2_output_w_3));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l4 (.input_value(layer_2_input_4), .output_value(layer_2_output_w_4));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l5 (.input_value(layer_2_input_5), .output_value(layer_2_output_w_5));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l6 (.input_value(layer_2_input_6), .output_value(layer_2_output_w_6));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l7 (.input_value(layer_2_input_7), .output_value(layer_2_output_w_7));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l8 (.input_value(layer_2_input_8), .output_value(layer_2_output_w_8));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l9 (.input_value(layer_2_input_9), .output_value(layer_2_output_w_9));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l10 (.input_value(layer_2_input_10), .output_value(layer_2_output_w_10));

    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            layer_2_output_1 <= 0;
            layer_2_output_2 <= 0;
            layer_2_output_3 <= 0;
            layer_2_output_4 <= 0;
            layer_2_output_5 <= 0;
            layer_2_output_6 <= 0;
            layer_2_output_7 <= 0;
            layer_2_output_8 <= 0;
            layer_2_output_9 <= 0;
            layer_2_output_10 <= 0;
        
        end else begin
            if (load) begin
                layer_2_output_1 <= layer_2_output_w_1;
                layer_2_output_2 <= layer_2_output_w_2;
                layer_2_output_3 <= layer_2_output_w_3;
                layer_2_output_4 <= layer_2_output_w_4;
                layer_2_output_5 <= layer_2_output_w_5;
                layer_2_output_6 <= layer_2_output_w_6;
                layer_2_output_7 <= layer_2_output_w_7;
                layer_2_output_8 <= layer_2_output_w_8;
                layer_2_output_9 <= layer_2_output_w_9;
                layer_2_output_10 <= layer_2_output_w_10;
                

                done <= load;
            end else begin
                layer_2_output_1 <= layer_2_output_1 ;
                layer_2_output_2 <= layer_2_output_2 ;
                layer_2_output_3 <= layer_2_output_3 ;
                layer_2_output_4 <= layer_2_output_4 ;
                layer_2_output_5 <= layer_2_output_5 ;
                layer_2_output_6 <= layer_2_output_6 ;
                layer_2_output_7 <= layer_2_output_7 ;
                layer_2_output_8 <= layer_2_output_8 ;
                layer_2_output_9 <= layer_2_output_9 ;
                layer_2_output_10 <= layer_2_output_10 ;

                done <= 0;
            end
        end
    end
endmodule
