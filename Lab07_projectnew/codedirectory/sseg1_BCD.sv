`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 11:00:02 PM
// Design Name: 
// Module Name: sseg1_BCD
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


module sseg1_BCD(
    input[10:0] in,
    input sel,
    output [1:0] seg_un,
    output dp,
    output[6:0] sseg,
    output seg_L,
    output seg_R
    );
    wire[3:0] num;
    wire[3:0] ones_wire;
    wire[3:0] tens_wire;
    wire[3:0] hundreds_wire;
    wire[3:0] thousands_wire;
    
    eleven_bit_BCD myelevBCD(
        .B(in[10:0]),
        .ones(ones_wire),
        .tens(tens_wire),
        .hundreds(hundreds_wire),
        .thousands(thousands_wire)
        );
    
mux2_4b mux0(
    .in0(ones_wire),
    .in1(tens_wire),
    .sel(sel),
    .out(num)
    );
    
sseg_decoder sseg0(
    .num(num),
    .sseg(sseg)
    );
    
assign seg_L=~sel;
assign seg_R=sel;
assign seg_un[1:0] = 2'b11;
assign dp = 1;

endmodule
