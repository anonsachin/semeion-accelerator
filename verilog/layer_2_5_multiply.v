`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 23:42:35
// Design Name: 
// Module Name: layer_2_5_multiply
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


module layer_2_5_multiply(
    vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5, multiply_input, clk, load, reset, accumulate, accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5,accumulate_signal
    );
    
     parameter VECTOR_SIZE = 8;
     parameter MULTIPLIER_SIZE = 8;
     // port setup
     input [VECTOR_SIZE -1:0]  vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5;
     input [MULTIPLIER_SIZE -1:0] multiply_input;
     input accumulate, clk, load, reset;
     output reg [(VECTOR_SIZE+MULTIPLIER_SIZE) :0]  accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5;
     output reg accumulate_signal;
     
     // intermediate signals
     wire [(VECTOR_SIZE+MULTIPLIER_SIZE) -1 :0]  accumulate_1_w, accumulate_2_w, accumulate_3_w, accumulate_4_w, accumulate_5_w;
     reg [VECTOR_SIZE -1:0]  vector_input_1_reg, vector_input_2_reg, vector_input_3_reg, vector_input_4_reg, vector_input_5_reg;
     reg accumulate_reg;
     reg [MULTIPLIER_SIZE -1:0] multiply_input_reg;
     wire [4:0] accumulate_reg_w;
     wire accumulate_and;
     
     // input flops
     always @(posedge clk) begin
        if (reset) begin
            multiply_input_reg <= 0;
            accumulate_reg <= 0;
            vector_input_1_reg <= 0;
            vector_input_2_reg <= 0;
            vector_input_3_reg <= 0;
            vector_input_4_reg <= 0;
            vector_input_5_reg <= 0;
        end else begin
            if (load) begin
                multiply_input_reg <= multiply_input;
                accumulate_reg <= accumulate;
                vector_input_1_reg <= vector_input_1;
                vector_input_2_reg <= vector_input_2;
                vector_input_3_reg <= vector_input_3;
                vector_input_4_reg <= vector_input_4;
                vector_input_5_reg <= vector_input_5;
            end else begin
                multiply_input_reg <= multiply_input_reg;
                accumulate_reg <= 0;
                vector_input_1_reg <= vector_input_1_reg;
                vector_input_2_reg <= vector_input_2_reg;
                vector_input_3_reg <= vector_input_3_reg;
                vector_input_4_reg <= vector_input_4_reg;
                vector_input_5_reg <= vector_input_5_reg;
            end
        end
     end
     
     multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(VECTOR_SIZE), .MULTIPLICAND_SIZE(MULTIPLIER_SIZE)) m1 (.multiplier(vector_input_1_reg), .multiplicand(multiply_input_reg), .product(accumulate_1_w), .clk(clk), .load(accumulate_reg), .reset(reset), .load_out(accumulate_reg_w[0]));
     multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(VECTOR_SIZE), .MULTIPLICAND_SIZE(MULTIPLIER_SIZE)) m2 (.multiplier(vector_input_2_reg), .multiplicand(multiply_input_reg), .product(accumulate_2_w), .clk(clk), .load(accumulate_reg), .reset(reset), .load_out(accumulate_reg_w[1]));
     multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(VECTOR_SIZE), .MULTIPLICAND_SIZE(MULTIPLIER_SIZE)) m3 (.multiplier(vector_input_3_reg), .multiplicand(multiply_input_reg), .product(accumulate_3_w), .clk(clk), .load(accumulate_reg), .reset(reset), .load_out(accumulate_reg_w[2]));
     multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(VECTOR_SIZE), .MULTIPLICAND_SIZE(MULTIPLIER_SIZE)) m4 (.multiplier(vector_input_4_reg), .multiplicand(multiply_input_reg), .product(accumulate_4_w), .clk(clk), .load(accumulate_reg), .reset(reset), .load_out(accumulate_reg_w[3]));
     multi_bit_n_bit_pipelined #(.MULTIPLIER_SIZE(VECTOR_SIZE), .MULTIPLICAND_SIZE(MULTIPLIER_SIZE)) m5 (.multiplier(vector_input_5_reg), .multiplicand(multiply_input_reg), .product(accumulate_5_w), .clk(clk), .load(accumulate_reg), .reset(reset), .load_out(accumulate_reg_w[4]));
     
     
     assign accumulate_and = & accumulate_reg_w;
     
     // accummulator
     always @(posedge clk) begin
        if (reset) begin
            accumulate_1 <= 0;
            accumulate_2 <= 0;
            accumulate_3 <= 0;
            accumulate_4 <= 0;
            accumulate_5 <= 0;
            accumulate_signal <= 0;
         end else begin
            if (accumulate_and)begin
            // THE 8 bit numbers are sign extended
                accumulate_1 <= accumulate_1 + {{{accumulate_1_w[(VECTOR_SIZE+MULTIPLIER_SIZE)-1]}},accumulate_1_w};
                accumulate_2 <= accumulate_2 + {{{accumulate_2_w[(VECTOR_SIZE+MULTIPLIER_SIZE)-1]}},accumulate_2_w};
                accumulate_3 <= accumulate_3 + {{{accumulate_3_w[(VECTOR_SIZE+MULTIPLIER_SIZE)-1]}},accumulate_3_w};
                accumulate_4 <= accumulate_4 + {{{accumulate_4_w[(VECTOR_SIZE+MULTIPLIER_SIZE)-1]}},accumulate_4_w};
                accumulate_5 <= accumulate_5 + {{{accumulate_5_w[(VECTOR_SIZE+MULTIPLIER_SIZE)-1]}},accumulate_5_w};
                accumulate_signal <= 1;
            end else begin
                accumulate_1 <= accumulate_1;
                accumulate_2 <= accumulate_2;
                accumulate_3 <= accumulate_3;
                accumulate_4 <= accumulate_4;
                accumulate_5 <= accumulate_5;
                accumulate_signal <= 0;
            end
         end
    end
     
     
endmodule