
################################################################
# This is a generated script based on design: npc
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source npc_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# FPGATop

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name npc

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_dwidth_converter:2.1\
xilinx.com:ip:axi_protocol_converter:2.1\
xilinx.com:ip:div_gen:5.1\
xilinx.com:ip:mult_gen:12.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:util_vector_logic:2.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
FPGATop\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M_AXI_DEVICE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DEVICE ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $M_AXI_DEVICE
  set M_AXI_MEM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MEM ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.PROTOCOL {AXI4} \
   ] $M_AXI_MEM

  # Create ports
  set coreclk [ create_bd_port -dir I -type clk coreclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_RESET {reset:uncore_aresetn} \
   CONFIG.CLK_DOMAIN {npc_uncoreclk} \
   CONFIG.FREQ_HZ {50000000} \
 ] $coreclk
  set dcm_locked [ create_bd_port -dir I dcm_locked ]
  set interrupt [ create_bd_port -dir I -from 7 -to 0 -type intr interrupt ]
  set_property -dict [ list \
   CONFIG.PortWidth {8} \
 ] $interrupt
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set uncore_aresetn [ create_bd_port -dir I -type rst uncore_aresetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $uncore_aresetn
  set uncoreclk [ create_bd_port -dir I -type clk uncoreclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M_AXI_MEM:M_AXI_DEVICE} \
   CONFIG.ASSOCIATED_RESET {uncore_aresetn} \
   CONFIG.FREQ_HZ {50000000} \
 ] $uncoreclk

  # Create instance: FPGATop_0, and set properties
  set block_name FPGATop
  set block_cell_name FPGATop_0
  if { [catch {set FPGATop_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $FPGATop_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.MAX_BURST_LENGTH {256} \
 ] [get_bd_intf_pins /FPGATop_0/io_mem]

  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.MAX_BURST_LENGTH {256} \
 ] [get_bd_intf_pins /FPGATop_0/io_mmio]

  # Create instance: axi_dwidth_converter_0, and set properties
  set axi_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 axi_dwidth_converter_0 ]

  # Create instance: axi_dwidth_converter_1, and set properties
  set axi_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 axi_dwidth_converter_1 ]

  # Create instance: axi_protocol_converter_0, and set properties
  set axi_protocol_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_converter_0 ]

  # Create instance: div_gen_0, and set properties
  set div_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 div_gen_0 ]
  set_property -dict [ list \
   CONFIG.ARESETN {true} \
   CONFIG.FlowControl {Blocking} \
   CONFIG.OptimizeGoal {Resources} \
   CONFIG.OutTLASTBehv {Null} \
   CONFIG.OutTready {false} \
   CONFIG.algorithm_type {Radix2} \
   CONFIG.clocks_per_division {8} \
   CONFIG.divide_by_zero_detect {false} \
   CONFIG.dividend_and_quotient_width {40} \
   CONFIG.divisor_has_tlast {false} \
   CONFIG.divisor_width {40} \
   CONFIG.fractional_width {40} \
   CONFIG.latency {46} \
   CONFIG.latency_configuration {Automatic} \
   CONFIG.remainder_type {Remainder} \
 ] $div_gen_0

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
   CONFIG.Multiplier_Construction {Use_Mults} \
   CONFIG.OptGoal {Area} \
   CONFIG.OutputWidthHigh {65} \
   CONFIG.PipeStages {7} \
   CONFIG.PortAType {Signed} \
   CONFIG.PortAWidth {33} \
   CONFIG.PortBWidth {33} \
 ] $mult_gen_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create interface connections
  connect_bd_intf_net -intf_net FPGATop_0_io_dmem [get_bd_intf_pins FPGATop_0/io_mem] [get_bd_intf_pins axi_dwidth_converter_1/S_AXI]
  connect_bd_intf_net -intf_net FPGATop_0_io_mmio [get_bd_intf_pins FPGATop_0/io_mmio] [get_bd_intf_pins axi_dwidth_converter_0/S_AXI]
  connect_bd_intf_net -intf_net axi_dwidth_converter_0_M_AXI [get_bd_intf_pins axi_dwidth_converter_0/M_AXI] [get_bd_intf_pins axi_protocol_converter_0/S_AXI]
  connect_bd_intf_net -intf_net axi_dwidth_converter_1_M_AXI [get_bd_intf_ports M_AXI_MEM] [get_bd_intf_pins axi_dwidth_converter_1/M_AXI]
  connect_bd_intf_net -intf_net axi_protocol_converter_0_M_AXI [get_bd_intf_ports M_AXI_DEVICE] [get_bd_intf_pins axi_protocol_converter_0/M_AXI]

  # Create port connections
  connect_bd_net -net FPGATop_0_io_div_diviend_bits [get_bd_pins FPGATop_0/io_div_diviend_bits] [get_bd_pins div_gen_0/s_axis_dividend_tdata]
  connect_bd_net -net FPGATop_0_io_div_diviend_valid [get_bd_pins FPGATop_0/io_div_diviend_valid] [get_bd_pins div_gen_0/s_axis_dividend_tvalid]
  connect_bd_net -net FPGATop_0_io_div_divisor_bits [get_bd_pins FPGATop_0/io_div_divisor_bits] [get_bd_pins div_gen_0/s_axis_divisor_tdata]
  connect_bd_net -net FPGATop_0_io_div_divisor_valid [get_bd_pins FPGATop_0/io_div_divisor_valid] [get_bd_pins div_gen_0/s_axis_divisor_tvalid]
  connect_bd_net -net FPGATop_0_io_mul_a [get_bd_pins FPGATop_0/io_mul_a] [get_bd_pins mult_gen_0/A]
  connect_bd_net -net FPGATop_0_io_mul_b [get_bd_pins FPGATop_0/io_mul_b] [get_bd_pins mult_gen_0/B]
  connect_bd_net -net dcm_locked_1 [get_bd_ports dcm_locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net div_gen_0_m_axis_dout_tdata [get_bd_pins FPGATop_0/io_div_dout_bits] [get_bd_pins div_gen_0/m_axis_dout_tdata]
  connect_bd_net -net div_gen_0_m_axis_dout_tvalid [get_bd_pins FPGATop_0/io_div_dout_valid] [get_bd_pins div_gen_0/m_axis_dout_tvalid]
  connect_bd_net -net div_gen_0_s_axis_dividend_tready [get_bd_pins FPGATop_0/io_div_diviend_ready] [get_bd_pins div_gen_0/s_axis_dividend_tready]
  connect_bd_net -net div_gen_0_s_axis_divisor_tready [get_bd_pins FPGATop_0/io_div_divisor_ready] [get_bd_pins div_gen_0/s_axis_divisor_tready]
  connect_bd_net -net mult_gen_0_P [get_bd_pins FPGATop_0/io_mul_dout] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_ports uncore_aresetn] [get_bd_pins axi_dwidth_converter_0/s_axi_aresetn] [get_bd_pins axi_dwidth_converter_1/s_axi_aresetn] [get_bd_pins axi_protocol_converter_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn1 [get_bd_pins div_gen_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins FPGATop_0/reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net uncoreclk_1 [get_bd_ports coreclk] [get_bd_pins FPGATop_0/clock] [get_bd_pins axi_dwidth_converter_0/s_axi_aclk] [get_bd_pins axi_dwidth_converter_1/s_axi_aclk] [get_bd_pins axi_protocol_converter_0/aclk] [get_bd_pins div_gen_0/aclk] [get_bd_pins mult_gen_0/CLK] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins util_vector_logic_0/Res]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces FPGATop_0/io_mmio] [get_bd_addr_segs M_AXI_DEVICE/Reg] SEG_M_AXILITE_MMIO_Reg
  create_bd_addr_seg -range 0x08000000 -offset 0x10000000 [get_bd_addr_spaces FPGATop_0/io_mem] [get_bd_addr_segs M_AXI_MEM/Reg] SEG_M_AXI_MEM_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


