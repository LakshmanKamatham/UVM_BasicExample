class fmgpio_reg_seq extends uvm_sequence #(fmgpio_reg_seq_item);
`uvm_object_utils(fmgpio_reg_seq)


extern function new(string name = "fmgpio_reg_seq");
extern task body();
endclass

//constructor
function fmgpio_reg_seq::new(string name = "fmgpio_reg_seq");
super.new(name);
endfunction


task fmgpio_reg_seq::body();
fmgpio_reg_seq_item req;
    `uvm_info ("BASE_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
//repeat(8) begin
//    start_item(req);
//     if( !req.randomize() )
//          `uvm_error("", "Randomize failed")
//    finish_item(req);
//end
//`uvm_do(req)


repeat(8) begin
    req = fmgpio_reg_seq_item::type_id::create("req");
    wait_for_grant();
    `uvm_info ("BASE_SEQ", $sformatf ("waiting for the grant %s", this.get_name()), UVM_MEDIUM)
    req.randomize();
    `uvm_info ("BASE_SEQ", $sformatf ("Randomizing the Req %s", this.get_name()), UVM_MEDIUM)
    send_request(req);
    `uvm_info ("BASE_SEQ", $sformatf ("Sending the Req to DUT %s", this.get_name()), UVM_MEDIUM)
    wait_for_item_done();

end
`uvm_info ("BASE_SEQ", $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
endtask
