# 项目介绍

我们项目的名字是mips32-npc，即NJU Processor Collection。即我们这个会是一系列的处理器。我们现在只有mips32_npc这一个处理器，未来我们可能会加进去更多。参照emulator目录和src目录下的结构，我们可以看到都分为了commom和mips32_npc，common中是所有处理器共有的部分，而其他目录下，则是每个处理器自己的设计。

## 项目目录

### RTL source code
* *src* chisel source code
### verilator simulation code
* *emulator* 仿真需要的verilog，cpp文件及脚本
### FPGA流程相关
* *mk.tcl* 用于生成vivado项目的tcl脚本
* *core* 核心相关代码
* *uncore* 开发板相关代码、block design等
* *zynq_sw* 烧板子所需的全部文件，uboot，dtb，bitstream文件等
* *sim* 使用vivado xsim仿真
* *lib* verilog代码
### 项目相关
* *Makefile*和*Makefile.check*等文件夹下都是scala编译产生的class文件，我们不用关心
* *build.sbt* scala sbt的工程定义
* *project*和*target*等文件夹下都是scala编译产生的class文件，我们不用关心
* *doc*
* *LICENSE*
* *README.md*
* *output* 所有生成的product，可执行文件，vivado项目等
* *scripts* 使用的脚本
