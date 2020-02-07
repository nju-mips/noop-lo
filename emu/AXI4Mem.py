#!/usr/bin/python

id_width = 4
data_width = 64
# fields
fields = {
    # write address channel signals
    "awid": {"io": "input", "width": id_width},
    "awaddr": {"io": "input", "width": 32},
    "awlen": {"io": "input", "width": 8},
    "awsize": {"io": "input", "width": 3},
    "awburst": {"io": "input", "width": 2},
    "awlock": {"io": "input", "width": 1},
    "awcache": {"io": "input", "width": 4},
    "awprot": {"io": "input", "width": 3},
    "awvalid": {"io": "input", "width": 1},
    "awready": {"io": "output", "width": 1},

    # write data channel signals
    "wid": {"io": "input", "width": id_width},
    "wdata": {"io": "input", "width": data_width},
    "wstrb": {"io": "input", "width": data_width / 8},
    "wlast": {"io": "input", "width": 1},
    "wvalid": {"io": "input", "width": 1},
    "wready": {"io": "output", "width": 1},

    # write response channel signals
    "bid": {"io": "output", "width": id_width},
    "bresp": {"io": "output", "width": 2},
    "bvalid": {"io": "output", "width": 1},
    "bready": {"io": "input", "width": 1},

    # read address channel signals
    "arid": {"io": "input", "width": id_width},
    "araddr": {"io": "input", "width": 32},
    "arlen": {"io": "input", "width": 8},
    "arsize": {"io": "input", "width": 3},
    "arburst": {"io": "input", "width": 2},
    "arlock": {"io": "input", "width": 1},
    "arcache": {"io": "input", "width": 4},
    "arprot": {"io": "input", "width": 3},
    "arvalid": {"io": "input", "width": 1},
    "arready": {"io": "output", "width": 1},

    # read data channel signals
    "rid": {"io": "output", "width": id_width},
    "rdata": {"io": "output", "width": data_width},
    "rresp": {"io": "output", "width": 2},
    "rlast": {"io": "output", "width": 1},
    "rvalid": {"io": "output", "width": 1},
    "rready": {"io": "input", "width": 1}
}

def get_dpi_type_width(width):
    if width == 1:
        return "bit", 1
    if width <= 8:
        return "byte", 8
    if width <= 16:
        return "shortint", 16
    if width <= 32:
        return "int", 32
    if width <= 64:
        return "longint", 64

    printf ("Invalid width %d\n" % width)

def get_verilog_width(width):
    if width == 1:
        return ""
    else:
        return "[%d:0]" % (width - 1)

def gen_dpi_import_field(f, prefix):
    # sample
    # output bit     debug_req_valid,
    # input  bit     debug_req_ready,
    cnt = 0
    for field in fields:
        f.write("  %s %s %s_%s" % (fields[field]["io"],
            fields[field]["dpi_type"], prefix, field))
        # the last field should not be followed by a ",\n"
        cnt += 1
        if cnt != num_fields:
            f.write(",\n")

def gen_module_io_field(f, prefix):
    # sample
    # input         debug_req_ready,
    # output [ 6:0] debug_req_bits_addr,
    cnt = 0
    for field in fields:
        f.write("  %s %s %s_%s" % (fields[field]["io"],
            get_verilog_width(fields[field]["width"]), prefix, field))
        cnt += 1
        if cnt != num_fields:
            f.write(",\n")

def gen_delayed_input_field(f, prefix, delay):
    # sample
    # wire #0.1 __debug_resp_valid = debug_resp_valid;
    # wire [31:0] #0.1 __debug_resp_bits_resp = {30'b0, debug_resp_bits_resp};
    for field in fields:
        dpi_width = fields[field]["dpi_width"]
        width = fields[field]["width"]
        if fields[field]["io"] == "input":
            f.write("  wire %s %s __%s_%s = " % (
                get_verilog_width(dpi_width), delay, prefix, field))
            if width < dpi_width:
                f.write("{%d'b0, %s_%s};\n" % (dpi_width - width, prefix, field))
            else:
                f.write("%s_%s;\n" % (prefix, field))

def gen_delayed_output_field(f, prefix, delay):
    #sample
    #bit __debug_req_valid;
    #int __debug_req_bits_addr;
    #assign #0.1 debug_req_valid = __debug_req_valid;
    #assign #0.1 debug_req_bits_addr = __debug_req_bits_addr[6:0];

    # define fields
    for field in fields:
        if fields[field]["io"] == "output":
            f.write("  %s __%s_%s;\n" % (
                fields[field]["dpi_type"], prefix, field))
    f.write("\n")

    for field in fields:
        dpi_width = fields[field]["dpi_width"]
        width = fields[field]["width"]
        if fields[field]["io"] == "output":
            f.write("  assign %s %s_%s = __%s_%s" % (
                delay, prefix, field, prefix, field))
            if width < dpi_width:
                f.write("%s" % get_verilog_width(width))
            f.write(";\n")

