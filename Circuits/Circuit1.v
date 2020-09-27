`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 06:24:47 PM
// Design Name: 
// Module Name: Circuit1
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


module Circuit1(a,b,c,z,x, Clk, Rst);
input Clk, Rst; //used by registers
input [7:0] a, b, c; //8 bit Int

output [7:0] z; //8 bit Int
output [15:0]x; //16 bit Int

wire [7:0] d, e; //8 bit Int
wire [15:0]f, g; //16 bit Int
wire [15:0]xwire; //16 bit Int


ADD #(.WIDTH(8))ADD0(a,b,d);//d = a + b, use 8 bit
ADD #(.WIDTH(8))ADD1(a,c,e);//e = a + c, use 8 bit
COMP #(.WIDTH(8))COMP0(d, e, g, 0, 0);//g = d > e, 8bit
MUX2x1 #(.WIDTH(8))MUX_d_or_e(d, e, g, z);//z = g ? d : e, use 8bit
MUL #(.WIDTH(16))MUL0(a,c,f);//f = a * c, use 16bit
SUB #(.WIDTH(16))SUB0(f,d,xwire);//xwire = f - d, use 16 bit
REG #(.WIDTH(16))REG0(Clk, Rst, xwire, x);//x = xwire, use 16 bit

endmodule
/* Original code from assignmet;
input Int8 a, b, c

output Int8 z
output Int16 x

wire Int8 d, e
wire Int16 f, g
wire Int16 xwire

d = a + b
e = a + c
g = d > e
z = g ? d : e
f = a * c
xwire = f - d  
x = xwire
*/