`include "TAG_gen.v"
`include "TAG_controller.v"
`include "controller.v"
module top(
	input clk,
	input rst,
	//RAM codebook
	input [23:0] RAM_W_Q,
	output [23:0] RAM_W_D,
	output [17:0] RAM_W_A,
	output RAM_W_WE,
	output RAM_W_OE,
	//RAM TAG
	input [23:0] RAM_TAG_Q,
	output [23:0] RAM_TAG_D,
	output [17:0] RAM_TAG_A,
	output RAM_TAG_WE,
	output RAM_TAG_OE,
	//RAM Picture
	input [23:0] RAM_PIC_Q,
	output [23:0] RAM_PIC_D,
	output [17:0] RAM_PIC_A,
	output RAM_PIC_WE,
	output RAM_PIC_OE,
	//Controller
	output done
);
	//input related
	wire wire_in_0;
        wire wire_in_1;
	wire [5:0] wire_in_2;
	wire [5:0] wire_in_3;
	wire [23:0] wire_in_4;
	wire wire_in_5;
	wire [17:0] wire_in_6;
	wire [1:0] wire_in_7;
	//output related
	wire wire_out_0;
	wire wire_out_1;
	wire [5:0] wire_out_2;
	wire [5:0] wire_out_3;
	wire [23:0] wire_out_4;
	wire wire_out_5;
	wire [17:0] wire_out_6;
	wire [1:0] wire_out_7;
	
	assign RAM_W_WE = 1'b0;
	assign RAM_TAG_WE = 1'b0;
	assign RAM_PIC_OE = 1'b0;
	assign RAM_W_D = 24'd0;
	assign RAM_TAG_D = 24'd0;

	TAG_gen tag_gen0(
	.clk(clk),
	.rst(rst),
	.vep_en(wire_out_0),
        .tag_en(wire_out_1),
        .vep_A(wire_out_2),
        .tag_A(wire_out_3),
        .vep_D(wire_out_4),
        .tag_gen_out(RAM_PIC_D)
	);

	TAG_controller tag_controller0(
	.clk(clk),
    	.rst(rst),         
    	.vep_en_in(wire_in_0),
    	.tag_en_in(wire_in_1),
    	.vep_A_in(wire_in_2),
    	.tag_A_in(wire_in_3),
    	.vep_D_in(wire_in_4),
    	.RAM_PIC_WE_in(wire_in_5),
    	.RAM_PIC_A_in(wire_in_6),
	.state_in(wire_in_7),
    	.vep_en_out(wire_out_0),
    	.tag_en_out(wire_out_1),
    	.vep_A_out(wire_out_2),
    	.tag_A_out(wire_out_3),
    	.vep_D_out(wire_out_4),
    	.RAM_PIC_WE_out(wire_out_5),
    	.RAM_PIC_A_out(wire_out_6),
	.state(wire_out_7)
	);

	controller controller0(
	.clk(clk),
	.rst(rst),
	.done(done),		
	.RAM_W_Q(RAM_W_Q),
	.RAM_W_A(RAM_W_A),	
	.RAM_W_OE(RAM_W_OE),
	.RAM_TAG_Q(RAM_TAG_Q),	
	.RAM_TAG_A(RAM_TAG_A),
	.RAM_TAG_OE(RAM_TAG_OE),
	.RAM_PIC_A(RAM_PIC_A),
	.RAM_PIC_WE(RAM_PIC_WE),	
	.RAM_PIC_WE_in(wire_out_5),
	.RAM_PIC_A_in(wire_out_6),
	.RAM_PIC_WE_out(wire_in_5),
	.RAM_PIC_A_out(wire_in_6),		
	.vep_en(wire_in_0), 
	.tag_en(wire_in_1),
	.vep_A(wire_in_2),
	.tag_A(wire_in_3),
	.vep_D(wire_in_4),
	.state_in(wire_out_7),
	.state(wire_in_7)
	);
endmodule
