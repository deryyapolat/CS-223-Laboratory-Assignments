`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 17:22:26
// Design Name: 
// Module Name: tb_g_mux2
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


module tb_g_mux2;
  logic w1,w2,w3;
  logic g;
  g_mux2 dut(.w1,.w2,.w3,.g);
  initial begin
    $display("---- tb_g_mux2 ----");
    for (int v=0; v<8; v++) begin
      {w1,w2,w3} = v[2:0];
      #1;
      $display("w1w2w3=%b%b%b -> g=%b", w1,w2,w3,g);
    end
    $finish;
  end
endmodule
