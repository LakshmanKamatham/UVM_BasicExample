// This is an example of a modular testbench
//`timescale 1ps/1ps

`define WR_PERIOD 2000
`define RD_PERIOD 1600

`define TESTBENCH   fmgpio_reg_tb_uvm
`define IMG_OBJECT  myCsrLoader
`define CSR_IMG_PATH    `TESTBENCH.`IMG_OBJECT
`define RTL_PATH dut.xio_ioereg_top

`define global_cram_load_signal `TESTBENCH.global_cram_load_signal
`define global_cram_dump_signal `TESTBENCH.global_cram_dump_signal
//`include "include_sva.sv"
`include "fmio12pnr_ioereg_top_test_params.svh"
`include "mem_interface.sv"

module `TESTBENCH; 

parameter FIFO_ADDR_WIDTH = 3;

//`include "defparams.vh"
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "gpio_test.svh"

logic clock;
//---------------------------------------
  //interface instance
  //---------------------------------------
  mem_if intf(clock);

dut    dut1 ( .clock(clock),
                .addr(intf.addr),
                .data(intf.data),
                .cmd(intf.cmd));

 // Clock generator
  initial
  begin
    clock = 0;
    forever #5 clock = ~clock;
  end

 //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","mem_if",intf);
    run_test();
  end
  
endmodule