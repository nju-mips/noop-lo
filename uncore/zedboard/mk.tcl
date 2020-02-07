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

set device xc7z020-1-clg484
set board em.avnet.com:zed:part0:1.3
set topmodule fpga_top
set topmodule_test test_top

set fpga_dir $env(NPC_HOME)
set project_dir ${fpga_dir}/output/$project_name

create_project $project_name -force -dir $project_dir/ -part ${device}
set_property board_part $board [current_project] 

source ${fpga_dir}/core/$core/mk.tcl

# setting up the project
set script_dir  [file dirname [info script]]
set rtl_dir     ${script_dir}/rtl
set lib_dir     ${fpga_dir}/lib
set bd_dir      ${script_dir}/bd
set constr_dir  ${script_dir}/constr
set data_dir    ${script_dir}/data
set ip_dir      ${script_dir}/ip
set sim_dir     ${fpga_dir}/sim

# lib src files
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/util/axilite_naive_bridge.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/vga/axi_vga.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/vga/vga_controller.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/vga/vga_dis.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/vga/vmem.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/include/axi.vh"]"
set_property is_global_include true [get_files "[file normalize "${lib_dir}/include/axi.vh"]"]

# src files
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/noop_soc.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/fpga_top.v"]"

# Board Designs
source ${bd_dir}/zynq_soc.tcl
save_bd_design
close_bd_design $design_name
set_property synth_checkpoint_mode Hierarchical [get_files *${design_name}.bd]

source ${bd_dir}/uncore.tcl
save_bd_design
close_bd_design $design_name
set_property synth_checkpoint_mode Hierarchical [get_files *${design_name}.bd]

# sim files
add_files -norecurse -fileset sim_1 "[file normalize "${lib_dir}/uart/uart_recv_sim.v"]"
add_files -norecurse -fileset sim_1 "[file normalize "${lib_dir}/sim_ram/axi_ram.v"]"
add_files -norecurse -fileset sim_1 "[file normalize "${rtl_dir}/sim.v"]"

# contraints files
add_files -norecurse -fileset constrs_1 "[file normalize "${constr_dir}/vga.xdc"]"
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
generate_target Simulation [get_files $project_dir/$project_name.srcs/sources_1/bd/uncore/uncore.bd]
export_ip_user_files -of_objects [get_files $project_dir/$project_name.srcs/sources_1/bd/uncore/uncore.bd] -no_script -force -quiet

generate_target Simulation [get_files $project_dir/$project_name.srcs/sources_1/bd/noop/noop.bd]
export_ip_user_files -of_objects [get_files $project_dir/$project_name.srcs/sources_1/bd/noop/noop.bd] -no_script -force -quiet

# export simulation
export_simulation -force  -directory ${sim_dir} -simulator xsim  -ip_user_files_dir $project_dir/$project_name.ip_user_files -ipstatic_source_dir $project_dir/$project_name.ip_user_files/ipstatic
