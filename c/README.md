## Very basic application for rv32 multicore operations

1. Initialized `core0(main)`
2. Set address for `core1` to execution function `core1_main`
3. Enable code execution for `core1` of function `core1_main`

### Build C
- Build: `make`
- Disassemble: `make dump`
- Clean: `make clean`
- 