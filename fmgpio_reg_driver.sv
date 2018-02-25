class fmgpio_reg_driver extends uvm_driver#(fmgpio_reg_seq_item);

`uvm_component_utils(fmgpio_reg_driver);

virtual mem_if vif;

extern function new (string name ="fmgpio_reg_driver", uvm_component parent);
extern function void build_phase (uvm_phase phase);
//extern function void connect_phase (uvm_phase phase);
//extern task run_phase (uvm_phase phase);
//extern task drive ();
//Run_phase:

virtual task run_phase (uvm_phase phase);
//repeat(8) begin 
forever begin
seq_item_port.get_next_item(req);
    `uvm_info ("BASE_SEQ", $sformatf ("Seq item port from driver started %s", this.get_name()), UVM_MEDIUM)

@(posedge vif.clock);
vif.cmd = req.c;
vif.addr = req.a;
vif.data = req.d;

//end
seq_item_port.item_done();
    `uvm_info ("BASE_SEQ", $sformatf ("Seq item port from driver done %s", this.get_name()), UVM_MEDIUM)
end
endtask

endclass:fmgpio_reg_driver

//construction
function fmgpio_reg_driver::new(string name= "fmgpio_reg_driver", uvm_component parent );
super.new(name, parent);
endfunction

//Build

function void fmgpio_reg_driver::build_phase(uvm_phase phase);

super.build_phase(phase);

 if(!uvm_config_db#(virtual mem_if)::get(this, "", "mem_if", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
endfunction
