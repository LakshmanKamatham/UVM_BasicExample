//`include "uvm_macros.svh"
class fmgpio_reg_seq_item extends uvm_sequence_item;
//data

rand bit [7:0] a, d;
bit c;

//utility and field macro
//`uvm_object_utils(fmgpio_reg_seq_item)
`uvm_object_utils_begin(fmgpio_reg_seq_item)
`uvm_field_int(a,UVM_ALL_ON)
`uvm_field_int(d,UVM_ALL_ON)
`uvm_field_int(c,UVM_ALL_ON)
`uvm_object_utils_end

extern function new(string name = "fmgpio_reg_seq_item");


endclass:fmgpio_reg_seq_item

//constructor
function fmgpio_reg_seq_item::new(string name = "fmgpio_reg_seq_item");
super.new(name);
endfunction

