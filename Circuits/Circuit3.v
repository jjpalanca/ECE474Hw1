`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 06:22:15 PM
// Design Name: 
// Module Name: Circuit_3
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


module Circuit_3(Clk, Rst, a, b, c, d, e, f, g, h, sa, avg);
input [15:0] a, b, c, d, e, f, g, h;
input [7:0] sa;
input Clk, Rst;

output [15:0] avg;

wire [31:0] hundred, hundred_one, hundred_two, hundred_three, hundred_ten, hundred_eleven, twelve, twelvediv2, twelvediv4, twelvediv8;

//always @(a, b, c, d, e, f, g, h, sa, avg) begin
    //l00 = a + b
    ADD #(.WIDTH(32))ADD0(a, b, hundred);
    //l01 = c + d;
    ADD #(.WIDTH(32))ADD1(c, d, hundred_one);
    //l02 = e + f;
    ADD #(.WIDTH(32))ADD2(e, f, hundred_two);
    //l03 = g + h;
    ADD #(.WIDTH(32))ADD3(g, h, hundred_three);
    //l10 = l00 + l01;
    ADD #(.WIDTH(32))ADD4(hundred, hundred_one, hundred_ten);
    //l11 = l02 + l03;
    ADD #(.WIDTH(32))ADD5(hundred_two, hundred_three, hundred_eleven);
    //l2 = l10 + l11;
    ADD #(.WIDTH(32))ADD6(hundred_ten, hundred_eleven, twelve);
    //l2div2 = l2 >> sa;
    SHR #(.WIDTH(32))SHR1(sa, twelve, twelvediv2);
    //l2div4 = l2div2 >> sa; 
    SHR #(.WIDTH(32))SHR2(sa, twelvediv2, twelvediv4);
    //l2div8 = l2div4 >> sa;
    SHR #(.WIDTH(32))SHR3(sa, twelvediv4, twelvediv8);
    //avg = l2div8;
    REG #(.WIDTH(32))reg1(Clk, Rst, twelvediv8, avg);
    //end
endmodule
