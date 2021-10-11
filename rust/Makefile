.PHONY: build clean dump

RISCVCC32_OBJDUMP=riscv32-unknown-elf-objdump
RISCVCC32_OBJDUMP_ELF64=riscv64-elf-objdump
BUILD_DIR=target/riscv32imac-unknown-none-elf/release
TARGET=$(BUILD_DIR)/rv32-app

build:
	@cargo build -r

clean:
	rm -rf target/

dump:
	$(RISCVCC32_OBJDUMP) -d $(TARGET)

dx64:
	$(RISCVCC32_OBJDUMP_ELF64) -d $(TARGET)