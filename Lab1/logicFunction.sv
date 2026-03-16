`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 20:16:41
// Design Name: 
// Module Name: logicFunction
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

module dec2to4_en (
  input  logic       en,
  input  logic [1:0] a,
  output logic [3:0] y
);

  assign y = en ? (4'b0001 << a) : 4'b0000;
endmodule

module mux8to1 (
  input  logic d0,d1,d2,d3,d4,d5,d6,d7,
  input  logic [2:0] s,
  output logic y
);
  wire [7:0] bus;
  assign bus = {d7,d6,d5,d4,d3,d2,d1,d0}; // continuous concat
  assign y = bus[s];
endmodule


module logicFunction (
  input  logic A,B,C,D,E,
  output logic F
);
  logic [3:0] Yde;
  dec2to4_en udec(.en(1'b1), .a({D,E}), .y(Yde));

  logic d0,d1,d2,d3,d4,d5,d6,d7;
  assign d0 = 1'b1;
  assign d1 = Yde[0];
  assign d2 = D;
  assign d3 = 1'b0;
  assign d4 = 1'b1;
  assign d5 = 1'b0;
  assign d6 = Yde[2];
  assign d7 = ~D;

  mux8to1 u8(
    .d0(d0), .d1(d1), .d2(d2), .d3(d3),
    .d4(d4), .d5(d5), .d6(d6), .d7(d7),
    .s({A,B,C}), .y(F)
  );
endmodule

