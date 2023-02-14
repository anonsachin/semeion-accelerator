`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 17:21:57
// Design Name: 
// Module Name: layer_2_bias_add
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


module layer_2_bias_add(
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

    parameter SIZE = 16;
    parameter BIAS_SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    parameter BIAS_DATA_LOCATION = "C:/Users/sachi/Downloads/bias_23.mem";
    // PORT SETUP
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

    output reg [SIZE -1:0] layer_2_output_1,
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

    reg [BIAS_SIZE - 1:0] biases [0:9];

    initial
    begin 
    $readmemb(BIAS_DATA_LOCATION,biases);
    end
    
    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            layer_2_output_1 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[0][BIAS_SIZE-1]}},biases[0],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_2 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[1][BIAS_SIZE-1]}},biases[1],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_3 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[2][BIAS_SIZE-1]}},biases[2],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_4 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[3][BIAS_SIZE-1]}},biases[3],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_5 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[4][BIAS_SIZE-1]}},biases[4],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_6 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[5][BIAS_SIZE-1]}},biases[5],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_7 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[6][BIAS_SIZE-1]}},biases[6],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_8 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[7][BIAS_SIZE-1]}},biases[7],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_9 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[8][BIAS_SIZE-1]}},biases[8],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_2_output_10 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[9][BIAS_SIZE-1]}},biases[9],{(SIGN_BIT_SIZE-4){1'b0}}};
        
        end else begin
            if (load) begin
                layer_2_output_1 <= layer_2_output_1 + layer_2_input_1;
                layer_2_output_2 <= layer_2_output_2 + layer_2_input_2;
                layer_2_output_3 <= layer_2_output_3 + layer_2_input_3;
                layer_2_output_4 <= layer_2_output_4 + layer_2_input_4;
                layer_2_output_5 <= layer_2_output_5 + layer_2_input_5;
                layer_2_output_6 <= layer_2_output_6 + layer_2_input_6;
                layer_2_output_7 <= layer_2_output_7 + layer_2_input_7;
                layer_2_output_8 <= layer_2_output_8 + layer_2_input_8;
                layer_2_output_9 <= layer_2_output_9 + layer_2_input_9;
                layer_2_output_10 <= layer_2_output_10 + layer_2_input_10;

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
