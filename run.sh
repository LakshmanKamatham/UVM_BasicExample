#! /bin/sh
bsub -Ip vcs -V -full64 -sverilog -lca -ntb_opts uvm -debug_all  -timescale=1ps/1ps +vcs+lic+wait \
             -F /nfs/site/disks/fm8_ciodv_1/users/lbkamatx/UVM_IOREG/p4/avatar/fmgpio_reg/tb/UVM/bench.f \
             -l compile.log \
             -R
