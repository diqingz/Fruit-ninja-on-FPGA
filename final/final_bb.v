
module final (
	clk_clk,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	sdram_clk_clk,
	key1_wire_export,
	key0_wire_export,
	keycode_export,
	usb_irq_export,
	usb_gpx_export,
	usb_rst_export,
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n,
	hex_digits_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output		sdram_clk_clk;
	input		key1_wire_export;
	input		key0_wire_export;
	output	[7:0]	keycode_export;
	input		usb_irq_export;
	input		usb_gpx_export;
	output		usb_rst_export;
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
	output	[15:0]	hex_digits_export;
endmodule
