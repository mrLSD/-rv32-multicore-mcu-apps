/*
Source: https://sourceware.org/binutils/docs/ld/Scripts.html
Examples: https://github.com/pulp-platform/pulp-riscv-gnu-toolchain/blob/master/riscv.ld
*/

OUTPUT_ARCH("riscv")
ENTRY(_start)

/* Define memory layout for FLASH and RAM */
MEMORY {
    RAM (rwx)  : ORIGIN = 0x00000000, LENGTH = 64K
    FLASH (rx) : ORIGIN = 0x80000000, LENGTH = 32K
}

SECTIONS {
    .text.init : { *(.init) } > FLASH
    .text : {
        *(.text .text.*)
    } > FLASH

    .rodata : {
        *(.rodata .rodata.*)
    } > FLASH

    /* Copy data from FLASH to RAM */
    .data : {
        *(.data .data.*)
    } > RAM AT > FLASH

    .bss (NOLOAD) : {
        *(.bss .bss.*)
        *(COMMON)
    } > RAM
}
