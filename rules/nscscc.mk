.PHONY: clean-submit submit-func submit-perf submit
.PHONY: loongson submit-sync submit-test-env minicom
.PHONY: uboot-coe

LS_SUBMIT_DIR := $(abspath $(OBJ_DIR)/nscscc-submit)

submit-sync: submit-sync-func submit-sync-perf submit-sync-final

FUNC_COE  := $(LS_SUBMIT_DIR)/soft/func/obj/inst_ram.coe
GAME_COE  := $(LS_SUBMIT_DIR)/soft/memory_game/obj/axi_ram.coe
PERF_COE  := $(LS_SUBMIT_DIR)/soft/perf_func/obj/allbench/axi_ram.coe
UBOOT_COE := $(LS_SUBMIT_DIR)/soft/u-boot/u-boot.coe
GOLDEN_TRACE := $(LS_SUBMIT_DIR)/cpu132_gettrace/golden_trace.txt

uboot-coe: $(UBOOT_COE)

$(UBOOT_COE):
	ARCH=mips32 CROSS_COMPILE=mips-linux-gnu- make -C $(UBOOT_HOME) -j16
	mkdir -p $(@D)
	hexdump -ve 1/$l\ \"%016x\\n\" $(UBOOT_HOME)/u-boot.bin | \
	  sed 1i'memory_initialization_radix = 16;\nmemory_initialization_vector =' > $(UBOOT_COE)
	#cp nscscc/u-boot.coe $@

clean-submit:
	rm -rf $(LS_SUBMIT_DIR)

# 1: name, 2: dependent .coe file
define submit_template =
.PHONY: submit-$(1) clean-submit-$(1) submit-sync-$(1)

$(1)_LS_TOP_V=$$(LS_SUBMIT_DIR)/soc_axi_$(1)/rtl/myCPU/LoongsonTop.v
$(1)_LS_XPR=$$(LS_SUBMIT_DIR)/soc_axi_$(1)/run_vivado/mycpu_prj1/mycpu.xpr

$$($(1)_LS_TOP_V): $$(LOONGSON_NPC_RTL)
	mkdir -p $$(@D)
	cp $$< $$@

$$($(1)_LS_XPR):
	rm -rf $$(LS_SUBMIT_DIR)/soc_axi_$(1)
	cp -r nscscc/soc_axi_$(1) $$(LS_SUBMIT_DIR)

submit-$(1): $$($(1)_LS_XPR) $$($(1)_LS_TOP_V) $(2)

clean-submit-$(1):
	cd $$(LS_SUBMIT_DIR) && rm -rf soc_axi_$(1)

submit-sync-$(1): $$($(1)_LS_TOP_V)

submit-$(1)-bit: $$($(1)_LS_XPR)
	SOC_XPR=mycpu.xpr SOC_DIR=$$(LS_SUBMIT_DIR)/soc_axi_$(1)/run_vivado/mycpu_prj1 \
	  $(VIVADO_18) $(VIVADO_FLAG) -mode batch -source nscscc/mk.tcl

submit-$(1)-vivado: $$($(1)_LS_XPR)
	cd $$(<D) && nohup $$(VIVADO_18) $$< &>/dev/null &
endef

$(eval $(call submit_template,func,$(FUNC_COE) $(GOLDEN_TRACE)))
# $(eval $(call submit_template,perf,$(PERF_COE)))
$(eval $(call submit_template,final,$(UBOOT_COE)))
