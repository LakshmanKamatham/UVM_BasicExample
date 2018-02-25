
interface mem_if(clock);
input clock;
logic cmd;
logic [7:0] addr;
logic [7:0] data;
endinterface