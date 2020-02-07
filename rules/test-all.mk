include rules/common-test.mk
include rules/cputests.mk

.PHONY: run-tests run-nemu-tests clean-tests

run-tests: run-cputests run-microbench run-insttest
run-nemu-tests: run-nemu-cputests run-nemu-microbench run-nemu-insttest
clean-tests: clean-cputests clean-microbench clean-insttest
