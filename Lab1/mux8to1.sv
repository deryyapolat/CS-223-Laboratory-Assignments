`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 18:46:38
// Design Name: 
// Module Name: mux8to1
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

module mux4 (
  input  logic d0, d1, d2, d3,
  input  logic [1:0] s,
  output logic y
);
  wire [3:0] bus;
  assign bus = {d3, d2, d1, d0};
  assign y = bus[s];          
endmodule

module mux8to1 (
  input  logic d0,d1,d2,d3,d4,d5,d6,d7,
  input  logic [2:0] s,
  output logic y
);
  logic y_lo, y_hi; //4-to-1in lower and higher outputları için
  logic s2n;
  assign s2n = ~s[2];    
  mux4 mlo(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s[1:0]), .y(y_lo));
  mux4 mhi(.d0(d4), .d1(d5), .d2(d6), .d3(d7), .s(s[1:0]), .y(y_hi));
  logic lo_sel, hi_sel;// low olanlar s2=0 da çalışcak öbürleri s2=1de.
  assign lo_sel = y_lo & s2n;
  assign hi_sel = y_hi & s[2];
  assign y = lo_sel | hi_sel;
endmodule

