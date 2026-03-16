# Lab – Smart Parking Management System

This folder contains the implementation of Lab for the CS 223 Digital Design course.

## Objective

The objective of this lab is to design a Smart Parking Management System using a Finite State Machine (FSM). The system manages vehicle arrivals, assigns parking zones, and keeps track of available and occupied slots. The design is implemented using **SystemVerilog** and tested on the **BASYS-3 FPGA board** .

---

# Contents

## Parking Controller FSM

This module implements the main finite state machine (FSM) that controls the smart parking system.
The FSM monitors incoming vehicle requests and assigns them to available parking zones. If a zone is full, the vehicle is placed in a waiting queue. The FSM also handles vehicle departures when their parking time expires. Each vehicle type has a different service time

These timers determine when a vehicle leaves the parking zone and when the next vehicle in the queue can enter .

Queue Management Logic: This module manages the waiting queue for incoming vehicles. If a parking zone is occupied when a vehicle arrives, the system places the vehicle in a queue. When a vehicle leaves its parking spot, the next vehicle in the queue of the same type is immediately assigned to the free zone.

## Timer Module
The timer module is used to track how long each vehicle remains parked.
When the predefined parking time expires, the system automatically frees the parking zone and updates the system state.

## LED Status Controller

This module controls the 16 LEDs on the BASYS-3 board to display the status of the parking zones.
The LED pattern follows this structure: CCC.SSS.EEE.VVV

Meaning:
C: Compact zone
S: SUV zone
E: Electric zone
V: VIP zone

LED behavior:
Solid ON: zone available
Blinking: zone occupied
This allows users to quickly observe the parking status on the FPGA board .

## 7-Segment Display Module

This module drives the 7-segment display on the BASYS-3 board. It shows the current number of parked vehicles (0–4) in decimal format. Whenever a vehicle enters or leaves a parking zone, the displayed value updates immediately.

## Button Input Controller
The push buttons on the BASYS-3 board are used to simulate vehicle arrivals.
Each button represents a vehicle type: Button 1 Compact, Button 2 SUV, Button 3 Electric, Button 4 VIP
When a button is pressed, the system registers a new vehicle arrival and processes it through the FSM.

## Testbench
The testbench verifies the correct behavior of the smart parking system in simulation. The testbench checks:  
correct vehicle allocation to zones  
proper queue management  
correct timer expiration behavior  
accurate display and LED status updates

