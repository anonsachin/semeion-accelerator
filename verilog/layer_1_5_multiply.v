`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 10:37:32
// Design Name: 
// Module Name: layer_1_5_multiply
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


module layer_1_5_multiply(
     vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5, mask_input, clk, load, reset, accumulate, accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5,accumulate_signal
    );
    
    parameter SIZE = 8;
    parameter SIGN_BIT_SIZE = 4;
     // port setup
     input [SIZE -1:0]  vector_input_1, vector_input_2, vector_input_3, vector_input_4, vector_input_5;
     input mask_input, accumulate, clk, load, reset;
     output reg [2*SIZE -1 :0]  accumulate_1, accumulate_2, accumulate_3, accumulate_4, accumulate_5;
     output accumulate_signal;
     
      // intermediate signals
     wire [SIZE -1 :0]  accumulate_1_w, accumulate_2_w, accumulate_3_w, accumulate_4_w, accumulate_5_w;
     reg [SIZE -1:0]  vector_input_1_reg, vector_input_2_reg, vector_input_3_reg, vector_input_4_reg, vector_input_5_reg;
     reg mask_input_reg ,accumulate_reg;
     
     // input flops
     always @(posedge clk) begin
        if (reset) begin
            mask_input_reg <= 0;
            accumulate_reg <= 0;
            vector_input_1_reg <= 0;
            vector_input_2_reg <= 0;
            vector_input_3_reg <= 0;
            vector_input_4_reg <= 0;
            vector_input_5_reg <= 0;
        end else begin
            if (load) begin
                mask_input_reg <= mask_input;
                accumulate_reg <= accumulate;
                vector_input_1_reg <= vector_input_1;
                vector_input_2_reg <= vector_input_2;
                vector_input_3_reg <= vector_input_3;
                vector_input_4_reg <= vector_input_4;
                vector_input_5_reg <= vector_input_5;
            end else begin
                mask_input_reg <= mask_input_reg;
                accumulate_reg <= 0;
                vector_input_1_reg <= vector_input_1_reg;
                vector_input_2_reg <= vector_input_2_reg;
                vector_input_3_reg <= vector_input_3_reg;
                vector_input_4_reg <= vector_input_4_reg;
                vector_input_5_reg <= vector_input_5_reg;
            end
        end
     end
    
//    // single bit multiplications
//    single_bit_multiply #(.SIZE(SIZE)) m1 (.multiplier(vector_input_1_reg), .multiplicand(mask_input_reg), .product(accumulate_1_w) );
//    single_bit_multiply #(.SIZE(SIZE)) m2 (.multiplier(vector_input_2_reg), .multiplicand(mask_input_reg), .product(accumulate_2_w) );
//    single_bit_multiply #(.SIZE(SIZE)) m3 (.multiplier(vector_input_3_reg), .multiplicand(mask_input_reg), .product(accumulate_3_w) );
//    single_bit_multiply #(.SIZE(SIZE)) m4 (.multiplier(vector_input_4_reg), .multiplicand(mask_input_reg), .product(accumulate_4_w) );
//    single_bit_multiply #(.SIZE(SIZE)) m5 (.multiplier(vector_input_5_reg), .multiplicand(mask_input_reg), .product(accumulate_5_w) );
    
    // a multiply by 1 in fixed point representation
    assign accumulate_1_w = mask_input_reg ? {{SIZE-SIGN_BIT_SIZE{vector_input_1_reg[SIZE-1]}},vector_input_1_reg,{SIGN_BIT_SIZE{1'b0}}} : 0;
    assign accumulate_2_w = mask_input_reg ? {{SIZE-SIGN_BIT_SIZE{vector_input_2_reg[SIZE-1]}},vector_input_1_reg,{SIGN_BIT_SIZE{1'b0}}} : 0;
    assign accumulate_3_w = mask_input_reg ? {{SIZE-SIGN_BIT_SIZE{vector_input_3_reg[SIZE-1]}},vector_input_1_reg,{SIGN_BIT_SIZE{1'b0}}} : 0;
    assign accumulate_4_w = mask_input_reg ? {{SIZE-SIGN_BIT_SIZE{vector_input_4_reg[SIZE-1]}},vector_input_1_reg,{SIGN_BIT_SIZE{1'b0}}} : 0;
    assign accumulate_5_w = mask_input_reg ? {{SIZE-SIGN_BIT_SIZE{vector_input_5_reg[SIZE-1]}},vector_input_1_reg,{SIGN_BIT_SIZE{1'b0}}} : 0;
    
    assign accumulate_signal = accumulate_reg;
    
    // output accumulator
    // THE 8 bit numbers are sign extended
//     accumulator #(.SIZE(2*SIZE)) a0 (.accumulator_input({{SIZE{accumulate_1_w[SIZE-1]}},accumulate_1_w}), .reset(reset), .clk(clk), .accumulator_output(accumulate_1), .valid(accumulate_reg));
//     accumulator #(.SIZE(2*SIZE)) a1 (.accumulator_input({{SIZE{accumulate_2_w[SIZE-1]}},accumulate_2_w}), .reset(reset), .clk(clk), .accumulator_output(accumulate_2), .valid(accumulate_reg));
//     accumulator #(.SIZE(2*SIZE)) a2 (.accumulator_input({{SIZE{accumulate_3_w[SIZE-1]}},accumulate_3_w}), .reset(reset), .clk(clk), .accumulator_output(accumulate_3), .valid(accumulate_reg));
//     accumulator #(.SIZE(2*SIZE)) a3 (.accumulator_input({{SIZE{accumulate_4_w[SIZE-1]}},accumulate_4_w}), .reset(reset), .clk(clk), .accumulator_output(accumulate_4), .valid(accumulate_reg));
//     accumulator #(.SIZE(2*SIZE)) a4 (.accumulator_input({{SIZE{accumulate_5_w[SIZE-1]}},accumulate_5_w}), .reset(reset), .clk(clk), .accumulator_output(accumulate_5), .valid(accumulate_reg));
     
     // accummulator
     always @(posedge clk) begin
        if (reset) begin
            accumulate_1 <= 0;
            accumulate_2 <= 0;
            accumulate_3 <= 0;
            accumulate_4 <= 0;
            accumulate_5 <= 0;
         end else begin
            if (accumulate_reg)begin
            // THE 8 bit numbers are sign extended
                accumulate_1 <= accumulate_1 + {{SIZE{accumulate_1_w[SIZE-1]}},accumulate_1_w};
                accumulate_2 <= accumulate_2 + {{SIZE{accumulate_2_w[SIZE-1]}},accumulate_2_w};
                accumulate_3 <= accumulate_3 + {{SIZE{accumulate_3_w[SIZE-1]}},accumulate_3_w};
                accumulate_4 <= accumulate_4 + {{SIZE{accumulate_4_w[SIZE-1]}},accumulate_4_w};
                accumulate_5 <= accumulate_5 + {{SIZE{accumulate_5_w[SIZE-1]}},accumulate_5_w};
            end else begin
                accumulate_1 <= accumulate_1;
                accumulate_2 <= accumulate_2;
                accumulate_3 <= accumulate_3;
                accumulate_4 <= accumulate_4;
                accumulate_5 <= accumulate_5;
            end
         end
    end
    
endmodule
