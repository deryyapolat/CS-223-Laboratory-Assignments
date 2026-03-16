`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 20:54:18
// Design Name: 
// Module Name: tb_bitShift
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

module tb_bitShift;
  logic Shift;
  logic [3:0] W, Y;
  logic k;
  bitShift dut(.Shift,.W,.Y,.k);
  initial begin
    $display("---- tb_bitShift ----");
    for (int s=0; s<2; s++) begin
      Shift = s;
      for (int w=0; w<16; w++) begin
        W = w[3:0]; #1;
        $display("Shift=%b W=%b -> Y=%b k=%b", Shift, W, Y, k);
        if (Shift) begin
          assert(Y==={1'b0,W[3:1]} && k===W[0]);
        end else begin
          assert(Y===W && k===1'b0);
        end
      end
    end
    $finish;
  end
endmodule

