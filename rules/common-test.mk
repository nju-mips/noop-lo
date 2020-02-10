# note INPUT=REF is designed for microbench
# arg1 dir
# arg2 name eg. videotest microbench
define test_template
$(2)_APP := $(1)/build/$(2)
$(2)_OBJDIR := $(OBJ_DIR)/$(2)
$(2)_DEPS != find $(1) -regex ".*.\(c\|h\|cc\|cpp\|S\)"

.PHONY: compile-$(2) run-$(2) run-nemu-$(2) clean-$(2)

$$($(2)_APP)-$(ARCH).%: $$($(2)_DEPS)
	@make -s -C $(1) ARCH=$(ARCH)

compile-$(2): $$($(2)_APP)-$(ARCH).elf \
			  $$($(2)_APP)-$(ARCH).bin \
			  $$($(2)_APP)-$(ARCH).txt
	@mkdir -p $$($(2)_OBJDIR)
	@cd $$($(2)_OBJDIR) && \
		ln -sf $$^ . && \
		rename -f 's/txt$$$$/S/g' *.txt && \
		rename -f 's/-$(ARCH)//g' * \

run-$(2): $(EMU_BIN) compile-$(2)
	@cd $$($(2)_OBJDIR) && \
	  ln -sf $(abspath $(EMU_BIN)) emulator && \
	  ./emulator -e ./$(2).elf 2> npc.out

run-nemu-$(2): $(MIPS32_NEMU) compile-$(2)
	@cd $$($(2)_OBJDIR) && \
	  ln -sf $(MIPS32_NEMU) nemu && \
	  ./nemu -b -e ./$(2).elf

clean-$(2):
	@make -s -C $(1) ARCH=$(ARCH) clean
endef

INPUT ?= REF # for microbench, another mode is TEST

AM_TESTS := $(filter-out cputests,$(shell ls $(AM_HOME)/tests))
AM_APPS := $(shell ls $(AM_HOME)/apps)

# AM apps
$(foreach app,$(AM_APPS),$(eval $(call test_template,$(AM_HOME)/apps/$(app),$(app))))

# AM tests
$(foreach app,$(AM_TESTS),$(eval $(call test_template,$(AM_HOME)/tests/$(app),$(app))))

# insttest
$(eval $(call test_template,$(INSTTEST_HOME),insttest))

# nanos
$(eval $(call test_template,$(NANOS_HOME),nanos))
