`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 17:55:32
// Design Name: 
// Module Name: layer_1_bias_add
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


module layer_1_bias_add(
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
    parameter BIAS_SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    parameter BIAS_DATA_LOCATION = "C:/Users/sachi/Downloads/bias_12.mem";
    // PORT SETUP
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

    output reg [SIZE -1:0] layer_1_output_1,
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

    reg [BIAS_SIZE - 1:0] biases [0:19];

    initial
    begin 
    $readmemb(BIAS_DATA_LOCATION,biases);
    end
    
    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
            layer_1_output_1 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[0][BIAS_SIZE-1]}},biases[0],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_2 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[1][BIAS_SIZE-1]}},biases[1],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_3 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[2][BIAS_SIZE-1]}},biases[2],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_4 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[3][BIAS_SIZE-1]}},biases[3],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_5 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[4][BIAS_SIZE-1]}},biases[4],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_6 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[5][BIAS_SIZE-1]}},biases[5],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_7 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[6][BIAS_SIZE-1]}},biases[6],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_8 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[7][BIAS_SIZE-1]}},biases[7],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_9 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[8][BIAS_SIZE-1]}},biases[8],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_10 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[9][BIAS_SIZE-1]}},biases[9],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_11 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[10][BIAS_SIZE-1]}},biases[10],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_12 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[11][BIAS_SIZE-1]}},biases[11],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_13 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[12][BIAS_SIZE-1]}},biases[12],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_14 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[13][BIAS_SIZE-1]}},biases[13],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_15 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[14][BIAS_SIZE-1]}},biases[14],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_16 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[15][BIAS_SIZE-1]}},biases[15],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_17 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[16][BIAS_SIZE-1]}},biases[16],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_18 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[17][BIAS_SIZE-1]}},biases[17],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_19 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[18][BIAS_SIZE-1]}},biases[18],{(SIGN_BIT_SIZE-4){1'b0}}};
            layer_1_output_20 <= {{SIZE-(BIAS_SIZE+SIGN_BIT_SIZE-4){biases[19][BIAS_SIZE-1]}},biases[19],{(SIGN_BIT_SIZE-4){1'b0}}};
        
        end else begin
            if (load) begin
                layer_1_output_1 <= layer_1_output_1 + layer_1_input_1;
                layer_1_output_2 <= layer_1_output_2 + layer_1_input_2;
                layer_1_output_3 <= layer_1_output_3 + layer_1_input_3;
                layer_1_output_4 <= layer_1_output_4 + layer_1_input_4;
                layer_1_output_5 <= layer_1_output_5 + layer_1_input_5;
                layer_1_output_6 <= layer_1_output_6 + layer_1_input_6;
                layer_1_output_7 <= layer_1_output_7 + layer_1_input_7;
                layer_1_output_8 <= layer_1_output_8 + layer_1_input_8;
                layer_1_output_9 <= layer_1_output_9 + layer_1_input_9;
                layer_1_output_10 <= layer_1_output_10 + layer_1_input_10;
                layer_1_output_11 <= layer_1_output_11 + layer_1_input_11;
                layer_1_output_12 <= layer_1_output_12 + layer_1_input_12;
                layer_1_output_13 <= layer_1_output_13 + layer_1_input_13;
                layer_1_output_14 <= layer_1_output_14 + layer_1_input_14;
                layer_1_output_15 <= layer_1_output_15 + layer_1_input_15;
                layer_1_output_16 <= layer_1_output_16 + layer_1_input_16;
                layer_1_output_17 <= layer_1_output_17 + layer_1_input_17;
                layer_1_output_18 <= layer_1_output_18 + layer_1_input_18;
                layer_1_output_19 <= layer_1_output_19 + layer_1_input_19;
                layer_1_output_20 <= layer_1_output_20 + layer_1_input_20;

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
