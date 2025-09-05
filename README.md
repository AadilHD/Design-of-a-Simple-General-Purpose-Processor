# Simple General-Purpose Processor (ALU) – VHDL

## Overview
This project implements a simple processor in **VHDL** as part of **COE/BME 328 – Digital Systems (Lab 6)** at Toronto Metropolitan University. The design includes an **Arithmetic and Logic Unit (ALU)**, control unit, registers, and seven-segment display integration. It was developed and tested in **Quartus II** on the **Altera DE2 Cyclone-II FPGA board**.

## Features
- 8-bit ALU supporting arithmetic and logic operations  
- Register storage units for input values (A and B)  
- Control Unit with **FSM (Finite State Machine)** and **4x16 Decoder**  
- Waveform simulation in Quartus II for verification  
- Real-time FPGA output displayed on seven-segment LEDs  
- Modular design: registers, ALU core, control unit, and display  

## Tools & Technologies
- **Quartus II v13**  
- **VHDL**  
- **Altera Cyclone-II EP2C35F672C6 (DE2 Development Board)**  

## Repository Structure
- `/src` – VHDL source files (ALU, FSM, Decoder, Registers)  
- `/docs` – Lab manual, schematics, and project documentation  
- `.gitignore` – Ignores Quartus-generated build files  

## How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
