`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 06:23:39 PM
// Design Name: 
// Module Name: Circuit4
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


module Circuit4(
    a, b, c, z, x, Clk, Rst
    );
    input Clk, Rst;
    input [63:0] a, b, c;
    output [31:0] z, x;
    wire [63:0] d, e, f, g,h;
    wire dLTe, dEQe;
    wire [63:0] xrin, zrin;
    wire [63:0] greg, hreg;

    ADD #(.WIDTH(64))add1(a, b, d);                     // d = a + b
    ADD #(.WIDTH(64))add2(a, c, e);                     // e = a + c
    SUB #(.WIDTH(64))sub1(a, b, f);                     // f = a - b
    COMP #(.WIDTH(1))eq1(d, e, 0, 0, dEQe);             // dEQe = d == e
    COMP #(.WIDTH(1))lt1(d, e, 0, dLTe, 0);             // dLTe = d < e
    MUX2x1 #(.WIDTH(64))if1(d, e, dLTe, g);             // g = dLTe ? d : e 
    MUX2x1 #(.WIDTH(64))if2(g, f, dEQe, h);             // h = dEQe ? g : f 
    REG #(.WIDTH(64))reg1(Clk, Rst, g, greg);           // greg = g
    REG #(.WIDTH(64))reg2(Clk, Rst, h, hreg);           // hreg = h
    SHL #(.WIDTH(64))shl1(hreg, dLTe, xrin);            // xrin = hreg << dLTe
    SHR #(.WIDTH(64))shr1(greg, dEQe, zrin);            // zrin = greg << dEQe
    REG #(.WIDTH(32))reg3(Clk, Rst, xrin, x);           // x = xrin
    REG #(.WIDTH(32))reg4(Clk, Rst, zrin, z);           // z = zrin
    
endmodule
