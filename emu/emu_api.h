#include <cstdlib>
#include <cassert>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <vector>
#include <utility>
#include <ctime>

#include "emu.h"
#include "emu__Dpi.h"

#include "common.h"
#include "nemu_api.h"

#define GPRS(X) \
	X(0)  X(1)  X(2)  X(3)  X(4)  X(5)  X(6)  X(7) \
	X(8)  X(9)  X(10) X(11) X(12) X(13) X(14) X(15) \
	X(16) X(17) X(18) X(19) X(20) X(21) X(22) X(23) \
	X(24) X(25) X(26) X(27) X(28) X(29) X(30) X(31)

// wrappers for nemu-mips32 library

class Emulator {
  std::shared_ptr<emu> dut_ptr;
  std::shared_ptr<NEMU_MIPS32> nemu_ptr;

  // emu control variable
  bool need_generate_bin_txt;
  uint32_t seed;
  uint64_t max_cycles, cycles;

  template <class UInt>
  void prepare_bin_txt(const device_t *dev, const char *file) {
	assert(dev->map && "not a valid device");
	size_t ulen = sizeof(UInt);
	ssize_t dev_len = dev->size / ulen;
	ssize_t vlen = dev_len - 1; /* length of valid data */
	const UInt *data_ptr = (const UInt*)dev->map(0, 0);

	/* detect the data boundary */
	for (vlen --; (ssize_t)vlen >= 0; vlen --) {
	  if (data_ptr[vlen] != 0) {
		vlen += 10 * ulen;
		assert (vlen < dev_len);
		break;
	  }
	}

	/* generate the data */
	std::ofstream ofs(file);
	for (auto i = 0; i < vlen; i ++) {
	  ofs.fill('0');
	  ofs << std::hex << std::setw(ulen * 2) << data_ptr[i] << "\n";
	}
  }

