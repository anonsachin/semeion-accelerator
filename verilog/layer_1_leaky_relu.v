`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 19:47:11
// Design Name: 
// Module Name: layer_1_leaky_relu
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


module layer_1_leaky_relu(
    layer_1_input_1,
    layer_1_input_2,
    layer_1_input_3,
    layer_1_input_4,
    layer_1_input_5,
    layer_1_input_6,
    layer_1_input_7,
    layer_1_input_8,
    layer_1_input_9,
    layer_1_input_10,
    layer_1_input_11,
    layer_1_input_12,
    layer_1_input_13,
    layer_1_input_14,
    layer_1_input_15,
    layer_1_input_16,
    layer_1_input_17,
    layer_1_input_18,
    layer_1_input_19,
    layer_1_input_20,
    load, clk, reset,done,
    layer_1_output_1,
    layer_1_output_2,
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
    layer_1_output_20
    );

    parameter SIZE = 16;
    parameter SIGN_BIT_SIZE = 8;

    input load, clk, reset;
    input [SIZE -1:0] layer_1_input_1,
    layer_1_input_2,
    layer_1_input_3,
    layer_1_input_4,
    layer_1_input_5,
    layer_1_input_6,
    layer_1_input_7,
    layer_1_input_8,
    layer_1_input_9,
    layer_1_input_10,
    layer_1_input_11,
    layer_1_input_12,
    layer_1_input_13,
    layer_1_input_14,
    layer_1_input_15,
    layer_1_input_16,
    layer_1_input_17,
    layer_1_input_18,
    layer_1_input_19,
    layer_1_input_20;

    output reg [2*SIZE -1:0] layer_1_output_1,
    layer_1_output_2,
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
    output reg done;

    // intermediate wires
    wire [2*SIZE -1:0] layer_1_output_w_1,
    layer_1_output_w_2,
    layer_1_output_w_3,
    layer_1_output_w_4,
    layer_1_output_w_5,
    layer_1_output_w_6,
    layer_1_output_w_7,
    layer_1_output_w_8,
    layer_1_output_w_9,
    layer_1_output_w_10,
    layer_1_output_w_11,
    layer_1_output_w_12,
    layer_1_output_w_13,
    layer_1_output_w_14,
    layer_1_output_w_15,
    layer_1_output_w_16,
    layer_1_output_w_17,
    layer_1_output_w_18,
    layer_1_output_w_19,
    layer_1_output_w_20;

    // leaky relu calculations
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l1 (.input_value(layer_1_input_1), .output_value(layer_1_output_w_1));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l2 (.input_value(layer_1_input_2), .output_value(layer_1_output_w_2));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l3 (.input_value(layer_1_input_3), .output_value(layer_1_output_w_3));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l4 (.input_value(layer_1_input_4), .output_value(layer_1_output_w_4));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l5 (.input_value(layer_1_input_5), .output_value(layer_1_output_w_5));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l6 (.input_value(layer_1_input_6), .output_value(layer_1_output_w_6));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l7 (.input_value(layer_1_input_7), .output_value(layer_1_output_w_7));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l8 (.input_value(layer_1_input_8), .output_value(layer_1_output_w_8));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l9 (.input_value(layer_1_input_9), .output_value(layer_1_output_w_9));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l10 (.input_value(layer_1_input_10), .output_value(layer_1_output_w_10));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l11 (.input_value(layer_1_input_11), .output_value(layer_1_output_w_11));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l12 (.input_value(layer_1_input_12), .output_value(layer_1_output_w_12));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l13 (.input_value(layer_1_input_13), .output_value(layer_1_output_w_13));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l14 (.input_value(layer_1_input_14), .output_value(layer_1_output_w_14));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l15 (.input_value(layer_1_input_15), .output_value(layer_1_output_w_15));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l16 (.input_value(layer_1_input_16), .output_value(layer_1_output_w_16));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l17 (.input_value(layer_1_input_17), .output_value(layer_1_output_w_17));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l18 (.input_value(layer_1_input_18), .output_value(layer_1_output_w_18));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l19 (.input_value(layer_1_input_19), .output_value(layer_1_output_w_19));
    leaky_relu_signed #(.SIZE(SIZE),.SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l20 (.input_value(layer_1_input_20), .output_value(layer_1_output_w_20));

    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            layer_1_output_1 <= 0;
            layer_1_output_2 <= 0;
            layer_1_output_3 <= 0;
            layer_1_output_4 <= 0;
            layer_1_output_5 <= 0;
            layer_1_output_6 <= 0;
            layer_1_output_7 <= 0;
            layer_1_output_8 <= 0;
            layer_1_output_9 <= 0;
            layer_1_output_10 <= 0;
            layer_1_output_11 <= 0;
            layer_1_output_12 <= 0;
            layer_1_output_13 <= 0;
            layer_1_output_14 <= 0;
            layer_1_output_15 <= 0;
            layer_1_output_16 <= 0;
            layer_1_output_17 <= 0;
            layer_1_output_18 <= 0;
            layer_1_output_19 <= 0;
            layer_1_output_20 <= 0;
        
        end else begin
            if (load) begin
                layer_1_output_1 <= layer_1_output_w_1;
                layer_1_output_2 <= layer_1_output_w_2;
                layer_1_output_3 <= layer_1_output_w_3;
                layer_1_output_4 <= layer_1_output_w_4;
                layer_1_output_5 <= layer_1_output_w_5;
                layer_1_output_6 <= layer_1_output_w_6;
                layer_1_output_7 <= layer_1_output_w_7;
                layer_1_output_8 <= layer_1_output_w_8;
                layer_1_output_9 <= layer_1_output_w_9;
                layer_1_output_10 <= layer_1_output_w_10;
                layer_1_output_11 <= layer_1_output_w_11;
                layer_1_output_12 <= layer_1_output_w_12;
                layer_1_output_13 <= layer_1_output_w_13;
                layer_1_output_14 <= layer_1_output_w_14;
                layer_1_output_15 <= layer_1_output_w_15;
                layer_1_output_16 <= layer_1_output_w_16;
                layer_1_output_17 <= layer_1_output_w_17;
                layer_1_output_18 <= layer_1_output_w_18;
                layer_1_output_19 <= layer_1_output_w_19;
                layer_1_output_20 <= layer_1_output_w_20;
                

                done <= load;
            end else begin
                layer_1_output_1 <= layer_1_output_1 ;
                layer_1_output_2 <= layer_1_output_2 ;
                layer_1_output_3 <= layer_1_output_3 ;
                layer_1_output_4 <= layer_1_output_4 ;
                layer_1_output_5 <= layer_1_output_5 ;
                layer_1_output_6 <= layer_1_output_6 ;
                layer_1_output_7 <= layer_1_output_7 ;
                layer_1_output_8 <= layer_1_output_8 ;
                layer_1_output_9 <= layer_1_output_9 ;
                layer_1_output_10 <= layer_1_output_10 ;
                layer_1_output_11 <= layer_1_output_11 ;
                layer_1_output_12 <= layer_1_output_12 ;
                layer_1_output_13 <= layer_1_output_13 ;
                layer_1_output_14 <= layer_1_output_14 ;
                layer_1_output_15 <= layer_1_output_15 ;
                layer_1_output_16 <= layer_1_output_16 ;
                layer_1_output_17 <= layer_1_output_17 ;
                layer_1_output_18 <= layer_1_output_18 ;
                layer_1_output_19 <= layer_1_output_19 ;
                layer_1_output_20 <= layer_1_output_20 ;

                done <= 0;
            end
        end
    end

endmodule
