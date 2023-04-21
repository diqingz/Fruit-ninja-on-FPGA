module random_num( input logic clk, reset,
						 output reg [7:0] out
);

reg [7:0] lfsr_reg = 8'hFF; // initial value

always @(posedge clk) begin
    if (reset) 
	 begin
        lfsr_reg <= 8'hFF;
    end 
	 else 
	 begin
        lfsr_reg <= {lfsr_reg[6:0], lfsr_reg[7] ^ lfsr_reg[5]}; // feedback
    end
end

assign out = lfsr_reg;

endmodule