//==========================================================
// MIPS CPU binary executable file loader
//
// Main Function:
// 1. Loads binary excutable file into distributed memory
// 2. Waits MIPS CPU for finishing program execution
//
// Author:
// Yisong Chang (changyisong@ict.ac.cn)
// Xianfei Ou   (141242068@smail.nju.edu.cn)
//
// Revision History:
// 14/06/2016	v0.0.1	Add cycle counte support
// 31/07/2018	v0.0.2	Remove la jr instruction
//                      Add support to binary
//==========================================================
#include <elf.h>
#include <fcntl.h>
#include <memory.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>  
#include <sys/stat.h>  
#include <sys/stat.h>
#include <sys/types.h>  
#include <sys/types.h>
#include <unistd.h>  

#include <assert.h>
#include <sys/time.h>
#include <time.h>

#define BRAM_SIZE		(1 << 13)
#define BRAM_BASE		0x40002000

#define DDR_SIZE		(256 * 1024 * 1024)
#define DDR_BASE		0x10000000

/* GPIO refer to zynq_soc block design and noop.dts */
#define GPIO_RESET_SIZE	(1 << 16)
#define GPIO_RESET_BASE	0x41200000

#define GPIO_TRAP_SIZE	(1 << 12)
#define GPIO_TRAP_BASE	0x40000000
#define GPIO_TRAP_INIT  0xff

void *bram_base;
void *ddr_base;
volatile uint32_t *gpio_reset_base;
volatile uint32_t *gpio_trap_base;
int	fd;

void *mips_addr(uintptr_t p) {
  if(p < BRAM_SIZE) {
	return bram_base + p;
  } else if(p >= DDR_BASE && p < DDR_BASE + DDR_SIZE) {
	return ddr_base + (p - DDR_BASE);
  } else {
	printf("Illegal address 0x%08x\n", p);
	exit(1);
  }
}

size_t get_file_size(const char *img_file) {
  struct stat file_status;
  lstat(img_file, &file_status);
  return file_status.st_size;
}

void *read_file(const char *filename, size_t *size) {
  /* symbolic file is not support */
  *size = get_file_size(filename);
  int fd = open(filename, O_RDONLY);
  if(fd == -1) return NULL;

  // malloc buf which should be freed by caller
  void *buf = malloc(*size);
  int len = 0;
  while(len < *size) {
	len += read(fd, buf, *size - len);
  }
  return buf;
}

void loader(const char *file) {
  size_t size = 0;
  void *buf = read_file(file, &size);
  Elf32_Ehdr *elf = buf;

  const uint32_t elf_magic = 0x464c457f; // 0xBadC0de;
  uint32_t *p_magic = (void *)buf;
  /* check the magic number */
  if(*p_magic != elf_magic) {
	printf("Parse as ELF failed, memcpy directly\n");
	memcpy(ddr_base, buf, size);
  } else {
	int i = 0;
	for(; i < elf->e_phnum; i++) {
	  Elf32_Phdr *ph = (void*)buf + i * elf->e_phentsize + elf->e_phoff;
	  // scan the program header table, load each segment into memory
	  if(ph[i].p_type != PT_LOAD) { continue; }

	  void *va = mips_addr(ph[i].p_vaddr);

	  // read the content of the segment from the ELF file
	  // to the memory region [VirtAddr, VirtAddr + FileSiz)
	  memcpy(va, buf + ph[i].p_offset, ph[i].p_filesz);

	  // zero the memory region
	  // [VirtAddr + FileSiz, VirtAddr + MemSiz)
	  memset(va + ph[i].p_filesz, 0, ph[i].p_memsz - ph[i].p_filesz);
	}
  }

  /* manually set entry instruction if needed
  uint32_t entry = elf->e_entry;
  if(entry >= DDR_BASE && entry < DDR_BASE + DDR_SIZE) {
	// entry point is located in ddr
	// we put the following code in the reset vector
	//	la, $a1, entry
	//	jr, $a1
	uint32_t *bram = bram_base;
	bram[0] = 0x3c040000 | (entry >> 16);
	bram[1] = 0x34840000 | (entry & 0xffff);
	bram[2] = 0x00800008;
  } else if(entry != 0x0) {
	printf("The entry point is not 0!\n");
	close(fd);
	exit(1);
  }
  */
  close(fd);
}

void* create_map(size_t size, int fd, off_t offset) {
  void *base = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, offset);

  if (base == NULL) {
	perror("init_mem mmap failed:");
	close(fd);
	exit(1);
  }

  return base;
}

void init_map() {
  fd = open("/dev/mem", O_RDWR|O_SYNC);  
  if (fd == -1)  {  
	perror("init_map open failed:");
	exit(1);
  } 

  bram_base = create_map(BRAM_SIZE, fd, BRAM_BASE);
  gpio_reset_base = create_map(GPIO_RESET_SIZE, fd, GPIO_RESET_BASE);
  gpio_trap_base = create_map(GPIO_TRAP_SIZE, fd, GPIO_TRAP_BASE);
  ddr_base = create_map(DDR_SIZE, fd, DDR_BASE);
}

void resetn(int val)         { gpio_reset_base[0] = val; }
void write_trap(uint8_t val) { gpio_trap_base[0] = val; }
uint8_t read_trap()          { return gpio_trap_base[2]; }

uint8_t wait_for_finish() {
  uint8_t ret;
  while((ret = read_trap()) == GPIO_TRAP_INIT);
  return ret;
}

void finish_map() {
  munmap((void *)bram_base, BRAM_SIZE);
  munmap((void *)gpio_reset_base, GPIO_RESET_SIZE);
  munmap((void *)gpio_trap_base, GPIO_TRAP_SIZE);
  munmap((void *)ddr_base, DDR_SIZE);
  close(fd);
}

void exit_loader(int signum) {
  resetn(0);
  finish_map();
  printf("Kill MIPS CPU...\n");
  exit(0);
}

int main(int argc, char *argv[]) {
  time_t start, end;	
  /* map some devices into the address space of this program */
  init_map();

  signal(SIGINT, exit_loader);

  /* reset MISP CPU */
  resetn(0);

  sleep(1);
  printf("Sleep 1 seconds, load %s\n", argv[1]);

  /* load MIPS binary executable file to distributed memory */
  loader(argv[1]);

  write_trap(GPIO_TRAP_INIT);

  /* finish reset MIPS CPU */
  resetn(1);

  /* start timing */
  start = time(NULL);

  /* wait for MIPS CPU finish  */
  printf("Waiting MIPS CPU to finish...\n");
  uint8_t ret = wait_for_finish();

  /* finish timing */
  end = time(NULL);
  printf("Total time: [%.2fs]\n", difftime(end, start));
  printf("MIPS CPU Execution is finished...\n");

  if(ret == 0) {
	printf("\e[32m[%s] HIT GOOD TRAP!\e[0m\n", argv[1]);
  } else {
	printf("\e[31m[%s] HIT BAD TRAP!\e[0m\n", argv[1]);
  }

  /* reset MISP CPU */
  resetn(0);

  finish_map();

  return 0; 
} 
