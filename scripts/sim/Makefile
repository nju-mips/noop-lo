.PHONY: init all clean latest $(ALL)

ALL = $(basename $(notdir $(shell find data/ -name "*.txt")))

all: $(addprefix run., $(ALL))
	@echo "" $(ALL)

$(ALL): %: run.%

run.%: data/%.txt latest
	-cp -rf xsim $*_xsim
	-cp data/$*.txt $*_xsim/bin.txt
	python scripts/run_sim.py $*
	-rm -rf  $*_xsim

init:
	python scripts/init_sim.py
	
clean:
	rm -rf *xsim/ *.txt

latest:
