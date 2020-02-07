#=======================================================================
# Makefile for Verilog simulation w/ VCS
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#
# This makefile will build a rtl simulator and run various tests to
# verify proper functionality.
#

default: verilog

fpga_dir = $(NPC_HOME)/fpga
base_dir = $(fpga_dir)/..
build_dir = $(fpga_dir)/build
generated_dir = $(build_dir)/generated-src

#--------------------------------------------------------------------
# Rocket-chip verilog source generation
#--------------------------------------------------------------------

MK_TARGET_PROC ?= mips32_npc
CHISEL_ARGS := FPGATop -td $(generated_dir)
FIRRTL_JAR = $(fpga_dir)/firrtl/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -cp $(FIRRTL_JAR) firrtl.Driver
mem_gen = $(fpga_dir)/scripts/vlsi_mem_gen

MODEL = FPGATop
gen_fir = $(generated_dir)/$(MODEL).fir
gen_rtl = $(generated_dir)/$(MODEL).v
gen_conf = $(generated_dir)/$(MODEL).conf
srams_rtl = $(generated_dir)/$(MODEL).behav_srams.v

$(gen_rtl): $(NPC_HOME)/src/${MK_TARGET_PROC}/*.scala $(NPC_HOME)/src/common/*.scala
	@# this generates *.v and *.fir
	@# we need to replace seqmem with behave-srams, which maps to bram on fpga
	cd $(NPC_HOME) && sbt "run $(CHISEL_ARGS)"
	$(FIRRTL) -i $(gen_fir) -o $(gen_rtl) -X verilog --infer-rw $(MODEL) --repl-seq-mem -c:$(MODEL):-o:$(gen_conf)
	$(mem_gen) $(gen_conf) >$(srams_rtl)

$(srams_rtl): $(gen_rtl)

npc_rtl = rtl/npc_board.v

$(npc_rtl): $(gen_rtl) $(srams_rtl)
	cat $^ > $@
	sed -i -e 's/_\(aw\|ar\|w\|r\|b\)_\(\|bits_\)/_\1/g' $@

# generate rtl with chisel generated printf
# used for debugging in vivado simulation
debug: $(gen_rtl) $(srams_rtl)
	echo '`undef synthesis' > $(npc_rtl)
	echo '`define RANDOMIZE_REG_INIT' >> $(npc_rtl)
	echo '`define RANDOMIZE_MEM_INIT' >> $(npc_rtl)
	cat $^ >> $(npc_rtl)
	sed -i -e "s/fwrite(32'h80000002,/write(/g" $(npc_rtl)
	sed -i -e 's/_\(aw\|ar\|w\|r\|b\)_\(\|bits_\)/_\1/g' $(npc_rtl)

verilog: $(npc_rtl)

.PHONY: $(gen_rtl) verilog debug

#--------------------------------------------------------------------
# Cleaning
#--------------------------------------------------------------------

clean:
	-rm -rf $(generated_dir)

.PHONY: default clean
