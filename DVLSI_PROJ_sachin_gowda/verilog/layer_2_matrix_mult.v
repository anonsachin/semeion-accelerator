`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 14:57:47
// Design Name: 
// Module Name: layer_2_matrix_mult
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


module layer_2_matrix_mult(
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
    load, clk, reset, done, layer_2_output_1, layer_2_output_2,
    layer_2_output_3,
    layer_2_output_4,
    layer_2_output_5,
    layer_2_output_6,
    layer_2_output_7,
    layer_2_output_8,
    layer_2_output_9,
    layer_2_output_10
    );
    parameter LEAKY_LAYER_SIZE = 32;
    parameter WEIGHT_SIZE = 8;
    parameter WEIGHT_DATA_LOCATION = "C:/Users/sachi/Downloads/weight_23.mem";
    parameter INPUT_VECTOR_SIZE = 20;
    
    input load, clk, reset;
    output reg done;
    input [LEAKY_LAYER_SIZE-1:0] layer_1_output_leaky_1, layer_1_output_leaky_2,
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
    
    output reg [(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_1, layer_2_output_2, 
    layer_2_output_3,
    layer_2_output_4,
    layer_2_output_5,
    layer_2_output_6,
    layer_2_output_7,
    layer_2_output_8,
    layer_2_output_9,
    layer_2_output_10;
    
    wire [(LEAKY_LAYER_SIZE+WEIGHT_SIZE):0] layer_2_output_1_w, layer_2_output_2_w, 
    layer_2_output_3_w,
    layer_2_output_4_w,
    layer_2_output_5_w,
    layer_2_output_6_w,
    layer_2_output_7_w,
    layer_2_output_8_w,
    layer_2_output_9_w,
    layer_2_output_10_w;
    
    // INTERMEDIATE STORES AND SIGNALS
    reg [LEAKY_LAYER_SIZE-1:0] leaky_store [0:19];
    reg load_reg;
    wire valid,done_input,done_w;
    wire [1:0] valid_out;
    
    // address
    wire [$clog2(INPUT_VECTOR_SIZE):0] addr;
    
    // weights
    reg [WEIGHT_SIZE-1:0] weights [0:9][0:19];
    
    initial
    begin 
    $readmemb(WEIGHT_DATA_LOCATION,weights);
    end
    
    // read inputs
    always @(posedge clk) begin
        if (reset) begin
        leaky_store[0] <= 0;
        leaky_store[1] <= 0;
        leaky_store[2] <= 0;
        leaky_store[3] <= 0;
        leaky_store[4] <= 0;
        leaky_store[5] <= 0;
        leaky_store[6] <= 0;
        leaky_store[7] <= 0;
        leaky_store[8] <= 0;
        leaky_store[9] <= 0;
        leaky_store[10] <= 0;
        leaky_store[11] <= 0;
        leaky_store[12] <= 0;
        leaky_store[13] <= 0;
        leaky_store[14] <= 0;
        leaky_store[15] <= 0;
        leaky_store[16] <= 0;
        leaky_store[17] <= 0;
        leaky_store[18] <= 0;
        leaky_store[19] <= 0;
        load_reg <= 0;
        end else begin
            if (load) begin
                leaky_store[0] <= layer_1_output_leaky_1;
                leaky_store[1] <= layer_1_output_leaky_2;
                leaky_store[2] <= layer_1_output_leaky_3;
                leaky_store[3] <= layer_1_output_leaky_4;
                leaky_store[4] <= layer_1_output_leaky_5;
                leaky_store[5] <= layer_1_output_leaky_6;
                leaky_store[6] <= layer_1_output_leaky_7;
                leaky_store[7] <= layer_1_output_leaky_8;
                leaky_store[8] <= layer_1_output_leaky_9;
                leaky_store[9] <= layer_1_output_leaky_10;
                leaky_store[10] <= layer_1_output_leaky_11;
                leaky_store[11] <= layer_1_output_leaky_12;
                leaky_store[12] <= layer_1_output_leaky_13;
                leaky_store[13] <= layer_1_output_leaky_14;
                leaky_store[14] <= layer_1_output_leaky_15;
                leaky_store[15] <= layer_1_output_leaky_16;
                leaky_store[16] <= layer_1_output_leaky_17;
                leaky_store[17] <= layer_1_output_leaky_18;
                leaky_store[18] <= layer_1_output_leaky_19;
                leaky_store[19] <= layer_1_output_leaky_20;
                load_reg <= 1;
            end else begin
                leaky_store[0] <= leaky_store[0];
                leaky_store[1] <= leaky_store[1];
                leaky_store[2] <= leaky_store[2];
                leaky_store[3] <= leaky_store[3];
                leaky_store[4] <= leaky_store[4];
                leaky_store[5] <= leaky_store[5];
                leaky_store[6] <= leaky_store[6];
                leaky_store[7] <= leaky_store[7];
                leaky_store[8] <= leaky_store[8];
                leaky_store[9] <= leaky_store[9];
                leaky_store[10] <= leaky_store[10];
                leaky_store[11] <= leaky_store[11];
                leaky_store[12] <= leaky_store[12];
                leaky_store[13] <= leaky_store[13];
                leaky_store[14] <= leaky_store[14];
                leaky_store[15] <= leaky_store[15];
                leaky_store[16] <= leaky_store[16];
                leaky_store[17] <= leaky_store[17];
                leaky_store[18] <= leaky_store[18];
                leaky_store[19] <= leaky_store[19];
                load_reg <= 0;
            end
        end
    end
    
    // counter for address and valid signal during counting
    counter #(.LIMIT(INPUT_VECTOR_SIZE)) addr_count(.clk(clk), .count(addr), .reset(load_reg), .valid(valid));
    
    
    // vector multiply
    layer_2_5_multiply #(.VECTOR_SIZE(WEIGHT_SIZE), .MULTIPLIER_SIZE(LEAKY_LAYER_SIZE)) l1 (.vector_input_1(weights[0][addr]), 
    .vector_input_2((weights[1][addr])), .vector_input_3(weights[2][addr]), .vector_input_4(weights[3][addr]), 
    .vector_input_5(weights[4][addr]), .multiply_input(leaky_store[addr]), .clk(clk), .load(valid), .reset(reset|load_reg), .accumulate(valid), 
    .accumulate_1(layer_2_output_1_w), .accumulate_2(layer_2_output_2_w), .accumulate_3(layer_2_output_3_w), .accumulate_4(layer_2_output_4_w), .accumulate_5(layer_2_output_5_w),
    .accumulate_signal(valid_out[0]));
    layer_2_5_multiply #(.VECTOR_SIZE(WEIGHT_SIZE), .MULTIPLIER_SIZE(LEAKY_LAYER_SIZE)) l2 (.vector_input_1(weights[5][addr]), 
    .vector_input_2((weights[6][addr])), .vector_input_3(weights[7][addr]), .vector_input_4(weights[8][addr]), 
    .vector_input_5(weights[9][addr]), .multiply_input(leaky_store[addr]), .clk(clk), .load(valid), .reset(reset|load_reg), .accumulate(valid), 
    .accumulate_1(layer_2_output_6_w), .accumulate_2(layer_2_output_7_w), .accumulate_3(layer_2_output_8_w), .accumulate_4(layer_2_output_9_w), .accumulate_5(layer_2_output_10_w),
    .accumulate_signal(valid_out[1]));
    
    assign done_input = (&valid_out) & (~load_reg);
    // convert a high to low as a pulse
    level_to_pulse_fall pulse_generator (.level_input(done_input), .pulse_output(done_w), .clk(clk), .reset(reset));
    
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
            if (done_w) begin
                done <= 1;
                layer_2_output_1 <= layer_2_output_1_w;
                layer_2_output_2 <= layer_2_output_2_w;
                layer_2_output_3 <= layer_2_output_3_w;
                layer_2_output_4 <= layer_2_output_4_w;
                layer_2_output_5 <= layer_2_output_5_w;
                layer_2_output_6 <= layer_2_output_6_w;
                layer_2_output_7 <= layer_2_output_7_w;
                layer_2_output_8 <= layer_2_output_8_w;
                layer_2_output_9 <= layer_2_output_9_w;
                layer_2_output_10 <= layer_2_output_10_w;
            end else begin
                done <= 0;
                layer_2_output_1 <= layer_2_output_1;
                layer_2_output_2 <= layer_2_output_2;
                layer_2_output_3 <= layer_2_output_3;
                layer_2_output_4 <= layer_2_output_4;
                layer_2_output_5 <= layer_2_output_5;
                layer_2_output_6 <= layer_2_output_6;
                layer_2_output_7 <= layer_2_output_7;
                layer_2_output_8 <= layer_2_output_8;
                layer_2_output_9 <= layer_2_output_9;
                layer_2_output_10 <= layer_2_output_10;
            end
        end
    end
    
    
endmodule

module counter( clk, count, reset, valid);
    
    parameter LIMIT = 256;
    input clk, reset;
    output reg valid;
    output reg [$clog2(LIMIT):0] count;
    
    always @(posedge clk) begin
        if (reset) begin
            count <=0;
            valid <= 0;
        end else begin
           if (count < LIMIT) begin
                    count <= count + 1;
                    valid <= 1;
           end else begin
                    count <= count;
                    valid <= 0;
           end
        end
    end

endmodule