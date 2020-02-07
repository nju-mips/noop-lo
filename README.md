# MIPS32-NPC(MIPS32 NJU Processor Collection)

> 在基础设施搭建以及代码编写过程中，从下列项目借鉴了很多：
* [riscv-sodor](https://github.com/ucb-bar/riscv-sodor)
* [rocket-chip](https://github.com/freechipsproject/rocket-chip)
* [riscv_pard_fpga](http://10.30.7.141/pard/riscv_pard_fpga)
* [noop](https://git.njuics.cn/syslab17/noop)

---

## 准备工作

### clone这个repo
```bash
git clone https://github.com/njuallen/mips32-npc.git
```

### 安装gcc mips32工具链
```
sudo apt-get update
sudo apt-get install gcc-mips-linux-gnu
sudo apt-get install g++-mips-linux-gnu
```

### 安装scala工具链

1. 安装Java
   对于ubuntu 18.04，由于default-jdk版本的问题，运行sbt、scala会出错。因此建议安装oracle Hotspot JVM。
   从Java官网下载jre-8u171-linux-x64.tar.gz并解压缩到个人home目录的java目录下，将下列行加入profile。
```
export JAVA_HOME=~/java
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

2. [安装sbt](http://www.scala-sbt.org/release/docs/Installing-sbt-on-Linux.html)
```
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
```

### 安装verilator

对于ubuntu 14.04/16.04
```
# make autoconf g++ flex bison should be available
wget https://www.veripool.org/ftp/verilator-3.906.tgz
tar -xzf verilator-3.906.tgz
cd verilator-3.906
unset VERILATOR_ROOT
./configure
# use -jN if CPU has N cores
make
# add the following lines to your profile
export VERILATOR_ROOT=$PWD
export PATH=$PATH:$VERILATOR_ROOT/bin
```

对于ubuntu 18.04，请使用
```
sudo apt-get install verilator
```

### clone AM及MIPS32-NEMU

```
git clone https://github.com/njuallen/nexus-am.git
git clone https://github.com/njuallen/mips32-nemu.git
```

设置环境变量

将下列命令修改后添加到你的.profile文件或者添加到.bashrc文件中。
```
export AM_HOME=path_to_am
export MIPS32_NEMU_HOME=path_to_mips32-nemu
```
你可以在所在的命令行界面中运行`source .profile`或`source .bashrc`使之生效。
需要注意的是，运行上述命令仅仅是针对你当前用的shell设置了环境变量，如果切换到其他窗口，你还需要再执行source命令。
为方便起见，建议你关闭所有窗口，log out后再重新log in进入系统，这样子可以确保每个新开的shell窗口都设置好了上述环境变量。

---

## 编译运行

### 编译

```
$ make
```

### 使用verilator进行仿真运行
```
$ make sim # 请在工作目录下准备好bin.txt
```

### 使用vivado-xsim进行仿真运行（结果更加可靠）
```
$ make xsim # 请在工作目录下准备好bin.txt
```

### 生成bitstream
```
$ make bit
```

### 将bit文件编程到开发板上
```
$ make prog
```

### 打开项目对应的vivado项目
```
$ make vivado
```

以上描述的仿真流程需要手动将程序处理成bin.txt，才能运行，如果要运行cputest和microbench，有如下的一键运行方式。
### 运行cputest中的某一个程序fact
```
$ make run-fact
```
### 批量运行cputest
```
$ make run-cputest
```
### 运行microbench
```
$ make run-microbench
```

上述命令的运行目录以及输出的log文件，全部在output/cputest/program_name output/microbench文件夹下。

关于使用nemu运行程序，以及与nemu diff，请阅读doc/diff.md。

---

## 项目进展

现在的处理器能运行cputest以及microbench。

### Core

* 顺序流水线
* gshare branch prediction + set associative BTB + RAS
* full pipeline forwarding
* AM-Asye(Interrupt and Exception)

### Cache

* 1 cycle load to use latency
* set-associative
* pipelined(block on miss)
* blocking
* random replacement

### 外设

#### 仿真

* 支持uart（仅能输出，不能输入）
* GPIO（用来trap以及结束运行）
* VGA/ps2尚未支持

#### FPGA

* uart（输入/输出）
* GPIO
* VGA
* ps2键盘

### 访存

* AXI4

---


## FAQ

*如何开发调试，如何获取更多资源*: 请见doc目录

---

## TODO

### 处理器

* Out of Order
* 支持pte
* 跑通Nanos，Linux

### 开发环境

* 完善MIPS32-NEMU，支持更多的指令，跑过更多的测试用例。MIPS32-NEMU现在能跑过所有cputest、microbench、nanos、nwm，同时在外设方面支持uart、GPIO与VGA。
* 完善外设仿真，争取能支持AM的VGA以及PS2键盘
