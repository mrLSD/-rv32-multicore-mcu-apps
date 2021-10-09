/*
Source: https://sourceware.org/binutils/docs/ld/Scripts.html
Examples: https://github.com/pulp-platform/pulp-riscv-gnu-toolchain/blob/master/riscv.ld
*/

OUTPUT_ARCH("riscv")
ENTRY(_start)

/* Define memory layout for FLASH and RAM */
MEMORY {
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 32K
    RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
    _start = ORIGIN(FLASH);
    .text.init : { *(.init) } > FLASH
    .text : {
        *(.text .text.*)
        _etext = .;
    } > FLASH

    .rodata : {
        *(.rodata .rodata.*)
    } > FLASH

    /* Copy data from FLASH to RAM */
    .data : {
        _sdata = .;
        *(.data .data.*)
        _edata = .;
    } > RAM AT > FLASH

    .bss (NOLOAD) : {
        _sbss = .;
        *(.bss .bss.*)
        *(COMMON)
        _ebss = .;
    } > RAM

    _end = .;
}
