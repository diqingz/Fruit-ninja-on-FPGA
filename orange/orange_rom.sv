module orange_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [7:0] q
);

logic [7:0] memory [0:3599] /* synthesis ram_init_file = "./orange/orange.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
