class fmgpio_reg_monitor extends uvm_monitor;

`uvm_component_utils(fmgpio_reg_monitor);

virtual mem_if vif;

//uvm_analysis_port #(fmgpio_reg_seq_item) item_collected_port;

extern function new (string name = "fmgpio_reg_monitor", uvm_component parent);
extern function void build_phase (uvm_phase phase);
//extern function void connect_phase (uvm_phase phase);
//extern virtual task run_phase (uvm_phase phase);

endclass

function fmgpio_reg_monitor::new(string name = "fmgpio_reg_monitor", uvm_component parent);
super.new(name, parent);

endfunction

function void fmgpio_reg_monitor::build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual mem_if)::get(this, "", "mem_if", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});

endfunction
