`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 18:47:04
// Design Name: 
// Module Name: tb_mux8to1
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


module tb_mux8to1;
  logic [7:0] D;
  logic [2:0] s;
  logic y, y_ref;
  mux8to1 dut(
    .d0(D[0]), .d1(D[1]), .d2(D[2]), .d3(D[3]),
    .d4(D[4]), .d5(D[5]), .d6(D[6]), .d7(D[7]),
    .s(s), .y(y)
  );
    assign y_ref = D[s];
  initial begin
    $display("---- tb_mux8to1 ----");
    for (int t=0; t<256; t++) begin //dlerin
      D = t[7:0];
      for (int k=0; k<8; k++) begin //slerin
        s = k[2:0]; #1;
        assert(y===y_ref) else $error("Mismatch D=%b s=%b -> y=%b ref=%b",D,s,y,y_ref);
      end
    end
    $finish;
  end
endmodule

