#include <stdint.h>
#include "hardware.h"

extern void core1_main(void);

void core0_main(void) {
    *(volatile uint32_t *) (CORE1_BASE) = (uint32_t) core1_main;
    *(volatile uint32_t *) (CORE1_START) = 1;

    while (1) {
    }
}
