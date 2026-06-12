SRC_DIR = src
BUILD_DIR = build
SRCM = main

BIN = $(BUILD_DIR)/$(SRCM).bin

$(SRCM): $(SRC_DIR)/$(SRCM).asm
	nasm -f bin $(SRC_DIR)/$(SRCM).asm -o $(BIN)
	#nasm -f bin $< -o $@

run: $(BIN)
	#qemu-system-x86_64 -drive format=raw,file=$(BUILD_DIR)/$(SRCM).bin -display gtk
	qemu-system-x86_64 -drive format=raw,file=$(BIN) -display gtk

clean:
	rm -f $(BIN)