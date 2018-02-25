`include "fmgpio_reg_seq_item.sv"
class fmgpio_reg_seqr extends uvm_sequencer #(fmgpio_reg_seq_item);

`uvm_component_utils(fmgpio_reg_seqr)

extern function new(string name = "fmgpio_reg_seqr", uvm_component parent);

endclass

//constructor

function fmgpio_reg_seqr::new (string name = "fmgpio_reg_seqr", uvm_component parent);
super.new(name, parent);
endfunction