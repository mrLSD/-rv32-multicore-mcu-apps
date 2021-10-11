#![no_std]
#![no_main]

use core::{arch::global_asm, panic::PanicInfo, ptr};

global_asm!(include_str!("../init.S"));

const CORE1_BASE: *mut u32 = 0x40000004 as *mut u32;
const CORE1_START: *mut u32 = 0x4000000C as *mut u32;

/// A panic handler is required in Rust, this is probably the most basic one possible
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

/// Main program function
#[no_mangle]
extern "C" fn core0_main() -> ! {
    unsafe {
        ptr::write_volatile(CORE1_BASE, core1_main as u32);
    }
    let mut x: u32 = 0;
    loop {
        if x == 1000 {
            unsafe {
                ptr::write_volatile(CORE1_START, 1);
            }
        }
        x += 1;
    }
}

#[no_mangle]
extern "C" fn core1_main() -> ! {
    loop {}
}
