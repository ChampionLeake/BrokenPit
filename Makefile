include $(DEVKITARM)/ds_rules
#---------------------------------------------------------------------------------
# path to tools
#---------------------------------------------------------------------------------
export PATH  :=    $(DEVKITARM)/bin:$(PATH)
export CC    :=    gcc
#---------------------------------------------------------------------------------
# the prefix on the compiler executables
#---------------------------------------------------------------------------------
PREFIX        :=    arm-none-eabi-
#---------------------------------------------------------------------------------

all: build/pit.bin

build/brokenpit.elf: brokenpit.s
	mkdir -p $(dir $@) 
	$(PREFIX)gcc -x assembler-with-cpp -nostartfiles -nostdlib -g -o $@ $< $(DEFINES)

build/pit.bin: build/brokenpit.elf
	arm-none-eabi-objcopy -O binary $< $@

clean:
	rm -rf build/