#ifndef NEMU_API_H
#define NEMU_API_H

#ifdef __cplusplus
extern "C" {
#endif

#include "memory.h"
#include "device.h"
#include "cpu.h"

extern nemu_state_t nemu_state;
extern work_mode_t work_mode;

/* APIs exported by nemu-mips32 */
extern CPU_state cpu;
extern void cpu_exec(uint64_t);
extern void print_registers();
extern void print_instr_queue(void);
extern work_mode_t parse_args(int argc, const char *argv[]);
extern work_mode_t init_monitor(void);
extern void init_sdl(void);
extern void init_mmio(void);
extern void init_events(void);
extern uint32_t paddr_peek(paddr_t addr, int len);
extern uint32_t get_current_pc();
extern uint32_t get_current_instr();
extern device_t *get_device_list_head();
/* APIs exported by nemu-mips32 */

/* ddr_dev, bram_dev */

#ifdef __cplusplus
}
#endif


// wrappers for nemu-mips32 library
class NEMU_MIPS32 {
public:
  NEMU_MIPS32(int argc, const char *argv[]) {
	parse_args(argc, argv);

	init_sdl();
	init_mmio();
	init_monitor();
    init_events();
  }

  void exec_one_instr() { cpu_exec(1); }

  void dump() {
	eprintf("================nemu instrs=================\n");
	print_instr_queue();
	eprintf("==============nemu registers================\n");
	print_registers();
	eprintf("==============nemu status end===============\n");
  }

  uint32_t pc() { return ::get_current_pc(); }
  uint32_t gpr(uint32_t i) { return cpu.gpr[i]; }

  uint32_t get_instr() {
	return ::get_current_instr();
  }

  void set_c0_count(uint64_t count) {
	cpu.cp0.count[0] = count;
	cpu.cp0.count[1] = count >> 32;
  }
};

#endif
