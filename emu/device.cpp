#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <fstream>

#include "common.h"
#include "nemu_api.h"

static bool finished = false;
static int ret_code = 0;

bool is_finished(void) { return finished; }
int get_exit_code(void) { return ret_code; }

#define GPIO_TRAP 0x10000000

extern "C" void
device_tick(unsigned char in_req_valid, int in_req_bits_addr,
            int in_req_bits_data, unsigned char in_req_bits_fcn,
            unsigned char in_req_bits_wstrb, int *in_resp_bits_data) {
  if (!in_req_valid) return;

  /* deal with read */
  if (in_req_bits_fcn != 1) {
    /* all registers defined in IP manual have length 4 */
    *in_resp_bits_data = paddr_peek(in_req_bits_addr, 4);
    return;
  }

  /* deal with write */
  switch (in_req_bits_addr) {
  case GPIO_TRAP:
    finished = true;
    ret_code = in_req_bits_data;
	if (in_req_bits_data == 0)
	  printf(ANSI_COLOR_GREEN "EMU: HIT GOOD TRAP" ANSI_COLOR_RESET "\n");
	else
	  printf(ANSI_COLOR_RED "EMU: HIT BAD TRAP" ANSI_COLOR_RESET "\n");
    break;
  }
}
