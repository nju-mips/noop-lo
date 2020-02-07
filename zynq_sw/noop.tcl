#===================================================================
#This file is a script to download FPGA bitstream, configure logic,
#download Linux kernel, devicetree and file system, and finally download
#u-boot file and run it on the Zynq zc706 platform
#===================================================================

#Connect Cortex-A9 Processor
connect

targets 2

rst

#Download Bistream (make sure board is in JTAG mode)
fpga -f fpga_top.bit

#Source init file
source ps7_init.tcl

#Reset PS part and Fabric
ps7_init

#important step to reset FPGA logic
#init_user
ps7_post_config

#download Linux Kernel Image
dow -data noop.ub 0x3000000

#download device tree Image
dow -data noop.dtb 0x2a00000

#download u-boot ELF file
dow u-boot.elf

#run u-boot
con

