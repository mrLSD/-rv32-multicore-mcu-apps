#include <stdint.h>
#include "hardware.h"

extern void core1_main(void);

/// RUnc CPU core0
void core0_main(void) {
    // Set address to code run for core1
    *(volatile uint32_t *) (CORE1_BASE) = (uint32_t) core1_main;

    uint32_t index = 0;
    while (1) {
        // Enable core1 execution
        if (index == 10000) {
            *(volatile uint32_t *) (CORE1_START) = 1;
        }
        index += 1;
    }
}
