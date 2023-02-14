`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 14:59:30
// Design Name: 
// Module Name: Layer_1_matrix_multiply
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


module Layer_1_matrix_multiply(
    layer_1_input, load, clk, reset, done,
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
    
    parameter LAYER_1_INPUT_SIZE = 256;
    parameter OUTPUT_BUT_SIZE = 16;
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
    parameter WEIGHT_DATA_LOCATION = "C:/Users/sachi/Downloads/weight_12.mem";
    
    input load, clk, reset, done;
    input [LAYER_1_INPUT_SIZE -1:0] layer_1_input;
    output [OUTPUT_BUT_SIZE-1:0] layer_1_output_1, layer_1_output_2,
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
    
    // martix weights
    reg [SIZE - 1:0] weights [0:19][0:LAYER_1_INPUT_SIZE-1];
    
    // address and control lines
    wire [$clog2(LAYER_1_INPUT_SIZE)-1:0] addr;
    reg load_reg;
    // the valid signal is for accumulate
    wire valid,mask,done_input;
    wire [3:0] valid_out;
    wire [LAYER_1_INPUT_SIZE -1:0] shift_out;
    
    initial
    begin 
    $readmemb(WEIGHT_DATA_LOCATION,weights);
    end
    
    // passing load signal through flop
    // to offset asynchrounous fall of load
    always @(posedge clk) begin
        if (reset) begin
            load_reg <= 0;
        end else begin
            load_reg <= load;
        end
    end
    
    // counter for address and valid signal during counting
    counter_with_valid #(.LIMIT(LAYER_1_INPUT_SIZE)) addr_count(.clk(clk), .count(addr), .reset(reset), .load(load), .valid(valid));
    
    // shifted input msb assigned as mask
    shift_n_bit_synchronous_left #(.SIZE(LAYER_1_INPUT_SIZE)) SHIFT1 (.shift_input(layer_1_input), .shift_output(shift_out), .clk(clk), .reset(reset), .load(load));
    assign mask = shift_out[255];
    
    // single bit multiplier
    
    layer_1_5_multiply #(.SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l1 (.vector_input_1(weights[0][addr]), 
    .vector_input_2((weights[1][addr])), .vector_input_3(weights[2][addr]), .vector_input_4(weights[3][addr]), 
    .vector_input_5(weights[4][addr]), .mask_input(mask), .clk(clk), .load(valid), .reset(reset), .accumulate(valid), 
    .accumulate_1(layer_1_output_1), .accumulate_2(layer_1_output_2), .accumulate_3(layer_1_output_3), .accumulate_4(layer_1_output_4), .accumulate_5(layer_1_output_5),
    .accumulate_signal(valid_out[0]));
    
    layer_1_5_multiply #(.SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l2 (.vector_input_1(weights[5][addr]), 
    .vector_input_2((weights[6][addr])), .vector_input_3(weights[7][addr]), .vector_input_4(weights[8][addr]), 
    .vector_input_5(weights[9][addr]), .mask_input(mask), .clk(clk), .load(valid), .reset(reset), .accumulate(valid), 
    .accumulate_1(layer_1_output_6), .accumulate_2(layer_1_output_7), .accumulate_3(layer_1_output_8), .accumulate_4(layer_1_output_9), .accumulate_5(layer_1_output_10),
    .accumulate_signal(valid_out[1]));
    
    layer_1_5_multiply #(.SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l3 (.vector_input_1(weights[10][addr]), 
    .vector_input_2((weights[11][addr])), .vector_input_3(weights[12][addr]), .vector_input_4(weights[13][addr]), 
    .vector_input_5(weights[14][addr]), .mask_input(mask), .clk(clk), .load(valid), .reset(reset), .accumulate(valid), 
    .accumulate_1(layer_1_output_11), .accumulate_2(layer_1_output_12), .accumulate_3(layer_1_output_13), .accumulate_4(layer_1_output_14), .accumulate_5(layer_1_output_15),
    .accumulate_signal(valid_out[2]));
    
    layer_1_5_multiply #(.SIZE(SIZE), .SIGN_BIT_SIZE(SIGN_BIT_SIZE)) l4 (.vector_input_1(weights[15][addr]), 
    .vector_input_2((weights[16][addr])), .vector_input_3(weights[17][addr]), .vector_input_4(weights[18][addr]), 
    .vector_input_5(weights[19][addr]), .mask_input(mask), .clk(clk), .load(valid), .reset(reset), .accumulate(valid), 
    .accumulate_1(layer_1_output_16), .accumulate_2(layer_1_output_17), .accumulate_3(layer_1_output_18), .accumulate_4(layer_1_output_19), .accumulate_5(layer_1_output_20),
    .accumulate_signal(valid_out[3]));
    
    // done calculator
    assign done_input = (&valid_out) & (~load_reg);
    // convert a high to low as a pulse
    level_to_pulse_fall pulse_generator (.level_input(done_input), .pulse_output(done), .clk(clk), .reset(reset));
        
endmodule

module counter_with_valid( clk, count, reset, load, valid);
    
    parameter LIMIT = 256;
    input clk, reset, load;
    output reg valid;
    output reg [$clog2(LIMIT):0] count;
    
    always @(posedge clk) begin
        if (reset) begin
            count <=0;
            valid <= 0;
        end else begin
            if (load) begin
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
    end

endmodule

module shift_n_bit_synchronous_left(
    shift_input, shift_output, clk, load, reset
    );
    
    parameter SIZE = 8;
    parameter TIMES = 1;
    
    input clk, load, reset;
    input [SIZE-1:0] shift_input;
    output reg [SIZE-1:0] shift_output;
    
    always @(posedge clk) begin
        if (reset) begin
            shift_output <= 0;
        end else begin
            if (load) begin
                shift_output <= shift_input;
            end else begin
                shift_output <= shift_output << TIMES;
            end
        end
    end

endmodule

module level_to_pulse_fall(
    level_input, pulse_output, clk, reset
    );
    
    input level_input, clk, reset;
    output reg pulse_output;
    
    reg level_reg;
    
    always @(posedge clk) begin
        if (reset) begin
            pulse_output <= 0;
            level_reg <= 0;
        end else begin
            level_reg <= level_input;
            pulse_output <= level_reg & ~level_input;
        end
    end
    
endmodule
