# NJU Out-of-Order Processor

NJU Out-of-Order Processor (NOOP) is a superscalar Out-of-Order processor designed for teaching purpose.

Vivado 2016.2 is required to create the project. Run
```
make project PRJ=xxx
```
where `xxx` is the project name. After that, a vivado project is created under `build/xxx`.

Currently, this project is only targeting to zedboard.

## Basic framework

### Zynq system

### NOOP internals

The state-of-the-art programming assignments of computer architecture usually set instruction
pipeline as the final goal. The design of these assignments are not easy to scale to a superscalar
out-of-order processor.

NOOP is trying to provide a design to achieve the goal. NOOP constitutes with several submodules
related to pipeline. Submodules use message passing to communicate with each other. This can remove
global controller, which makes the design hard to scale, such as global state machines, global blocking
signals.

Message passing is achieved by the AXI stream protocol. Each message channel connects a pair of
submodules with a specific functionality. Message channels are named in the format of
```
(M|S)_[src]_[dest]_[label]
```
`M` and `S` indicate whether this module is master or slave. `src` is the name of the master module,
and `dest` is for the slave. `label` is used to distinguish different channels with different purpose
within the same pair of modules.
```
------+                   +-----
      |                   |
 IFU  |===================| IDU
      |-+               +-|
------+ |               | +-----
        v               v
M_IFU_IDU_instr    S_IFU_IDU_instr

```

In NOOP, each message channel only uses `tvalid`, `tready`, and `tdata`. `tdata` is packaged with
all information for the master module to communicate with the slave module. With `tvalid` and
`tready`, different message channels can decouple their blocking state. This is very critical to
an out-of-order design. For example, DISPATCH stage may still continue with a blocking ISSUE
stage. Global blocking signals are not easy to achieve this.

This project provide some verilog macros to write code with message channels (see [msg_if.vh](./rtl/noop/msg_if.vh)).
* `msg_master_if(msg)` - Declare a master interface port for a message channel. Used within the port declaration of a module.
* `msg_slave_if(msg)` - Declare a slave interface port for a message channel. Used within the port declaration of a module.
* `msg_wire(msg)` - Declare a bundle of wire signals for a message channel. Used within a module definition.
* `msg_connect_if(MS, msg)` - Connect the bundle of wire signals of a message channel with its child module. Used within the instantiation of a submodule.
* `msg_put(msg, field, sig)` - Put the value of `sig` to the `field` of `tdata` in the master `msg` interface. Used within the module definition with a master message channel.
* `msg_get(msg, field, sig)` - Get the value of the `field` of `tdata` in the slave `msg` interface to `sig`. Used within the module definition with a slave message channel.
* `msg_putall(msg, sig)` - Put the value of `sig` to the whole `tdata` in the master `msg` interface. Used within the module definition with a master message channel.
* `msg_getall(msg, sig)` - Get the value of the whole `tdata` in the slave `msg` interface to `sig`. Used within the module definition with a slave message channel.

The fields of `tdata` of different message channels are maintained by a [description file](./doc/msg_define.txt).
The format of this file is like
```
src1 -> dest1 label1
field1 len1
field2 len2
...
fieldn lenn
	# Definitions of different message channels are separated by an empty line.
src2 -> dest2 label2
field1 len1
field2 len2
...
fieldm lenm

...
```
[This script](./doc/gen_msg_param.py) is used to generate a verilog header file used by the macros above.

## Single-cycle

```
          +------------------------------------+
   clk -->+                                    |
  rstn -->+                   +-> ALU -+       |
          |                   |-> BRU -|       |
          |   IF -> ID -> IS -+-> MDU -+> WB   |
          |   |               +-> LSU -+       |
          |   |                    |           |
          +---+--------------------+-----------+
              |                    |
              v                    v
         M_AXI_instr          M_AXI_data
```

### Ports

* `clk` - clock
* `rstn` - reset, active low
* `M_AXI_instr` - an AXI-lite channel for instruction fetch, note that this channel never writes
* `M_AXI_data` - an AXI-lite channel for data access

* IF - instruction fetch, fetch instruction from memory
* ID - instruction decode, generate decode signals
* IS - issue, prepare operands (from register file or immediate) for function units
* EX - execute, 4 types of function units are supported
  * ALU, load store unit, multiplication division unit, branch unit
* WB - write back, write result to register file

Note that a non-blocking single-cycle CPU can only use LUTRAM as memory.
Data in LUTRAM can be accessed without any latency.
Accessing other types of memory may break the concept of single-cycle, which makes it not finish an
instruction within single cycle.

### Special control flows

Special control flows should be considered about how to fit them in the message passing framework.

#### Branch

#### System instruction

#### Interrupt/Exception

## Single-cycle with blocking

## I4 (Static pipeline)

## I4 with forwarding

## I2OI

## I2OI with rename

## IO2I

## 2-issue

## Other improvements

## About Vivado 2017.1
Description: Java Error Messages when opening implemented design or run simulation in Vivado 2017.1.

Solution: reference to [here](https://www.xilinx.com/support/answers/69088.html).