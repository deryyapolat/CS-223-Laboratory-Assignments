`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 17:23:00
// Design Name: 
// Module Name: g_mux2
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
//function g şey yapıyo, w3 sıfırsa g= w2
//w3 1se, (w1 or ~w2) yani mux napıyosa hasdsa
module mux2 (
  input  logic d0, d1,
  input  logic s,
  output logic y
);
  assign y = s ? d1 : d0;
endmodule

module g_mux2 (
  input  logic w1, w2, w3,
  output logic g
);
  logic d0, d1;
  assign d0 = w2;
  assign d1 = (w1 | ~w2);
  mux2 u(.d0(d0), .d1(d1), .s(w3), .y(g));
endmodule

