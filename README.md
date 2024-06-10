# 32-Bit-MIPS-Processor-with-5-Stage-Pipeline

## Project Overview

This project implements a 32-bit MIPS processor with a 5-stage pipeline. The processor is designed using Verilog and simulates a pipelined architecture to enhance instruction throughput by overlapping the execution of multiple instructions. The five stages of the pipeline are:
1. **Instruction Fetch (IF)**
2. **Instruction Decode (ID)**
3. **Execute (EX)**
4. **Memory Access (MEM)**
5. **Write Back (WB)**

## Features

- **5-Stage Pipeline**: Implements a pipelined architecture with distinct stages to improve performance.
- **Data Hazard Handling**: Uses forwarding and stalling techniques to resolve data hazards.
- **Control Hazard Handling**: Manages control hazards using stall logic for branch instructions.
- **Modular Design**: Each component (e.g., ALU, Control Unit, Register File) is designed as a separate module for clarity and reusability.
- **Simulation and Testing**: Includes a testbench for simulating the processor's behavior and verifying its correctness.

