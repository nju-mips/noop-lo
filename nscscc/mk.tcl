cd $env(SOC_DIR)
open_project $env(SOC_XPR)
reset_run synth_1
reset_run impl_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
