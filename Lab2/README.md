# Lab – Multifunction Register and 7-Segment Display  
This folder contains the implementation of Lab 3 for the CS 223 Digital Design Laboratory course.

## Objective  
The objective of this lab is to design and implement a multifunction 8-bit register and a 7-segment display driver using SystemVerilog and test them on the BASYS-3 FPGA board. The register performs several operations such as shifting, rotating, and parallel loading depending on control inputs .

## Contents
Supported operations include:  

Maintain value – keeps the current register content  
Shift left – shifts all bits left and inserts a new bit from shift_in  
Shift right – shifts all bits right and inserts a new bit from shift_in  
Parallel load – loads an external 8-bit value into the register  
Rotate left – rotates bits so the MSB moves to LSB  
Rotate right – rotates bits so the LSB moves to MSB  
Each operation is selected according to the operation table defined in the lab instructions  

D Flip-Flop: This module implements a synchronously resettable D flip-flop.
On the rising edge of the clock, the flip-flop stores the input value D and produces it at the output Q. If the reset signal is active, the output is cleared to zero. This flip-flop is used as the basic storage element for building the multifunction register.

Multifunction Register: This module implements an 8-bit multifunction register using eight D flip-flops and multiplexers.
The register performs different operations depending on the control signals s2, s1, s0.



Hex-to-7 Segment Decoder: This module converts a 4-bit hexadecimal input into the corresponding signals required to drive a 7-segment display. Each segment of the display (a–g) is controlled by an output signal. Depending on the input value (0–F), the correct segments are activated so that the display shows the corresponding hexadecimal digit.

7-Segment Display Driver: This module controls the 7-segment display on the BASYS-3 board. It uses the hex-to-7-segment decoder to generate the correct segment pattern and drives the display digits. The driver allows displaying hexadecimal numbers on the FPGA board using switch inputs.

Multi-Digit Display Driver: This module expands the single-digit display driver to control all four digits of the seven-segment display. The driver rapidly switches between digits (multiplexing) so that all digits appear lit at the same time to the human eye. Each group of switches controls the value shown on the corresponding display digit.

16-bit Counter with Alarm: This module implements a 16-bit counter by combining two 8-bit multifunction registers. The counter performs operations depending on the control inputs:  
Shift Left → Doubling the value  
Shift Right → Halving the value

The counter value is displayed on the 7-segment display. An alarm signal is generated when the counter value exceeds a predefined threshold derived from the student ID. When the alarm condition occurs, onboard LEDs start flashing .

Testbenches: Testbench modules are used to simulate the designs and verify their correctness before implementing them on the FPGA board. Different input combinations are applied to ensure that the modules operate according to the expected behavior.
