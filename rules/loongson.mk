########################################################
#                      Loongson Top                    #
########################################################

# for zedboard
ZEDBOARD_TOP := FPGATop
# for loongson board
LOONGSON_TOP := LoongsonTop

# 1: board target
define generate_dual_port_ram_rtl
$1_TOP_V := $$(OBJ_DIR)/$$($1_TOP).v
$1_TOP_FIR := $$(OBJ_DIR)/$$($1_TOP).fir
$1_RTL := $$(OBJ_DIR)/$$($1_TOP).rtl.v
$1_CONF := $$(OBJ_DIR)/$$($1_TOP).rtl.conf
$1_SRAMS_RTL := $$(OBJ_DIR)/$$($1_TOP).behav_srams.v
$1_NPC_RTL = $$(OBJ_DIR)/$$($1_TOP).npc_board.v

$$($1_NPC_RTL): $$(SCALA_FILES)
	mkdir -p $$(OBJ_DIR)
	sbt "run $$($1_TOP) -td $$(OBJ_DIR) --output-file $$($1_TOP_V)"
	@# $$(FIRRTL) -i $$($1_TOP_FIR) -o $$($1_RTL) -X verilog --infer-rw $$($1_TOP) --repl-seq-mem -c:$$($1_TOP):-o:$$($1_CONF)
	@# mem gen
	@# $$(MEM_GEN) $$($1_CONF) > $$($1_SRAMS_RTL)
	@# cat $$($1_RTL) $$($1_SRAMS_RTL) > $$@
	cat $$($1_TOP_V) > $$@
	@# do some replacements
	@sed -i -e "s/fwrite(32'h80000002,/write(/g" $$@
	@sed -i '/ bram /a`undef RANDOMIZE_MEM_INIT' $$@
	@sed -i '/ bram /ainitial begin $$readmemh("$(BRAM_BIN_TXT)", bram); end' $$@
	@sed -i -e 's/_\(aw\|ar\|w\|r\|b\)_\(\|bits_\)/_\1/g' $$@
endef

# fpga project
# PRJ := loongson
# ZYNQ_SW := zynq_sw

# file used when burn the board
# BIT_FILE := $(PRJ_ROOT)/$(PRJ_FULL).runs/impl_1/fpga_top.bit
# PS7_INIT_TCL := $(PRJ_ROOT)/$(PRJ_FULL).srcs/sources_1/bd/zynq_soc/ip/zynq_soc_armv7_processing_system_0/ps7_init.tcl

$(eval $(call generate_dual_port_ram_rtl,LOONGSON))
