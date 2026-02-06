
# Pipeline Register (Single Stage)

This repository contains a simple single-stage pipeline register written in
SystemVerilog. I implemented this to understand how valid–ready handshake
works and how backpressure is handled between two blocks.

The design can store one 32-bit data value at a time.

## What this module does
- Accepts input data when `in_valid` and `in_ready` are high
- Sends data to the next block when `out_valid` and `out_ready` are high
- If the next block is busy, the data is held inside the register
- Prevents data loss by stopping new inputs when the register is full

## Files in this repo
- `pipeline_reg.sv`  
  RTL code for the pipeline register

## Reset behavior
- Active-low reset (`rst_n`)
- On reset, the register is cleared and marked empty


