# Debug流程介绍

**需要整理**

* verilator仿真调试
* xsim仿真调试（看波形）
* FPGA上板调试（ILA）

* printf调试
* diff调试，regression基础设施
* ILA debug。

## crosscheck
我们现在的crosscheck方式是：NEMU在执行外每一条指令后，输出commit log，我们的npc在执行完后，也输出commit log，我们在Makefile中自动运行nemu以及npc，并对两者的commit log进行比对。
**crosscheck极大地提升了调试效率**。

## 开发调试

### printf大法

使用chisel进行调试非常方便，直接使用printf即可，printf最后会被转成verilog中的fwrite。值得注意的是，verilog在仿真时，组合逻辑电路的执行在先，等组合逻辑稳定下来后，才会执行fwrite等function/task，在最后才会执行阻塞赋值语句。具体到verilator上，寄存器等的赋值总是在clock为高电平的最后执行的。这对于理解和printf的某些输出非常重要。
例如下面的例子：
```
VTop dut; // 实例化我们的CPU

// 设置高电平
dut.clock = 1;
// 执行直到电路收敛，在此过程中，我们的chisel代码printf的pc值会被输出
dut.eval();

// 从Top的接口中读取pc
cout << dut.io_di_pc;
```
在上面的这个例子中，两处输出的pc值会是不同的，因为寄存器更新是在printf之后执行的。

### dump大法
如果调试Cache，memory通路，多需要完整地打印出协议的握手信息。因此，对于我们这边用到的两种Memory接口，我们都提供了dump函数，只要dump他们，就可以看到接口上走过的全部访存请求。

### diff大法
让npc在每一条指令后输出commit log(包含next pc，hi、lo以及所有通用寄存器的值)，将执行过程中产生的commit log与nemu产生的commit log进行对比，即可发现是在哪条指令后死的了。
