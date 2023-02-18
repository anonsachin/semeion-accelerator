`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 19:54:46
// Design Name: 
// Module Name: look_ahead_pass_through
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


module look_ahead_pass_through(
    input_1, input_2, carry_in , sum, carry, clk, reset, load, load_out, passthrough_in, passthrough_out
    );
    
    parameter SIZE = 8;
    parameter PASS_THROUGH_SIZE = 16;
    // SETUP ports
    //inputs
    input [SIZE-1:0] input_1,input_2;
    input carry_in, load, clk, reset;
    input [PASS_THROUGH_SIZE -1:0] passthrough_in;
    //outputs
    output reg [SIZE-1:0] sum;
    output reg carry, load_out;
    output reg [PASS_THROUGH_SIZE -1:0] passthrough_out;
    
    // reg isters to store intermdeiate signals
    reg [SIZE-1:0] input_1_r,input_2_r;
    reg carry_in_r, load_r;
    reg [PASS_THROUGH_SIZE -1:0] passthrough_in_r;
    
    // intermediate wires
    wire [SIZE-1:0] sum_w;
    wire carry_w, load_out_w;
    
    // inputs
    always @(posedge clk) begin
        if(reset) begin
        input_1_r <= 0;
        input_2_r <= 0;
        carry_in_r <= 0;
        load_r <= 0;
        passthrough_in_r <= 0;
        end else begin
            if (load) begin
                input_1_r <= input_1;
                input_2_r <= input_2;
                carry_in_r <= carry_in;
                load_r <= load;
                passthrough_in_r <= passthrough_in;
            end else begin
                input_1_r <= input_1_r;
                input_2_r <= input_2_r;
                carry_in_r <= carry_in_r;
                load_r <= 0;
                passthrough_in_r <= passthrough_in_r;
            end
        end
    end
    
    
    look_ahead_adder_n_bit #(.SIZE(SIZE)) ADD (.input_1(input_1_r), .input_2(input_2_r), .carry_in(carry_in_r) , .sum(sum_w), .carry(carry_w));
    
    
    // outputs
    always @(posedge clk) begin
        if(reset) begin
        sum <= 0;
        carry <= 0;
        load_out <= 0;
        passthrough_out <= 0;
        end else begin
            if (load_r) begin
                sum <= sum_w;
                carry <= carry_w;
                load_out <= load_r;
                passthrough_out <= passthrough_in_r;
            end else begin
                sum <= sum;
                carry <= carry;
                load_out <= 0;
                passthrough_out <= passthrough_out;
            end
        end
    end
    
endmodule
