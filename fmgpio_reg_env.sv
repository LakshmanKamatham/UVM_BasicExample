`include "fmgpio_reg_agent.sv"

class fmgpio_reg_env extends uvm_env;

`uvm_component_utils(fmgpio_reg_env)

fmgpio_reg_agent agent_h;

extern function new(string name = "fmgpio_reg_env", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass

function fmgpio_reg_env::new(string name = "fmgpio_reg_env", uvm_component parent);
super.new(name,parent);
endfunction

function void fmgpio_reg_env::build_phase(uvm_phase phase);
super.build_phase(phase);
agent_h = fmgpio_reg_agent::type_id::create("agent_h", this);
endfunction

function void fmgpio_reg_env::connect_phase(uvm_phase phase);
super.connect_phase(phase);
endfunction