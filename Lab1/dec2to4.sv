`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 18:07:23
// Design Name: 
// Module Name: dec2to4
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

module dec2to4 (
  input  logic       en,
  input  logic [1:0] a,    
  output logic [3:0] y      
);
  assign y = en ? (4'b0001 << a) : 4'b0000;
endmodule