  void check_registers(uint64_t cycles) {
#define check(cond, ...) \
	if(!(cond)) { \
	  nemu_ptr->dump(); \
	  eprintf("nemu: %s:%d: %s: checkion `%s' failed\n", __FILE__, __LINE__, __func__, #cond); \
	  eprintf(__VA_ARGS__); \
	  abort(); \
	}

	check(nemu_ptr->pc() == dut_ptr->io_nemu_pc,
		"cycle: %lu pc %08x <> %08x\n", cycles, nemu_ptr->pc(), dut_ptr->io_nemu_pc);
	check(nemu_ptr->get_instr() == dut_ptr->io_nemu_instr,
		"cycle: %lu instr %08x <> %08x\n", cycles, nemu_ptr->get_instr(), dut_ptr->io_nemu_instr);

#define GPR_TEST(i) \
	check(nemu_ptr->gpr(i) == dut_ptr->io_nemu_gpr_##i, \
		"gpr[%d] %08x <> %08x\n", i, nemu_ptr->gpr(i), dut_ptr->io_nemu_gpr_##i);
	GPRS(GPR_TEST);
#undef GPR_TEST
  }

  uint32_t get_dut_gpr(uint32_t r) {
    switch (r) {
#define GET_GPR(i) case i: return dut_ptr->io_nemu_gpr_##i;
	  GPRS(GET_GPR);
#undef GET_GPR
    }
	return 0;
  }

  std::vector<const char *> parse_args(int argc, const char *argv[]);

  static const struct option long_options[];
  static void print_help(const char *file);

  static device_t *find_device(const char *name) {
    for (device_t *head = get_device_list_head(); head; head = head->next) {
      if (strcmp(head->name, name) == 0)
        return head;
    }
    return nullptr;
  }

public:
  // argv decay to the secondary pointer
  Emulator(int argc, const char *argv[]):
	dut_ptr(new std::remove_reference<decltype(*dut_ptr)>::type),
	nemu_ptr(nullptr),
	need_generate_bin_txt(true),
	seed(0), max_cycles(-1), cycles(0)
  {
	seed = (unsigned)time(NULL) ^ (unsigned)getpid();;

	/* init emu, parse seed firstly */
	auto args = parse_args(argc, argv);

	/* srand */
	srand(seed);
	srand48(seed);
	Verilated::randReset(2);

	/* init nemu */
	optind = 0;
	args.push_back(NULL); // for safety
	nemu_ptr.reset(new NEMU_MIPS32(args.size() - 1, &args[0]));

	/* ddr.bin.txt and bram.bin.txt */
	if(need_generate_bin_txt) {
      device_t *bram_dev = find_device("block-ram");
      device_t *ddr_dev = find_device("ddr");
	  prepare_bin_txt<uint32_t>(bram_dev, BRAM_BIN_TXT);
	  prepare_bin_txt<uint64_t>(ddr_dev, DDR_BIN_TXT);
	}

	/* init core */
	reset_ncycles(10);

	/* print seed */
	printf(ANSI_COLOR_BLUE "\ruse random seed %u" ANSI_COLOR_RESET "\n", seed);
  }

  void reset_ncycles(size_t cycles) {
	for(int i = 0; i < cycles; i++) {
	  dut_ptr->reset = 1;
	  dut_ptr->clock = 0;
	  dut_ptr->eval();
	  dut_ptr->clock = 1;
	  dut_ptr->eval();
	  dut_ptr->reset = 0;
	}
  }

  uint32_t get_bits(uint32_t data, uint32_t high, uint32_t low) {
    Assert(high >= low && high <= 31 && low >= 0, "get_bits: invalid range");
    int left_shift = 31 - high;
    // firstly, remove the higher bits, then remove the lower bits
    return ((data << left_shift) >> left_shift) >> low;
  }

  bool get_mfc0_c0_count(uint32_t instr, uint32_t *dest_reg) {
    uint32_t cop0 = get_bits(instr, 31, 26);
    uint32_t mf = get_bits(instr, 25, 21);
    uint32_t rt = get_bits(instr, 20, 16);
    uint32_t rd = get_bits(instr, 15, 11);
    uint32_t sel = get_bits(instr, 2, 0);
    bool is_mfc0_c0_count = cop0 == 0x10 && mf == 0x0 && rd == 0x9 && sel == 0x0;
    *dest_reg = rt;
    return is_mfc0_c0_count;
  }

  void single_cycle() {
	static size_t silent_cycles = 0;

    dut_ptr->clock = 0;
    dut_ptr->eval();

    dut_ptr->clock = 1;
    dut_ptr->eval();

	cycles ++;
	silent_cycles ++;

	if(silent_cycles >= 1000) {
	  printf("cycle: %lu NPC run %ld cycles and have no any commits\n", cycles, silent_cycles);
	  abort();
	}

    if(dut_ptr->io_nemu_valid) {
      silent_cycles = 0;
      uint32_t dest_reg;
      if (get_mfc0_c0_count(dut_ptr->io_nemu_instr, &dest_reg)) {
        nemu_ptr->set_c0_count(get_dut_gpr(dest_reg) - 1);
      }

      nemu_ptr->exec_one_instr();

      /* don't check eret and syscall instr */
      uint32_t instr = nemu_ptr->get_instr();
      if(instr != 0x42000018 && instr != 0x0000000c)
        check_registers(cycles);
    }
  }

  int execute_cycles(uint64_t n) {
	while(!is_finished() && n > 0) {
	  single_cycle();
	  n --;
	}

	if(is_finished()) {
	  // two more cycles to wait instr commit
	  single_cycle();
	  single_cycle();
	  return get_exit_code();
	}

	return n == 0 ? -1 : 0;
  }

  int execute() { return execute_cycles(max_cycles); }
  uint64_t get_cycles() const { return cycles; }
  uint64_t get_max_cycles() const { return max_cycles; }
};
