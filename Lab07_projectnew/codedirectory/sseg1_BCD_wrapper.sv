`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 11:02:01 PM
// Design Name: 
// Module Name: sseg1_BCD_wrapper
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


module sseg1_bcd_wrapper(
    input [15:0] sw,
    input clk,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
   
    sseg1_BCD my_sseg1(
    .in(sw[10:0]),
    .sel(sw[15]),
    .seg_un(an[3:2]),
    .dp(dp),
    .sseg(seg),
    .seg_L(an[1]),
    .seg_R(an[0])
    );
    
endmodule
