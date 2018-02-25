//`include "fmgpio_reg_seq_item.sv"
`include "fmgpio_reg_seqr.sv"
`include "fmgpio_reg_driver.sv"
`include "fmgpio_reg_monitor.sv"

class fmgpio_reg_agent extends uvm_agent;

`uvm_component_utils(fmgpio_reg_agent)

fmgpio_reg_driver driver_h;
fmgpio_reg_monitor monitor_h;
fmgpio_reg_seqr seqr_h;

//uvm_analysis_port#(fmgpio_reg_seq_item) 

uvm_active_passive_enum is_active;


//Methods

extern function new(string name ="fmgpio_reg_agent", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass:fmgpio_reg_agent



//constructor
function fmgpio_reg_agent::new(string name ="fmgpio_reg_agent", uvm_component parent);
super.new(name, parent);
endfunction

//Build phase
function void fmgpio_reg_agent::build_phase(uvm_phase phase);

super.build_phase(phase);

monitor_h = fmgpio_reg_monitor::type_id::create("monitor_h", this);

//if(is_active == UVM_ACTIVE)
//begin
driver_h = fmgpio_reg_driver::type_id::create("driver_h", this);
seqr_h   = fmgpio_reg_seqr::type_id::create("seqr_h", this);
//end

endfunction

