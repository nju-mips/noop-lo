# setting up the project
set script_dir [file dirname [info script]]
set rtl_dir    ${script_dir}/rtl
set fpga_dir   $env(NPC_HOME)
set lib_dir    ${fpga_dir}/lib
set bd_dir     ${script_dir}/bd
set constr_dir ${script_dir}/constr
set data_dir   ${script_dir}/data

# # lib src files
add_files -norecurse -fileset sources_1 "[file normalize "${lib_dir}/include/axi.vh"]"
set_property is_global_include true [get_files "[file normalize "${lib_dir}/include/axi.vh"]"]

# Add files for npc
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/core_top.v"]"
add_files -norecurse -fileset sources_1 "[file normalize "${rtl_dir}/npc_board.v"]"

# Block Designs
source ${bd_dir}/npc.tcl
save_bd_design
close_bd_design $design_name
set_property synth_checkpoint_mode Hierarchical [get_files *${design_name}.bd]
