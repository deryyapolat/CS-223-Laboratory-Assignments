`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 18:13:03
// Design Name: 
// Module Name: tb_dec2to4
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
module tb_dec2to4;
  logic       en;
  logic [1:0] a;
  logic [3:0] y;
  dec2to4 dut (.en(en), .a(a), .y(y));

  initial begin
    $display("---- tb_dec2to4 ----");
    for (int v = 0; v < 8; v++) begin
      {en, a} = v[2:0];
      #1;
      $display("en=%0b  a=%02b  -> y=%04b", en, a, y);
    end
    $finish;
  end
endmodule
