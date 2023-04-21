module bomb_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [7:0] q
);

logic [7:0] memory [0:2399] /* synthesis ram_init_file = "./bomb/bomb.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
