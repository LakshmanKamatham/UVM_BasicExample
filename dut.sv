module dut(clock, addr, data, cmd);

  import uvm_pkg::*;

input clock;
input [7:0] addr,data;
input cmd;

  always @(clock)
  begin
    `uvm_info("", $sformatf("DUT received cmd=%b, addr=%d, data=%d",
                           cmd, addr, data), UVM_MEDIUM)
    `uvm_info("", "Data reached to DUT", UVM_MEDIUM)
  end
  
endmodule