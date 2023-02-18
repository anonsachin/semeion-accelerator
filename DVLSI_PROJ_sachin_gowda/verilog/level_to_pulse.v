`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2023 12:21:02
// Design Name: 
// Module Name: level_to_pulse
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


module level_to_pulse(
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
            pulse_output <= ~level_reg & level_input;
        end
    end
    
endmodule
