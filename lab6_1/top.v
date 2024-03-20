/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2023 Spring   -------------------- //
// ---------------------   Editor : Anson     ---------------------//
// --------------------    Date : 2023.03     -------------------- //
// -------------------- Lab6_1 Image Compress -------------------- // 
/////////////////////////////////////////////////////////////////////
`include "VEP.v"
`include "WSC.v"
`include "controller.v"

module top(
  input          clk,
  input          rst,
  input  [23:0]  RAM_IF_Q,
  input  [23:0]  RAM_W_Q,
  input  [23:0]  RAM_TAG_Q,
  output         RAM_IF_OE,
  output         RAM_IF_WE,
  output [17:0]  RAM_IF_A,
  output [23:0]  RAM_IF_D,
  output         RAM_W_OE,
  output         RAM_W_WE,
  output [17:0]  RAM_W_A,
  output [23:0]  RAM_W_D,
  output         RAM_TAG_OE,
  output         RAM_TAG_WE,
  output [17:0]  RAM_TAG_A,
  output reg [23:0]  RAM_TAG_D,
  output reg       done
);

wire [2:0] winner_x1;
wire [2:0] winner_y1;
wire [5:0] comb;
wire done_w;
wire [9:0] md [63:0];

wire [63:0]   write_vep;

wire [2:0] a0;
wire [2:0] a1;
wire [2:0] a2;
wire [2:0] a3;
wire [2:0] a4;
wire [2:0] a5;
wire [2:0] a6;
wire [2:0] a7;

assign a0 = 3'b000;
assign a1 = 3'b001;
assign a2 = 3'b010;
assign a3 = 3'b011;
assign a4 = 3'b100;
assign a5 = 3'b101;
assign a6 = 3'b110;
assign a7 = 3'b111;

controller controller0(
.clk(clk),
.rst(rst),
.RAM_IF_OE(RAM_IF_OE),
.RAM_IF_WE(RAM_IF_WE),
.RAM_IF_A(RAM_IF_A),
.RAM_IF_D(RAM_IF_D),
.RAM_W_OE(RAM_W_OE),
.RAM_W_WE(RAM_W_WE),
.RAM_W_A(RAM_W_A),
.RAM_W_D(RAM_W_D),
.RAM_TAG_OE(RAM_TAG_OE),
.RAM_TAG_WE(RAM_TAG_WE),
.RAM_TAG_A(RAM_TAG_A),
.write_vep(write_vep),
.done(done_w)
);

VEP vep0(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a0),
.pixel_en(write_vep[0]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd0),
.manhattan_distance(md[0])
);

VEP vep1(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a0),
.pixel_en(write_vep[1]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd1),
.manhattan_distance(md[1])
);

VEP vep2(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a0),
.pixel_en(write_vep[2]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd2),
.manhattan_distance(md[2])
);

VEP vep3(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a0),
.pixel_en(write_vep[3]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd3),
.manhattan_distance(md[3])
);

VEP vep4(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a0),
.pixel_en(write_vep[4]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd4),
.manhattan_distance(md[4])
);

VEP vep5(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a0),
.pixel_en(write_vep[5]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd5),
.manhattan_distance(md[5])
);

VEP vep6(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a0),
.pixel_en(write_vep[6]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd6),
.manhattan_distance(md[6])
);

VEP vep7(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a0),
.pixel_en(write_vep[7]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd7),
.manhattan_distance(md[7])
);

VEP vep8(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a1),
.pixel_en(write_vep[8]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd8),
.manhattan_distance(md[8])
);

VEP vep9(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a1),
.pixel_en(write_vep[9]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd9),
.manhattan_distance(md[9])
);

VEP vep10(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a1),
.pixel_en(write_vep[10]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd10),
.manhattan_distance(md[10])
);

VEP vep11(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a1),
.pixel_en(write_vep[11]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd11),
.manhattan_distance(md[11])
);

VEP vep12(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a1),
.pixel_en(write_vep[12]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd12),
.manhattan_distance(md[12])
);

VEP vep13(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a1),
.pixel_en(write_vep[13]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd13),
.manhattan_distance(md[13])
);

VEP vep14(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a1),
.pixel_en(write_vep[14]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd14),
.manhattan_distance(md[14])
);

VEP vep15(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a1),
.pixel_en(write_vep[15]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd15),
.manhattan_distance(md[15])
);

VEP vep16(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a2),
.pixel_en(write_vep[16]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd16),
.manhattan_distance(md[16])
);

VEP vep17(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a2),
.pixel_en(write_vep[17]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd17),
.manhattan_distance(md[17])
);

VEP vep18(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a2),
.pixel_en(write_vep[18]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd18),
.manhattan_distance(md[18])
);

VEP vep19(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a2),
.pixel_en(write_vep[19]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd19),
.manhattan_distance(md[19])
);

VEP vep20(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a2),
.pixel_en(write_vep[20]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd20),
.manhattan_distance(md[20])
);

VEP vep21(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a2),
.pixel_en(write_vep[21]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd21),
.manhattan_distance(md[21])
);

VEP vep22(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a2),
.pixel_en(write_vep[22]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd22),
.manhattan_distance(md[22])
);

VEP vep23(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a2),
.pixel_en(write_vep[23]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd23),
.manhattan_distance(md[23])
);

VEP vep24(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a3),
.pixel_en(write_vep[24]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd24),
.manhattan_distance(md[24])
);

VEP vep25(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a3),
.pixel_en(write_vep[25]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd25),
.manhattan_distance(md[25])
);

VEP vep26(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a3),
.pixel_en(write_vep[26]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd26),
.manhattan_distance(md[26])
);

VEP vep27(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a3),
.pixel_en(write_vep[27]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd27),
.manhattan_distance(md[27])
);

VEP vep28(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a3),
.pixel_en(write_vep[28]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd28),
.manhattan_distance(md[28])
);

VEP vep29(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a3),
.pixel_en(write_vep[29]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd29),
.manhattan_distance(md[29])
);

VEP vep30(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a3),
.pixel_en(write_vep[30]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd30),
.manhattan_distance(md[30])
);

VEP vep31(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a3),
.pixel_en(write_vep[31]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd31),
.manhattan_distance(md[31])
);

VEP vep32(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a4),
.pixel_en(write_vep[32]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd32),
.manhattan_distance(md[32])
);

VEP vep33(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a4),
.pixel_en(write_vep[33]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd33),
.manhattan_distance(md[33])
);

VEP vep34(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a4),
.pixel_en(write_vep[34]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd34),
.manhattan_distance(md[34])
);

VEP vep35(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a4),
.pixel_en(write_vep[35]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd35),
.manhattan_distance(md[35])
);

VEP vep36(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a4),
.pixel_en(write_vep[36]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd36),
.manhattan_distance(md[36])
);

VEP vep37(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a4),
.pixel_en(write_vep[37]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd37),
.manhattan_distance(md[37])
);

VEP vep38(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a4),
.pixel_en(write_vep[38]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd38),
.manhattan_distance(md[38])
);

VEP vep39(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a4),
.pixel_en(write_vep[39]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd39),
.manhattan_distance(md[39])
);

VEP vep40(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a5),
.pixel_en(write_vep[40]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd40),
.manhattan_distance(md[40])
);

VEP vep41(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a5),
.pixel_en(write_vep[41]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd41),
.manhattan_distance(md[41])
);

VEP vep42(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a5),
.pixel_en(write_vep[42]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd42),
.manhattan_distance(md[42])
);

VEP vep43(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a5),
.pixel_en(write_vep[43]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd43),
.manhattan_distance(md[43])
);

VEP vep44(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a5),
.pixel_en(write_vep[44]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd44),
.manhattan_distance(md[44])
);

VEP vep45(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a5),
.pixel_en(write_vep[45]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd45),
.manhattan_distance(md[45])
);

VEP vep46(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a5),
.pixel_en(write_vep[46]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd46),
.manhattan_distance(md[46])
);

VEP vep47(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a5),
.pixel_en(write_vep[47]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd47),
.manhattan_distance(md[47])
);

VEP vep48(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a6),
.pixel_en(write_vep[48]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd48),
.manhattan_distance(md[48])
);

VEP vep49(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a6),
.pixel_en(write_vep[49]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd49),
.manhattan_distance(md[49])
);

VEP vep50(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a6),
.pixel_en(write_vep[50]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd50),
.manhattan_distance(md[50])
);

VEP vep51(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a6),
.pixel_en(write_vep[51]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd51),
.manhattan_distance(md[51])
);

VEP vep52(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a6),
.pixel_en(write_vep[52]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd52),
.manhattan_distance(md[52])
);

VEP vep53(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a6),
.pixel_en(write_vep[53]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd53),
.manhattan_distance(md[53])
);

VEP vep54(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a6),
.pixel_en(write_vep[54]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd54),
.manhattan_distance(md[54])
);

VEP vep55(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a6),
.pixel_en(write_vep[55]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd55),
.manhattan_distance(md[55])
);

VEP vep56(
.clk(clk),
.rst(rst),
.VEP_x(a0),
.VEP_y(a7),
.pixel_en(write_vep[56]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd56),
.manhattan_distance(md[56])
);

VEP vep57(
.clk(clk),
.rst(rst),
.VEP_x(a1),
.VEP_y(a7),
.pixel_en(write_vep[57]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd57),
.manhattan_distance(md[57])
);

VEP vep58(
.clk(clk),
.rst(rst),
.VEP_x(a2),
.VEP_y(a7),
.pixel_en(write_vep[58]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd58),
.manhattan_distance(md[58])
);

VEP vep59(
.clk(clk),
.rst(rst),
.VEP_x(a3),
.VEP_y(a7),
.pixel_en(write_vep[59]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd59),
.manhattan_distance(md[59])
);

VEP vep60(
.clk(clk),
.rst(rst),
.VEP_x(a4),
.VEP_y(a7),
.pixel_en(write_vep[60]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd60),
.manhattan_distance(md[60])
);

VEP vep61(
.clk(clk),
.rst(rst),
.VEP_x(a5),
.VEP_y(a7),
.pixel_en(write_vep[61]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd61),
.manhattan_distance(md[61])
);

VEP vep62(
.clk(clk),
.rst(rst),
.VEP_x(a6),
.VEP_y(a7),
.pixel_en(write_vep[62]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd62),
.manhattan_distance(md[62])
);

VEP vep63(
.clk(clk),
.rst(rst),
.VEP_x(a7),
.VEP_y(a7),
.pixel_en(write_vep[63]),
.pixel(RAM_IF_Q),
.weight_initial(RAM_W_Q),
.weight_update(RAM_W_OE),
.tag(),//6'd63),
.manhattan_distance(md[63])
);

WSC wsc(
		.VEPs_manhattan_distance({
		md[63],md[62],md[61],md[60],md[59],md[58],md[57],md[56],
		md[55],md[54],md[53],md[52],md[51],md[50],md[49],md[48],
		md[47],md[46],md[45],md[44],md[43],md[42],md[41],md[40],
		md[39],md[38],md[37],md[36],md[35],md[34],md[33],md[32],
		md[31],md[30],md[29],md[28],md[27],md[26],md[25],md[24],
		md[23],md[22],md[21],md[20],md[19],md[18],md[17],md[16],
		md[15],md[14],md[13],md[12],md[11],md[10],md[9],md[8],
		md[7],md[6],md[5],md[4],md[3],md[2],md[1],md[0]}),
		.winner_x(winner_x1),
		.winner_y(winner_y1)
);
assign comb = {winner_y1,winner_x1};

always @(*) begin
	RAM_TAG_D = {18'b0,comb};
	done = done_w;
end

endmodule
