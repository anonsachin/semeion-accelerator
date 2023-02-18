`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2023 23:27:14
// Design Name: 
// Module Name: greater_than_signed_lookahead
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


module greater_than_signed_lookahead(
     input_1, input_2, greater
    );
    
    parameter SIZE = 8;
    input [SIZE-1:0] input_1, input_2;
    output greater;
    
    wire [SIZE:0] difference;
    wire borrow;
    
    subtractor_lookahead #(.SIZE(SIZE+1)) sub (.input_1({input_1[SIZE-1],input_1}), .input_2({input_2[SIZE-1],input_2}), .difference(difference), .borrow_out(borrow));
    
    assign greater = ~ difference[SIZE];
endmodule
