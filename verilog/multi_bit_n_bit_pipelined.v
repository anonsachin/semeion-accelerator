`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 23:08:48
// Design Name: 
// Module Name: multi_bit_n_bit_pipelined
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


module multi_bit_n_bit_pipelined(
    multiplier, multiplicand, product, clk, load, reset, load_out
    );
    
     parameter MULTIPLIER_SIZE = 4;
     parameter MULTIPLICAND_SIZE = 4;
    input [MULTIPLIER_SIZE-1:0] multiplier;
    input [MULTIPLICAND_SIZE-1:0] multiplicand;
    input clk,load,reset;
    
    wire [MULTIPLIER_SIZE -1:0] partial_prod [MULTIPLICAND_SIZE -1:0];
    wire [MULTIPLIER_SIZE -1:0] partial_sum[MULTIPLICAND_SIZE -2:0];
    wire [MULTIPLICAND_SIZE -2:0] partial_carry;
    output reg [(MULTIPLICAND_SIZE+MULTIPLIER_SIZE)-1:0] product;
    output reg load_out;
    wire [(MULTIPLICAND_SIZE+MULTIPLIER_SIZE)-1:0] product_w;
    
    reg [MULTIPLIER_SIZE-1:0] multiplier_r;
    reg [MULTIPLICAND_SIZE-1:0] multiplicand_r;
    reg load_reg;
    
     // inputs
    always @(posedge clk) begin
        if(reset) begin
        multiplier_r <= 0;
        multiplicand_r <= 0;
        load_reg <= 0;
        end else begin
            if (load) begin
                multiplier_r <= multiplier;
                multiplicand_r <= multiplicand;
                load_reg <= load;
            end else begin
                multiplier_r <= multiplier_r;
                multiplicand_r <= multiplicand_r;
                load_reg <= 0;
            end
        end
    end
    
    genvar i;
    generate
    for( i = 0; i < MULTIPLICAND_SIZE; i = i+1 )begin
        single_bit_multiply #(.SIZE(MULTIPLIER_SIZE)) p0(.multiplier(multiplier), .multiplicand(multiplicand[i]), .product(partial_prod[i]));
    end
    endgenerate
   
    // intermediate sums
    
    generate
    for( i = 0; i <( MULTIPLICAND_SIZE - 1); i = i+1 )begin
        if ( i == 0)begin
        look_ahead_adder_n_bit #(.SIZE(MULTIPLIER_SIZE)) a0(.input_1({1'b0,partial_prod [i][MULTIPLIER_SIZE-1:1]}), .input_2(partial_prod[i+1]), .carry_in({1'b0}) , .sum(partial_sum[i]), .carry(partial_carry[i]));
        end
        else
        begin
        look_ahead_adder_n_bit #(.SIZE(MULTIPLIER_SIZE)) a0(.input_1({partial_carry[i-1],partial_sum [i-1][MULTIPLIER_SIZE-1:1]}), .input_2(partial_prod[i+1]), .carry_in({1'b0}) , .sum(partial_sum[i]), .carry(partial_carry[i]));
        end
    end
    endgenerate
    
    assign product_w[0] = partial_prod [0][0];
    
    generate
    for( i = 0; i <= MULTIPLICAND_SIZE-2; i = i+1 )begin
        if ( i == MULTIPLICAND_SIZE - 2) begin
        assign product_w[(MULTIPLICAND_SIZE+MULTIPLIER_SIZE)-1:MULTIPLICAND_SIZE-1] = {partial_carry[MULTIPLICAND_SIZE-2],partial_sum[MULTIPLICAND_SIZE-2]};
        end else begin
        assign product_w[i+1] = partial_sum[i][0];
        end
    end
    endgenerate
    
    always @(posedge clk) begin
        if(reset) begin
        product <= 0;
        load_out <= 0;
        end else begin
            if (load_reg) begin
                product <= product_w;
                load_out <= load_reg;
            end else begin
                product <= product;
                load_out <= 0;
            end
        end
    end
    
    
endmodule
