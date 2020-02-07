.PHONY: all emu clean-emu clean-am clean-all update minicom

export ARCH=mips32-npc
export CROSS_COMPILE=mips-linux-gnu-
export AM_HOME=$(abspath $(shell pwd)/../nexus-am)
export MIPS32_NEMU_HOME=$(abspath $(shell pwd)/../nemu-mips32)
export INSTTEST_HOME=$(abspath $(shell pwd)/../insttest)
export UBOOT_HOME=$(abspath $(shell pwd)/../uboot)
export NANOS_HOME=$(abspath $(shell pwd)/../nanos)

.DEFAULT_GOAL=emu

VIVADO := vivado
VIVADO_18 := vivado
VIVADO_FLAG := -nolog -nojournal -notrace

OBJ_DIR := output
SCALA_DIR := src
SCALA_FILES := $(shell find $(SCALA_DIR) -name "*.scala")

EMU_SRC_DIR := emu
EMU_TOP_MODULE := SimTop
EMU_TOP_V := $(OBJ_DIR)/emu_top.v
EMU_LIB_V := $(shell find $(EMU_SRC_DIR) -name "*.v")
EMU_MK := $(OBJ_DIR)/emu.mk
EMU_BIN := $(OBJ_DIR)/emulator
EMU_CXXFILES := $(shell find $(EMU_SRC_DIR) -name "*.cpp")

DDR_BIN_TXT := ddr.bin.txt
BRAM_BIN_TXT := bram.bin.txt

MIPS32_NEMU := $(MIPS32_NEMU_HOME)/build/nemu
MIPS32_NEMU_LIB := $(MIPS32_NEMU_HOME)/build/nemu.a

nemu: $(MIPS32_NEMU) $(MIPS32_NEMU_LIB)
emu: $(EMU_BIN)

$(EMU_TOP_V): $(SCALA_FILES)
	@mkdir -p $(@D)
	@sbt "run $(EMU_TOP_MODULE) -td $(@D) --output-file $@"
	@sed -i '/ bram /a`undef RANDOMIZE_MEM_INIT' $@
	@sed -i '/ bram /ainitial begin $$readmemh("$(BRAM_BIN_TXT)", bram); end' $@

$(EMU_MK): $(EMU_TOP_V) $(EMU_CXXFILES) $(EMU_LIB_V)
	@verilator --cc --exe --top-module $(EMU_TOP_MODULE) \
	  -o $(notdir $(EMU_BIN)) -Mdir $(@D) \
		-CFLAGS "-I $(MIPS32_NEMU_HOME)/include" \
		-CFLAGS "-DDDR_BIN_TXT=\\\"$(DDR_BIN_TXT)\\\"" \
		-CFLAGS "-DBRAM_BIN_TXT=\\\"$(BRAM_BIN_TXT)\\\"" \
		-LDFLAGS "$(MIPS32_NEMU_LIB) -lpthread -lreadline -lSDL" \
		--prefix $(basename $(notdir $(EMU_MK))) $^ 

update: $(EMU_MK)
	@rm $(EMU_BIN)
	@touch $<

$(EMU_BIN): $(EMU_MK) $(EMU_CXXFILES)
	@echo + $(EMU_BIN)
	@cd $(@D) && make -s -f $(notdir $<)
	@touch $<

$(MIPS32_NEMU) $(MIPS32_NEMU_LIB): $(shell find $(MIPS32_NEMU_HOME) -name "*.c" -or -name "*.h")
	@make -s -C $(MIPS32_NEMU_HOME) ARCH=mips32-npc

clean-emu:
	rm -rf $(OBJ_DIR)

clean-am:
	make -s -C $(AM_HOME) clean

clean-all: clean-emu clean-am

minicom:
	cd output && sudo minicom -D /dev/ttyUSB1 -b 115200 -c on -C cpu.log -S ../minicom.script

include rules/test-all.mk
include rules/loongson.mk
include rules/nscscc.mk
