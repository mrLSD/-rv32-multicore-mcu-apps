.PHONY: all clean dump

RISCVCC32=riscv32-unknown-elf-gcc
RISCVCC32_OBJDUMP=riscv32-unknown-elf-objdump
CFLAGS=-march=rv32gc -mabi=ilp32d -static -nostdlib -nostartfiles -mcmodel=medany
LDFLAGS=-Tmemory.ld

SRC_DIR=src
BUILD_DIR=build

ASM_SOURCE=$(SRC_DIR)/init.S
C_SOURCES=$(wildcard $(SRC_DIR)/*.c)
ASM_OBJECT=$(patsubst $(SRC_DIR)/%.S,$(BUILD_DIR)/%.o,$(ASM_SOURCE))
C_OBJECTS=$(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(C_SOURCES))
OBJECTS=$(ASM_OBJECT) $(C_OBJECTS)

TARGET=$(BUILD_DIR)/app.elf

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(RISCVCC32) $(CFLAGS) -o $@ -c $<

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.S | $(BUILD_DIR)
	$(RISCVCC32) $(CFLAGS) -o $@ -c $<

$(TARGET): $(OBJECTS)
	$(RISCVCC32) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $@

clean:
	rm -rf $(BUILD_DIR)

dump:
	$(RISCVCC32_OBJDUMP) -d $(TARGET)
