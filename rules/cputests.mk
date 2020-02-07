define cputests_template
$(1)_DIR := $(AM_HOME)/tests/cputest
$(1)_APP := $$($(1)_DIR)/build/$(1)
$(1)_OBJDIR := $(OBJ_DIR)/cputests/$(1)
$(1)_DEPS := $$($(1)_DIR)/tests/$(1).c

.PHONY: compile-cputests-$(1) run-cputests-$(2)
.PHONY: run-nemu-cputests-$(1) clean-cputests-$(2)

$$($(1)_APP)-$(ARCH).%: $$($(1)_DEPS)
	@make -s -C $$($(1)_DIR) ARCH=$(ARCH) ALL=$(1)

compile-cputests-$(1): $$($(1)_APP)-$(ARCH).elf \
					  $$($(1)_APP)-$(ARCH).bin \
					  $$($(1)_APP)-$(ARCH).txt
	@mkdir -p $$($(1)_OBJDIR)
	@cd $$($(1)_OBJDIR) && \
		ln -sf $$^ . && \
		rename -f 's/txt$$$$/S/g' *.txt && \
		rename -f 's/-$(ARCH)//g' * \

run-cputests-$(1): $(EMU_BIN) compile-cputests-$(1)
	@cd $$($(1)_OBJDIR) && \
	  ln -sf $(abspath $(EMU_BIN)) emulator && \
	  ./emulator -e ./$(1).elf 2> npc.out

run-nemu-cputests-$(1): $(MIPS32_NEMU) \
						compile-cputests-$(1)
	@cd $$($(1)_OBJDIR) && \
	  ln -sf $(MIPS32_NEMU) nemu && \
	  ./nemu -b -e ./$(1).elf

clean-cputests-$(1):
	@rm -rf $$($(1)_APP)*
endef

.PHONY: clean-cputests compile-cputests run-cputests run-nemu-cputests

clean-cputests:
	@make -s -C $(AM_HOME)/tests/cputest clean

CPUTESTS := $(basename $(notdir $(shell find $(AM_HOME)/tests/cputest -name "*.c")))

compile-cputests: $(addprefix compile-cputests-,$(CPUTESTS))
run-cputests: $(addprefix run-cputests-,$(CPUTESTS))
run-nemu-cputests: $(addprefix run-nemu-cputests-,$(CPUTESTS))

$(foreach c,$(CPUTESTS),$(eval $(call cputests_template,$(c))))
