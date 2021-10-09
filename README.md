# Templates and Examples for RISC-V 32-bit multicore applications

Demonstrates various ways to call different RISC-V CPU cores and GPIO for custom MCU's.

## Environment

### Install riscv-tool-chain

- Install [required libraries](https://github.com/riscv-collab/riscv-gnu-toolchain?tab=readme-ov-file#prerequisites)
- Compile and install
```
git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --enable-multilib
make newlib
```

### Add to PATH
Add to `.bashrc` or `.zshrc`:
```
export PATH=$PATH:/opt/riscv/bin/
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/riscv/sysroot/usr/include/
export LIBRARY_PATH=$LIBRARY_PATH:/opt/riscv/sysroot/usr/lib/
```

## Memory linker script
Implemented special script for RISC-V [memory.ld](memory.ld) to set address space
fro `FLASH`, `RAM`, and `SECTIONS`.

## Build

### Build C
```
cd c
make
```
- Disassemble: `make dump`
- Clean: `make clean`

## Simulation tool
[Spike RISC-V ISA Simulator](https://github.com/riscv-software-src/riscv-isa-sim).
But it's possible for some kind of code you need change linking script.

### LICENSE: MIT
