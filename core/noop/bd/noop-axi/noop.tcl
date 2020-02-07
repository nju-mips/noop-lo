
################################################################
# This is a generated script based on design: noop
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
set scripts_vivado_version 2017.1
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
# source noop_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# alu, bru, cp0, dcache_controller, icache_controller, idu, ifpcu, ifu, isu, lspcu, lsu, mdu, performance_counter, wbu

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
set design_name noop

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

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

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
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.PROTOCOL {AXI4LITE} \
 ] $M_AXI_DEVICE
  set M_AXI_MEM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MEM ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {32} \
CONFIG.DATA_WIDTH {64} \
CONFIG.FREQ_HZ {50000000} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.PROTOCOL {AXI4} \
 ] $M_AXI_MEM

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_RESET {reset} \
CONFIG.FREQ_HZ {50000000} \
 ] $clk
  set interrupt [ create_bd_port -dir I -from 7 -to 0 -type intr interrupt ]
  set_property -dict [ list \
CONFIG.PortWidth {8} \
 ] $interrupt
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset

  # Create instance: alu_0, and set properties
  set block_name alu
  set block_cell_name alu_0
  if { [catch {set alu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $alu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /alu_0/M_ALU_ISU_forward]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {14} \
 ] [get_bd_intf_pins /alu_0/M_ALU_WBU_res]

  # Create instance: axi_crossbar_0, and set properties
  set axi_crossbar_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_crossbar:2.1 axi_crossbar_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {3} \
 ] $axi_crossbar_0

  # Create instance: axi_crossbar_1, and set properties
  set axi_crossbar_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_crossbar:2.1 axi_crossbar_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_crossbar_1

  # Create instance: bru_0, and set properties
  set block_name bru
  set block_cell_name bru_0
  if { [catch {set bru_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bru_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /bru_0/M_BRU_ISU_forward]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {17} \
 ] [get_bd_intf_pins /bru_0/M_BRU_WBU_res]

  # Create instance: cp0_0, and set properties
  set block_name cp0
  set block_cell_name cp0_0
  if { [catch {set cp0_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $cp0_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {4} \
 ] [get_bd_intf_pins /cp0_0/M_CP0_ISU_rdata]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /cp0_0/M_CP0_WBU_exception]

  # Create instance: dcache_controller_0, and set properties
  set block_name dcache_controller
  set block_cell_name dcache_controller_0
  if { [catch {set dcache_controller_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dcache_controller_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: div_gen_0, and set properties
  set div_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 div_gen_0 ]
  set_property -dict [ list \
CONFIG.FlowControl {Blocking} \
CONFIG.OutTready {true} \
CONFIG.algorithm_type {Radix2} \
CONFIG.clocks_per_division {8} \
CONFIG.dividend_and_quotient_width {40} \
CONFIG.divisor_width {40} \
CONFIG.fractional_width {40} \
CONFIG.latency {48} \
CONFIG.operand_sign {Signed} \
CONFIG.remainder_type {Remainder} \
 ] $div_gen_0

  # Create instance: icache_controller_0, and set properties
  set block_name icache_controller
  set block_cell_name icache_controller_0
  if { [catch {set icache_controller_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $icache_controller_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: idu_0, and set properties
  set block_name idu
  set block_cell_name idu_0
  if { [catch {set idu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $idu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {17} \
 ] [get_bd_intf_pins /idu_0/M_IDU_ISU_decode]

  # Create instance: ifpcu_0, and set properties
  set block_name ifpcu
  set block_cell_name ifpcu_0
  if { [catch {set ifpcu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ifpcu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {4} \
 ] [get_bd_intf_pins /ifpcu_0/M_IFPCU_IFU_response]

  set_property -dict [ list \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /ifpcu_0/m_axi_instr]

  # Create instance: ifu_0, and set properties
  set block_name ifu
  set block_cell_name ifu_0
  if { [catch {set ifu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ifu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {12} \
 ] [get_bd_intf_pins /ifu_0/M_IFU_IDU_instr]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {4} \
 ] [get_bd_intf_pins /ifu_0/M_IFU_IFPCU_request]

  # Create instance: isu_0, and set properties
  set block_name isu
  set block_cell_name isu_0
  if { [catch {set isu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $isu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {18} \
 ] [get_bd_intf_pins /isu_0/M_ISU_ALU_datain]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {21} \
 ] [get_bd_intf_pins /isu_0/M_ISU_BRU_datain]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {7} \
 ] [get_bd_intf_pins /isu_0/M_ISU_CP0_rw]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {22} \
 ] [get_bd_intf_pins /isu_0/M_ISU_LSU_datain]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {18} \
 ] [get_bd_intf_pins /isu_0/M_ISU_MDU_datain]

  # Create instance: lspcu_0, and set properties
  set block_name lspcu
  set block_cell_name lspcu_0
  if { [catch {set lspcu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lspcu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {4} \
 ] [get_bd_intf_pins /lspcu_0/M_LSPCU_LSU_rdata]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {1} \
 ] [get_bd_intf_pins /lspcu_0/M_LSPCU_LSU_wdata]

  set_property -dict [ list \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /lspcu_0/m_axi_data]

  # Create instance: lsu_0, and set properties
  set block_name lsu
  set block_cell_name lsu_0
  if { [catch {set lsu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lsu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /lsu_0/M_LSU_ISU_forward]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {4} \
 ] [get_bd_intf_pins /lsu_0/M_LSU_LSPCU_rdata]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {9} \
 ] [get_bd_intf_pins /lsu_0/M_LSU_LSPCU_wdata]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {18} \
 ] [get_bd_intf_pins /lsu_0/M_LSU_WBU_res]

  # Create instance: mdu_0, and set properties
  set block_name mdu
  set block_cell_name mdu_0
  if { [catch {set mdu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mdu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /mdu_0/M_MDU_DIV_dividend]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /mdu_0/M_MDU_DIV_divisor]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /mdu_0/M_MDU_ISU_forward]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {8} \
 ] [get_bd_intf_pins /mdu_0/M_MDU_WBU_hilo]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {13} \
 ] [get_bd_intf_pins /mdu_0/M_MDU_WBU_res]

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {65} \
CONFIG.PipeStages {6} \
CONFIG.PortAType {Signed} \
CONFIG.PortAWidth {33} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {33} \
 ] $mult_gen_0

  # Create instance: performance_counter_0, and set properties
  set block_name performance_counter
  set block_cell_name performance_counter_0
  if { [catch {set performance_counter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $performance_counter_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: wbu_0, and set properties
  set block_name wbu
  set block_cell_name wbu_0
  if { [catch {set wbu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $wbu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {13} \
 ] [get_bd_intf_pins /wbu_0/M_WBU_CP0_exception]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {5} \
 ] [get_bd_intf_pins /wbu_0/M_WBU_IFU_branch]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {8} \
 ] [get_bd_intf_pins /wbu_0/M_WBU_ISU_hilo]

  set_property -dict [ list \
CONFIG.TDATA_NUM_BYTES {6} \
 ] [get_bd_intf_pins /wbu_0/M_WBU_ISU_wb]

  # Create interface connections
  connect_bd_intf_net -intf_net alu_0_M_ALU_ISU_forward [get_bd_intf_pins alu_0/M_ALU_ISU_forward] [get_bd_intf_pins isu_0/S_ALU_ISU_forward]
  connect_bd_intf_net -intf_net alu_0_M_AXIS_ALU_WBU_res [get_bd_intf_pins alu_0/M_ALU_WBU_res] [get_bd_intf_pins wbu_0/S_ALU_WBU_res]
  connect_bd_intf_net -intf_net axi_crossbar_0_M00_AXI [get_bd_intf_pins axi_crossbar_0/M00_AXI] [get_bd_intf_pins dcache_controller_0/s_axi_data]
  connect_bd_intf_net -intf_net axi_crossbar_0_M01_AXI [get_bd_intf_pins axi_crossbar_0/M01_AXI] [get_bd_intf_pins performance_counter_0/s_axi_counter]
  connect_bd_intf_net -intf_net axi_crossbar_0_M02_AXI [get_bd_intf_ports M_AXI_DEVICE] [get_bd_intf_pins axi_crossbar_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_crossbar_1_M00_AXI [get_bd_intf_ports M_AXI_MEM] [get_bd_intf_pins axi_crossbar_1/M00_AXI]
  connect_bd_intf_net -intf_net bru_0_M_BRU_ISU_forward [get_bd_intf_pins bru_0/M_BRU_ISU_forward] [get_bd_intf_pins isu_0/S_BRU_ISU_forward]
  connect_bd_intf_net -intf_net bru_0_M_BRU_WBU_res [get_bd_intf_pins bru_0/M_BRU_WBU_res] [get_bd_intf_pins wbu_0/S_BRU_WBU_res]
  connect_bd_intf_net -intf_net cp0_0_M_CP0_ISU_rdata [get_bd_intf_pins cp0_0/M_CP0_ISU_rdata] [get_bd_intf_pins isu_0/S_CP0_ISU_rdata]
  connect_bd_intf_net -intf_net cp0_0_M_CP0_WBU_exception [get_bd_intf_pins cp0_0/M_CP0_WBU_exception] [get_bd_intf_pins wbu_0/S_CP0_WBU_exception]
  connect_bd_intf_net -intf_net dcache_controller_0_m_axi_ram [get_bd_intf_pins axi_crossbar_1/S01_AXI] [get_bd_intf_pins dcache_controller_0/m_axi_ram]
  connect_bd_intf_net -intf_net div_gen_0_M_AXIS_DOUT [get_bd_intf_pins div_gen_0/M_AXIS_DOUT] [get_bd_intf_pins mdu_0/S_DIV_MDU_res]
  connect_bd_intf_net -intf_net icache_controller_0_m_axi_ram [get_bd_intf_pins axi_crossbar_1/S00_AXI] [get_bd_intf_pins icache_controller_0/m_axi_ram]
  connect_bd_intf_net -intf_net idu_0_M_IDU_ISU_decode [get_bd_intf_pins idu_0/M_IDU_ISU_decode] [get_bd_intf_pins isu_0/S_IDU_ISU_decode]
  connect_bd_intf_net -intf_net ifpcu_0_M_IFPCU_IFU_response [get_bd_intf_pins ifpcu_0/M_IFPCU_IFU_response] [get_bd_intf_pins ifu_0/S_IFPCU_IFU_response]
  connect_bd_intf_net -intf_net ifu_0_M_AXI_INSTR [get_bd_intf_pins icache_controller_0/s_axi_instr] [get_bd_intf_pins ifpcu_0/m_axi_instr]
  connect_bd_intf_net -intf_net ifu_0_M_IFU_IDU_instr [get_bd_intf_pins idu_0/S_IFU_IDU_instr] [get_bd_intf_pins ifu_0/M_IFU_IDU_instr]
  connect_bd_intf_net -intf_net ifu_0_M_IFU_IFPCU_request [get_bd_intf_pins ifpcu_0/S_IFU_IFPCU_request] [get_bd_intf_pins ifu_0/M_IFU_IFPCU_request]
  connect_bd_intf_net -intf_net isu_0_M_ISU_ALU_datain [get_bd_intf_pins alu_0/S_ISU_ALU_datain] [get_bd_intf_pins isu_0/M_ISU_ALU_datain]
  connect_bd_intf_net -intf_net isu_0_M_ISU_BRU_datain [get_bd_intf_pins bru_0/S_ISU_BRU_datain] [get_bd_intf_pins isu_0/M_ISU_BRU_datain]
  connect_bd_intf_net -intf_net isu_0_M_ISU_CP0_rw [get_bd_intf_pins cp0_0/S_ISU_CP0_rw] [get_bd_intf_pins isu_0/M_ISU_CP0_rw]
  connect_bd_intf_net -intf_net isu_0_M_ISU_LSU_datain [get_bd_intf_pins isu_0/M_ISU_LSU_datain] [get_bd_intf_pins lsu_0/S_ISU_LSU_datain]
  connect_bd_intf_net -intf_net isu_0_M_ISU_MDU_datain [get_bd_intf_pins isu_0/M_ISU_MDU_datain] [get_bd_intf_pins mdu_0/S_ISU_MDU_datain]
  connect_bd_intf_net -intf_net lspcu_0_M_LSPCU_LSU_rdata [get_bd_intf_pins lspcu_0/M_LSPCU_LSU_rdata] [get_bd_intf_pins lsu_0/S_LSPCU_LSU_rdata]
  connect_bd_intf_net -intf_net lspcu_0_M_LSPCU_LSU_wdata [get_bd_intf_pins lspcu_0/M_LSPCU_LSU_wdata] [get_bd_intf_pins lsu_0/S_LSPCU_LSU_wdata]
  connect_bd_intf_net -intf_net lsu_0_M_AXIS_LSU_WBU_res [get_bd_intf_pins lsu_0/M_LSU_WBU_res] [get_bd_intf_pins wbu_0/S_LSU_WBU_res]
  connect_bd_intf_net -intf_net lsu_0_M_AXI_DATA [get_bd_intf_pins axi_crossbar_0/S00_AXI] [get_bd_intf_pins lspcu_0/m_axi_data]
  connect_bd_intf_net -intf_net lsu_0_M_LSU_ISU_forward [get_bd_intf_pins isu_0/S_LSU_ISU_forward] [get_bd_intf_pins lsu_0/M_LSU_ISU_forward]
  connect_bd_intf_net -intf_net lsu_0_M_LSU_LSPCU_rdata [get_bd_intf_pins lspcu_0/S_LSU_LSPCU_rdata] [get_bd_intf_pins lsu_0/M_LSU_LSPCU_rdata]
  connect_bd_intf_net -intf_net lsu_0_M_LSU_LSPCU_wdata [get_bd_intf_pins lspcu_0/S_LSU_LSPCU_wdata] [get_bd_intf_pins lsu_0/M_LSU_LSPCU_wdata]
  connect_bd_intf_net -intf_net mdu_0_M_AXIS_MDU_WBU_res [get_bd_intf_pins mdu_0/M_MDU_WBU_res] [get_bd_intf_pins wbu_0/S_MDU_WBU_res]
  connect_bd_intf_net -intf_net mdu_0_M_MDU_DIV_dividend [get_bd_intf_pins div_gen_0/S_AXIS_DIVIDEND] [get_bd_intf_pins mdu_0/M_MDU_DIV_dividend]
  connect_bd_intf_net -intf_net mdu_0_M_MDU_DIV_divisor [get_bd_intf_pins div_gen_0/S_AXIS_DIVISOR] [get_bd_intf_pins mdu_0/M_MDU_DIV_divisor]
  connect_bd_intf_net -intf_net mdu_0_M_MDU_ISU_forward [get_bd_intf_pins isu_0/S_MDU_ISU_forward] [get_bd_intf_pins mdu_0/M_MDU_ISU_forward]
  connect_bd_intf_net -intf_net mdu_0_M_MDU_WBU_hilo [get_bd_intf_pins mdu_0/M_MDU_WBU_hilo] [get_bd_intf_pins wbu_0/S_MDU_WBU_hilo]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_ALU_flush [get_bd_intf_pins alu_0/S_WBU_ALU_flush] [get_bd_intf_pins wbu_0/M_WBU_ALU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_BRU_flush [get_bd_intf_pins bru_0/S_WBU_BRU_flush] [get_bd_intf_pins wbu_0/M_WBU_BRU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_CP0_exception [get_bd_intf_pins cp0_0/S_WBU_CP0_exception] [get_bd_intf_pins wbu_0/M_WBU_CP0_exception]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_IDU_flush [get_bd_intf_pins idu_0/S_WBU_IDU_flush] [get_bd_intf_pins wbu_0/M_WBU_IDU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_IFU_branch [get_bd_intf_pins ifu_0/S_WBU_IFU_branch] [get_bd_intf_pins wbu_0/M_WBU_IFU_branch]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_IFU_flush [get_bd_intf_pins ifu_0/S_WBU_IFU_flush] [get_bd_intf_pins wbu_0/M_WBU_IFU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_ISU_flush [get_bd_intf_pins isu_0/S_WBU_ISU_flush] [get_bd_intf_pins wbu_0/M_WBU_ISU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_ISU_hilo [get_bd_intf_pins isu_0/S_WBU_ISU_hilo] [get_bd_intf_pins wbu_0/M_WBU_ISU_hilo]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_ISU_wb [get_bd_intf_pins isu_0/S_WBU_ISU_wb] [get_bd_intf_pins wbu_0/M_WBU_ISU_wb]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_LSU_flush [get_bd_intf_pins lsu_0/S_WBU_LSU_flush] [get_bd_intf_pins wbu_0/M_WBU_LSU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_MDU_flush [get_bd_intf_pins mdu_0/S_WBU_MDU_flush] [get_bd_intf_pins wbu_0/M_WBU_MDU_flush]
  connect_bd_intf_net -intf_net wbu_0_M_WBU_WBU_flush1 [get_bd_intf_pins wbu_0/M_WBU_WBU_flush] [get_bd_intf_pins wbu_0/S_WBU_WBU_flush]

  # Create port connections
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins alu_0/clk] [get_bd_pins axi_crossbar_0/aclk] [get_bd_pins axi_crossbar_1/aclk] [get_bd_pins bru_0/clk] [get_bd_pins cp0_0/clk] [get_bd_pins dcache_controller_0/clk] [get_bd_pins div_gen_0/aclk] [get_bd_pins icache_controller_0/clk] [get_bd_pins idu_0/clk] [get_bd_pins ifpcu_0/clk] [get_bd_pins ifu_0/clk] [get_bd_pins isu_0/clk] [get_bd_pins lspcu_0/clk] [get_bd_pins lsu_0/clk] [get_bd_pins mdu_0/clk] [get_bd_pins mult_gen_0/CLK] [get_bd_pins performance_counter_0/clk] [get_bd_pins wbu_0/clk]
  connect_bd_net -net dcache_controller_0_r_access [get_bd_pins dcache_controller_0/r_access] [get_bd_pins performance_counter_0/dcache_r_access]
  connect_bd_net -net dcache_controller_0_r_miss [get_bd_pins dcache_controller_0/r_miss] [get_bd_pins performance_counter_0/dcache_r_miss]
  connect_bd_net -net dcache_controller_0_r_miss_cycles [get_bd_pins dcache_controller_0/r_miss_cycles] [get_bd_pins performance_counter_0/dcache_r_miss_cycles]
  connect_bd_net -net dcache_controller_0_w_access [get_bd_pins dcache_controller_0/w_access] [get_bd_pins performance_counter_0/dcache_w_access]
  connect_bd_net -net dcache_controller_0_w_miss [get_bd_pins dcache_controller_0/w_miss] [get_bd_pins performance_counter_0/dcache_w_miss]
  connect_bd_net -net icache_controller_0_i_access [get_bd_pins icache_controller_0/i_access] [get_bd_pins performance_counter_0/icache_access]
  connect_bd_net -net icache_controller_0_i_miss [get_bd_pins icache_controller_0/i_miss] [get_bd_pins performance_counter_0/icache_miss]
  connect_bd_net -net interrupt_1 [get_bd_ports interrupt] [get_bd_pins cp0_0/interrupt]
  connect_bd_net -net lsu_0_load [get_bd_pins lsu_0/load] [get_bd_pins performance_counter_0/load]
  connect_bd_net -net lsu_0_load_cycles [get_bd_pins lsu_0/load_cycles] [get_bd_pins performance_counter_0/load_cycles]
  connect_bd_net -net lsu_0_store [get_bd_pins lsu_0/store] [get_bd_pins performance_counter_0/store]
  connect_bd_net -net lsu_0_store_cycles [get_bd_pins lsu_0/store_cycles] [get_bd_pins performance_counter_0/store_cycles]
  connect_bd_net -net mdu_0_div [get_bd_pins mdu_0/div] [get_bd_pins performance_counter_0/div]
  connect_bd_net -net mdu_0_ext_a [get_bd_pins mdu_0/ext_a] [get_bd_pins mult_gen_0/A]
  connect_bd_net -net mdu_0_ext_b [get_bd_pins mdu_0/ext_b] [get_bd_pins mult_gen_0/B]
  connect_bd_net -net mdu_0_mul [get_bd_pins mdu_0/mul] [get_bd_pins performance_counter_0/mul]
  connect_bd_net -net mult_gen_0_P [get_bd_pins mdu_0/mult_result] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins alu_0/rst] [get_bd_pins bru_0/rst] [get_bd_pins cp0_0/rst] [get_bd_pins dcache_controller_0/rst] [get_bd_pins icache_controller_0/rst] [get_bd_pins idu_0/rst] [get_bd_pins ifpcu_0/rst] [get_bd_pins ifu_0/rst] [get_bd_pins isu_0/rst] [get_bd_pins lspcu_0/rst] [get_bd_pins lsu_0/rst] [get_bd_pins mdu_0/rst] [get_bd_pins performance_counter_0/rst] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins wbu_0/rst]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins axi_crossbar_0/aresetn] [get_bd_pins axi_crossbar_1/aresetn] [get_bd_pins util_vector_logic_0/Res]

  # Create address segments
  create_bd_addr_seg -range 0x10000000 -offset 0x10000000 [get_bd_addr_spaces dcache_controller_0/m_axi_ram] [get_bd_addr_segs M_AXI_MEM/Reg] SEG_M_AXI_MEM_Reg
  create_bd_addr_seg -range 0x10000000 -offset 0x10000000 [get_bd_addr_spaces icache_controller_0/m_axi_ram] [get_bd_addr_segs M_AXI_MEM/Reg] SEG_M_AXI_MEM_Reg
  create_bd_addr_seg -range 0x10000000 -offset 0x10000000 [get_bd_addr_spaces ifpcu_0/m_axi_instr] [get_bd_addr_segs icache_controller_0/s_axi_instr/reg0] SEG_icache_controller_0_reg0
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces lspcu_0/m_axi_data] [get_bd_addr_segs M_AXI_DEVICE/Reg] SEG_M_AXI_DEVICE_Reg
  create_bd_addr_seg -range 0x10000000 -offset 0x10000000 [get_bd_addr_spaces lspcu_0/m_axi_data] [get_bd_addr_segs dcache_controller_0/s_axi_data/reg0] SEG_dcache_controller_0_reg0
  create_bd_addr_seg -range 0x00001000 -offset 0xC0000000 [get_bd_addr_spaces lspcu_0/m_axi_data] [get_bd_addr_segs performance_counter_0/s_axi_counter/reg0] SEG_performance_counter_0_reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

