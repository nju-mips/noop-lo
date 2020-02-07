# setting up the project
set script_dir [file dirname [info script]]
set rtl_dir    ${script_dir}/rtl
set lib_dir    $env(NOOP_HOME)/lib
set ip_dir     ${script_dir}/ip-core
set constr_dir ${script_dir}/constr
set data_dir   ${script_dir}/data

# lib src files

# src files
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/fmt.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/seg.vh"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/naive_to_sramlike.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/axilite.vh"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/core_top.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/cpu/pipe_ifu.v"]" "[file normalize "${rtl_dir}/cpu/bpu.v"]" "[file normalize "${rtl_dir}/cpu/adder.v"]" "[file normalize "${rtl_dir}/cpu/ALU.v"]" "[file normalize "${rtl_dir}/cpu/alu_controller.v"]" "[file normalize "${rtl_dir}/cpu/control_load_store.v"]" "[file normalize "${rtl_dir}/cpu/control_mul_div.v"]" "[file normalize "${rtl_dir}/cpu/control_unit.v"]" "[file normalize "${rtl_dir}/cpu/count_leading_zero.v"]" "[file normalize "${rtl_dir}/cpu/cp0.v"]" "[file normalize "${rtl_dir}/cpu/CPU_endianess.vh"]" "[file normalize "${rtl_dir}/cpu/cpu_top.v"]" "[file normalize "${rtl_dir}/cpu/decoder.v"]" "[file normalize "${rtl_dir}/cpu/excepttions.vh"]" "[file normalize "${rtl_dir}/cpu/except_detect1.v"]" "[file normalize "${rtl_dir}/cpu/except_detect2.v"]" "[file normalize "${rtl_dir}/cpu/except_detect_if.v"]" "[file normalize "${rtl_dir}/cpu/except_detect_mem.v"]" "[file normalize "${rtl_dir}/cpu/exmem_reg.v"]" "[file normalize "${rtl_dir}/cpu/Ext_unit.v"]" "[file normalize "${rtl_dir}/cpu/final_target.v"]" "[file normalize "${rtl_dir}/cpu/FU.v"]" "[file normalize "${rtl_dir}/cpu/GPR.v"]" "[file normalize "${rtl_dir}/cpu/idex_reg.v"]" "[file normalize "${rtl_dir}/cpu/ifid_reg.v"]" "[file normalize "${rtl_dir}/cpu/interrupt_except_handle.v"]" "[file normalize "${rtl_dir}/cpu/is_delayslot.v"]" "[file normalize "${rtl_dir}/cpu/load_b_w_e_gen.v"]" "[file normalize "${rtl_dir}/cpu/load_shifter.v"]" "[file normalize "${rtl_dir}/cpu/memwb_reg.v"]" "[file normalize "${rtl_dir}/cpu/muldiv.v"]" "[file normalize "${rtl_dir}/cpu/MUX.v"]" "[file normalize "${rtl_dir}/cpu/pc.v"]" "[file normalize "${rtl_dir}/cpu/reg_w_gen.v"]" "[file normalize "${rtl_dir}/cpu/SHIFT.v"]" "[file normalize "${rtl_dir}/cpu/store_b_w_e_gen.v"]" "[file normalize "${rtl_dir}/cpu/store_shifter.v"]"


# IP Cores
file copy -force ${ip_dir} ${project_dir}
set ip_dir ${project_dir}/ip-core
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/div_gen_0/div_gen_0.xci"]"
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/mult_gen_0/mult_gen_0.xci"]"
