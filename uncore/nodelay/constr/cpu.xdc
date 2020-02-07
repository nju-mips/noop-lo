set period 33.00
create_clock -period $period -name aclk [get_ports aclk]
set_input_delay -clock aclk [expr 0.4*$period] [all_inputs]
set_output_delay -clock aclk [expr 0.4*$period] [all_outputs]
