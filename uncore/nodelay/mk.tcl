# setting parameters

if {[llength $argv] > 0} {
  set project_name [lindex $argv 0]
  set s [split $project_name -]
  set prj [lindex $s 0]
  set core [lindex $s 1]
  set uncore [lindex $s 2]
} else {
  puts "project full name is not given!"
  return 1
}

set device xc7a200tfbg676-2
set topmodule soc_lite_top
set topmodule_test tb_top

set project_dir $env(NOOP_HOME)/build/$project_name

create_project $project_name -force -dir $project_dir/ -part ${device}

source $env(NOOP_HOME)/core/$core/mk.tcl

# setting up the project
set script_dir  [file dirname [info script]]
set rtl_dir     ${script_dir}/rtl
set lib_dir     $env(NOOP_HOME)/lib
set bd_dir      ${script_dir}/bd
set constr_dir  ${script_dir}/constr
set data_dir    ${script_dir}/data
set ip_dir      ${script_dir}/ip-uncore
set sim_dir     ${script_dir}/sim

# lib src files

# src files
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/AMBA/sramlike_to_ahb.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/CONFREG/confreg.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/TOP/soc_lite_top.v"]"

# IP Cores
file copy -force ${ip_dir} ${project_dir}
set ip_dir ${project_dir}/ip-uncore
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/clk_pll/clk_pll.xci"]"
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/data_ram/data_ram.xci"]"
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/inst_ram/inst_ram.xci"]"
add_files -norecurse -fileset sources_1 "[file normalize "${ip_dir}/ahblite_axi_bridge_0/ahblite_axi_bridge_0.xci"]"

# Set COE file
set_property -dict "[list CONFIG.Load_Init_File {true} CONFIG.Coe_File [file normalize "${data_dir}/func_test/data_ram.coe"]]" [get_ips data_ram]
set_property -dict "[list CONFIG.Load_Init_File {true} CONFIG.Coe_File [file normalize "${data_dir}/func_test/inst_ram.coe"]]" [get_ips inst_ram]

# Board Designs

# sim files
add_files -norecurse -fileset sim_1 "[file normalize "${sim_dir}/tb_top.v"]"

# contraints files
add_files -norecurse -fileset constrs_1 "[file normalize "${constr_dir}/soc_lite.xdc"]"
set_property "file_type" "XDC" [get_files -of_objects [get_filesets constrs_1]]

# setting top module for FPGA flow and simulation flow
set_property "top" $topmodule [current_fileset]
set_property "top" $topmodule_test [get_filesets sim_1]

# setting Synthesis options
set_property strategy {Vivado Synthesis defaults} [get_runs synth_1]
# keep module port names in the netlist
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY {none} [get_runs synth_1]

# setting Implementation options
set_property steps.phys_opt_design.is_enabled true [get_runs impl_1]

# update compile order 
update_compile_order -fileset sources_1

# generate and export simulation target
#generate_target Simulation [get_files $project_dir/ip/blk_mem_gen_0/blk_mem_gen_0.xci]
#export_ip_user_files -of_objects [get_files $project_dir/ip/blk_mem_gen_0/blk_mem_gen_0.xci] -no_script -force -quiet

# TODO: how to export simulation target for core???
#generate_target Simulation [get_files $project_dir/$project_name.srcs/sources_1/bd/noop/noop.bd]
#export_ip_user_files -of_objects [get_files $project_dir/$project_name.srcs/sources_1/bd/noop/noop.bd] -no_script -force -quiet

#generate_target Simulation [get_files $project_dir/$project_name.srcs/sources_1/bd/uncore/uncore.bd]
#export_ip_user_files -of_objects [get_files $project_dir/$project_name.srcs/sources_1/bd/uncore/uncore.bd] -no_script -force -quiet

# export simulation
#export_simulation -force  -directory ${sim_dir} -simulator xsim  -ip_user_files_dir $project_dir/$project_name.ip_user_files -ipstatic_source_dir $project_dir/$project_name.ip_user_files/ipstatic

