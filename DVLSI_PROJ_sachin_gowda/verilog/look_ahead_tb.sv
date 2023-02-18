`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 14:30:02
// Design Name: 
// Module Name: look_ahead_tb
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


module look_ahead_tb(

    );
    
     parameter SIZE = 8;
    // SETUP ports
    reg [SIZE-1:0] input_1,input_2;
    reg carry_in;
    wire [SIZE-1:0] sum;
    wire carry;
    
    look_ahead_adder_n_bit #(.SIZE(SIZE)) dut (input_1, input_2, carry_in , sum, carry);
    
    initial
    begin
    // setting the inputs to arrive 2 time units before 
    // the clock
    input_1 <= 8'd0;
    input_2 <= 8'd1;
    carry_in <= 0;
    
    #10 input_1 <= 8'd1;
    input_2 <= 8'd0;
    
    #10 input_1 <= 8'd2;
    input_2 <= 8'd1;
    
    #10 input_1 <= 8'd1;
    input_2 <= 8'd2;
    
    #10 input_1 <= 8'd6;
    input_2 <= 8'd2;
    
    #10 input_1 <= 8'd1;
    input_2 <= 8'd7;
    
    #10 input_1 <= 8'd22;
    input_2 <= 8'd23;
    
    #20;
    
    $finish;
    
    end
    
endmodule