def gen_instantiation_field(f, prefix):
    cnt = 0
    for field in fields:
        f.write("      __%s_%s" % (prefix, field))
        cnt += 1
        if cnt != num_fields:
            f.write(",\n")

def gen_axi4io_macro(f):
    #sample
    # #define AXI4IO(prefix, underscore) \
    #    unsigned char* prefix##underscore##awready, \
    #    unsigned char  prefix##underscore##awvalid, \
    f.write("#define AXI4IO(prefix, underscore) \\\n")
    cnt = 0
    for field in fields:
        f.write("  %s" % fields[field]["c_type"])
        # output should be pointer type
        if fields[field]["io"] == "output":
            f.write("*")
        f.write(" prefix##underscore##%s" % field)
        cnt += 1
        if cnt != num_fields:
            f.write(", \\")
        f.write("\n")

def gen_axi4args_macro(f):
    #sample
    # #define AXI4ARGS(prefix) \
    #    prefix##_awready, \
    #    prefix##_awvalid, \
    f.write("#define AXI4ARGS(prefix) \\\n")
    cnt = 0
    for field in fields:
        f.write("  prefix##_%s" % field)
        cnt += 1
        if cnt != num_fields:
            f.write(", \\")
        f.write("\n")

dpi_type_to_c_type = {
    "bit": "unsigned char",
    "byte": "unsigned char",
    "shortint": "short int",
    "int": "int",
    "longint": "long long"
}

if __name__ == "__main__":
    # calculate the corresponding dpi type, width and c_type of each field
    # the key is the name
    # the value is a tuple (dpi_type, dpi_type_bit_width)
    for field in fields:
        dpi_type_width = get_dpi_type_width(fields[field]["width"])
        fields[field]["dpi_type"] = dpi_type_width[0]
        fields[field]["dpi_width"] = dpi_type_width[1]
        fields[field]["c_type"] = dpi_type_to_c_type[dpi_type_width[0]]

    num_fields = len(fields)
    delay = "#0.1"

    with open("AXI4Mem.v", "w") as f:
        f.write("// Generated by AXI4Mem.py\n")

        # generate DPI-C function import statement
        f.write("import \"DPI-C\" function void mem_tick\n")
        f.write("(\n")
        f.write("  input bit reset,\n")
        gen_dpi_import_field(f, "imem")
        f.write(",\n")
        gen_dpi_import_field(f, "dmem")
        f.write("\n")
        f.write(");\n")
        f.write("\n")

        # generate Module AXI4Mem
        f.write("module AXI4Mem(\n")
        f.write("  input clk,\n")
        f.write("  input reset,\n")
        gen_module_io_field(f, "imem")
        f.write(",\n")
        gen_module_io_field(f, "dmem")
        f.write("\n")
        f.write(");\n")
        f.write("\n")

        # delayed inputs
        f.write("  // delayed inputs\n")
        # delay reset
        # f.write("  wire [7:0] %s __reset = {7'b0, reset};\n" % delay)
        f.write("  wire %s __reset = reset;\n" % delay)
        gen_delayed_input_field(f, "imem", delay)
        f.write("\n")
        gen_delayed_input_field(f, "dmem", delay)
        f.write("\n")

        # delayed outputs
        f.write("  // delayed outputs\n")
        gen_delayed_output_field(f, "imem", delay)
        f.write("\n")
        gen_delayed_output_field(f, "dmem", delay)
        f.write("\n")

        # generate always
        # sample
        #always @(posedge clk)
        #begin
        #  __exit = debug_tick(
        #    __debug_resp_bits_data
        #  );
        #end
        #
        # why should we use negedge?
        # since our memory is clock triggered
        # and the pc is posedge triggered
        # which means, pc is up to date when clock equals zero
        # so we let the memory be negedge triggered
        # so when next time, clock equals 1
        # the memory will provide up to date instructions
        # 
        f.write("  always @(negedge clk)\n")
        f.write("  begin\n")
        f.write("    mem_tick(\n")
        f.write("      __reset,\n")
        gen_instantiation_field(f, "imem")
        f.write(",\n")
        gen_instantiation_field(f, "dmem")
        f.write("\n")
        f.write("    );\n")
        f.write("  end\n")
        f.write("endmodule\n")

    with open("axi4io.h", "w") as f:
        f.write("// Generated by AXI4Mem.py\n")
        f.write("#ifndef __AXI4IO_H\n")
        f.write("#define __AXI4IO_H\n")
        f.write("\n")
        gen_axi4io_macro(f)
        f.write("\n")
        gen_axi4args_macro(f)
        f.write("\n")
        f.write("#endif\n")
