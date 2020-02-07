# chisel simulation流程介绍

## 仿真步骤
从写的chisel，到最后仿真时使用的可执行文件，经过了如下步骤。

### chisel to verilog
这一步是chisel和firrtl两个scala库完成的。
我们写的chisel，实际上就是scala，我们使用sbt运行chisel，就是在执行scala代码，执行分为两个阶段：
1. 生成硬件描述中间代码fir，详见output/SimTop.fir
2. 根据中间代码fir，再生成verilog，详见output/SimTop.v

### verilog to C++
这一步是verilator完成的。
verilator将每一个verilog模块转成C++的类，实例化这个类，即相当于实例化了这个硬件模块。顶层模块就变成了一个名为VSimTop的C++类，详见output/VSimTop.h。我们在emulator/emulator.cpp中实例化并执行这个类，就可以仿真CPU的运行。以下是一段示例代码，我们以此说明如何CPU是如何仿真执行的：

```
VTop dut; // 实例化我们的CPU

// 设置CPU的输入信号的值
dut.reset = 1;
// 下面四行代码，就跑完了一个时钟周期，一个时钟周期包括一个高电平，加一个低电平
dut.clock = 0;
dut.eval();
dut.clock = 1;
dut.eval();

// 打印Top模块一个输出的信号
cout << dut.io_di_pc;
```

## 仿真内存以及外设的实现

仿真时使用的内存是AXI接口的内存，大小为128MB，是从rocketchip中扒出来的，由chisel生成，基本不可读，位于emulator/SimAXIMem.v中。SimAXIMem使用LatencyPipe加上了固定周期的延迟，详见mips32-npc/top.scala。
外设使用C++代码进行仿真，使用DPI-C接口与verilog代码进行桥接。由于我们使用的是DPI-C的function，而不是task，function只会被执行一次，所以无法很好地模拟组合逻辑，也可能会出现由于仿真执行顺序的问题而导致的，该在一个周期内干完的，没有干这种事情，请务必小心。

## 多语言桥接
chisel调用verilog模块，使用的是BlackBox，verilog模块调用C++函数，使用DPI-C接口。
