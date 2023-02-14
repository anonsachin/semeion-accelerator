`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 22:28:28
// Design Name: 
// Module Name: max_of_10
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


module max_of_10(
    layer_2_output_leaky_1, layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10,
    clk,load,reset, done,
    max
    );
    //port setup
    parameter INPUT_SIZE = 81;
    input [INPUT_SIZE-1:0] layer_2_output_leaky_1, layer_2_output_leaky_2, 
    layer_2_output_leaky_3,
    layer_2_output_leaky_4,
    layer_2_output_leaky_5,
    layer_2_output_leaky_6,
    layer_2_output_leaky_7,
    layer_2_output_leaky_8,
    layer_2_output_leaky_9,
    layer_2_output_leaky_10;
    input clk,load,reset;
    output reg done;
    output reg [3:0] max;
    
    // intermediate signals
    reg [INPUT_SIZE-1:0] intermediadte_1,intermediadte_2;
    reg [INPUT_SIZE-1:0] store[0:7];
    reg done_r;
    
    always @(posedge clk)begin
        if (reset)begin
            done_r <= 0;
            intermediadte_1 <= 0;
            intermediadte_2 <= 0;
            store[0] <= 0;
            store[1] <= 0;
            store[2] <= 0;
            store[3] <= 0;
            store[4] <= 0;
            store[5] <= 0;
            store[6] <= 0;
            store[7] <= 0;
        end else begin
            if (load)begin
                done_r <= 1;
                intermediadte_1 <= layer_2_output_leaky_1;
                intermediadte_2 <= layer_2_output_leaky_2;
                store[0] <= layer_2_output_leaky_3;
                store[1] <= layer_2_output_leaky_4;
                store[2] <= layer_2_output_leaky_5;
                store[3] <= layer_2_output_leaky_6;
                store[4] <= layer_2_output_leaky_7;
                store[5] <= layer_2_output_leaky_8;
                store[6] <= layer_2_output_leaky_9;
                store[7] <= layer_2_output_leaky_10;
            end else begin
                    intermediadte_1 <= intermediadte_1;
                    intermediadte_2 <= intermediadte_2;
                    done_r <= 0;
                    store[0] <= layer_2_output_leaky_3;
                    store[1] <= layer_2_output_leaky_4;
                    store[2] <= layer_2_output_leaky_5;
                    store[3] <= layer_2_output_leaky_6;
                    store[4] <= layer_2_output_leaky_7;
                    store[5] <= layer_2_output_leaky_8;
                    store[6] <= layer_2_output_leaky_9;
                    store[7] <= layer_2_output_leaky_10;
            end
        end
    end
    
    wire greater_1, greater_2, greater_3, greater_4, greater_5, greater_6, greater_7, greater_8, greater_9;
    wire [INPUT_SIZE-1:0] interim_1, interim_2, interim_3, interim_4, interim_5, interim_6, interim_7, interim_8;
    wire [3:0] max_interim_1,  max_interim_2,  max_interim_3,  max_interim_4,  max_interim_5,  max_interim_6,  max_interim_7,  max_interim_8;
    
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g0 (.input_1(intermediadte_1), .input_2(intermediadte_2), .greater(greater_1));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g1 (.input_1(interim_1), .input_2(store[0]), .greater(greater_2));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g2 (.input_1(interim_2), .input_2(store[1]), .greater(greater_3));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g3 (.input_1(interim_3), .input_2(store[2]), .greater(greater_4));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g4 (.input_1(interim_4), .input_2(store[3]), .greater(greater_5));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g5 (.input_1(interim_5), .input_2(store[4]), .greater(greater_6));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g6 (.input_1(interim_6), .input_2(store[5]), .greater(greater_7));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g7 (.input_1(interim_7), .input_2(store[6]), .greater(greater_8));
    greater_than_signed_lookahead #(.SIZE(INPUT_SIZE)) g8 (.input_1(interim_8), .input_2(store[7]), .greater(greater_9));
    
    assign interim_1 = greater_1 ? intermediadte_1 : intermediadte_2;
    assign interim_2 = greater_2 ? interim_1 : store[0];
    assign interim_3 = greater_3 ? interim_2 : store[1];
    assign interim_4 = greater_4 ? interim_3 : store[2];
    assign interim_5 = greater_5 ? interim_4 : store[3];
    assign interim_6 = greater_6 ? interim_5 : store[4];
    assign interim_7 = greater_7 ? interim_6 : store[5];
    assign interim_8 = greater_8 ? interim_7 : store[6];
    
    assign  max_interim_1 = greater_1 ? 4'd1 : 4'd2;
    assign  max_interim_2 = greater_2 ? max_interim_1 : 4'd3;
    assign  max_interim_3 = greater_3 ? max_interim_2 : 4'd4;
    assign  max_interim_4 = greater_4 ? max_interim_3 : 4'd5;
    assign  max_interim_5 = greater_5 ? max_interim_4 : 4'd6;
    assign  max_interim_6 = greater_6 ? max_interim_5 : 4'd7;
    assign  max_interim_7 = greater_7 ? max_interim_6 : 4'd8;
    assign  max_interim_8 = greater_8 ? max_interim_7 : 4'd9;
    
    always @(posedge clk)begin
        if (reset)begin
            done <= 0;
            max <= 0;
        end else begin
            if (done_r)begin
                done <= 1;
                max <= greater_9 ? max_interim_8 : 4'd10;
            end else begin
                done <= 0;
                max <= max;
            end
        end
    end
    
endmodule
