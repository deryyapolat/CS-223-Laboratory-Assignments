`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 20:54:41
// Design Name: 
// Module Name: bitShift
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

module bitShift(
  input  logic        Shift,
  input  logic [3:0]  W,
  output logic [3:0]  Y,
  output logic        k
);
  always_comb begin
    if (Shift) begin
      Y = {1'b0, W[3:1]};
      k = W[0];
    end else begin
      Y = W;
      k = 1'b0;
    end
  end
endmodule

