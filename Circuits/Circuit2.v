`timescale 1ns / 1ps


module circuit_2(
    a,
    b,
    c,
    z,
    x,
    Clk, 
    Rst
    );
    input Clk, Rst;
    input [31:0] a, b, c;
    output [31:0]  z, x;
    wire  [31:0] d, e, f, g, h;
    wire  dLTe, dEQe;
    wire  [31:0] zwire, xwire;
    ADD #(.WIDTH(32))line1(a,b,d);
    ADD #(.WIDTH(32))line2(a,c,e);
    SUB #(.WIDTH(32))line3(a,b,f);
    COMP #(.WIDTH(32))line4(d,e,1'b0,1'b0,dEQe);
    COMP #(.WIDTH(32))line5(d,e,1'b0,dLTe,1'b0);
    MUX2x1 #(.WIDTH(32))line6(d,e,dLTe,g);
    MUX2x1 #(.WIDTH(32))line7(g,f,dEQe,h);
    SHL #(.WIDTH(32))line8(g,dLTe,xwire);
    SHR #(.WIDTH(32))line9(g,dEQe,zwire);
    REG #(.WIDTH(32))line10(Clk, Rst, xwire, x);
    REG #(.WIDTH(32))line11(Clk, Rst, zwire, z);
endmodule
