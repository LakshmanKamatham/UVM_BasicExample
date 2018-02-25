`include "fmgpio_reg_env.svh"
`include "fmgpio_reg_seq.sv"
class gpio_test extends uvm_test;
`uvm_component_utils(gpio_test)

fmgpio_reg_env env_h;
fmgpio_reg_seq seq_h;

//virtual mem_if vif();
uvm_active_passive_enum is_active;

extern function new(string name = "gpio_test", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
//extern task run_phase(uvm_phase phase);
virtual task run_phase(uvm_phase phase);
     `uvm_info("MSG1", " message ", UVM_LOW)
  // Create the sequence
    seq_h = fmgpio_reg_seq::type_id::create("seq_h");
    if( !seq_h.randomize() ) 
        `uvm_error("", "Randomize failed")
      phase.raise_objection(this);
     // seq_h.set_sequencer (env_h.agent_h.seqr_h);
      seq_h.start(env_h.agent_h.seqr_h);
    phase.drop_objection(this);
  endtask

endclass

function gpio_test::new(string name = "gpio_test", uvm_component parent);
super.new(name,parent);
endfunction

function void gpio_test::build_phase(uvm_phase phase);
env_h = fmgpio_reg_env::type_id::create("env_h",this);

endfunction

 //---------------------------------------
  // end_of_elobaration phase
  //---------------------------------------  
function void gpio_test::end_of_elaboration_phase(uvm_phase phase);
    //print's the topology
 //   print();
     `uvm_info("MSG2", " message ", UVM_LOW)
endfunction
