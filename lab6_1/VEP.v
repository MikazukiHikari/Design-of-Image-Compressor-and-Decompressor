/*
* Hint
sigal explanation:
1.  clk                	: This is a positive edge-triggered clock signal.
2.  rst                	: This is a reset signal.
3.  VEP_x              	: The x-coordinate of this VEP.
4.  VEP_y              	: The y-coordinate of this VEP.
5.  pixel              	: Same as RAM_IF_Q, includes {R, G, B} channels with 8 bits in each channel.
6.  weight_initial    	: The initial codebook value read from RAM_W.
7.  weight_update     	: A write enable signal from the controller that tells the read data(codebook) from RAM_W for which VEP should write.
8.  tag					: output the tag of the codebook(weight) stored in this VEP (tag = {y, x})
9.  manhattan_distance 	: For example, the Manhattan distance between (125, 80, 27) and (110, 70, 34) is |125-110|+|80-70|+|27-34|=32.

*/

module VEP(
  input              clk,
  input              rst,
  input  [2:0] VEP_x,
  input  [2:0] VEP_y,
  /*input  [      2:0] winner_VEP_x,
  input  [      2:0] winner_VEP_y,*/
  input	pixel_en,//self_add
  input  [8*3 - 1:0] pixel,
  input  [8*3 - 1:0] weight_initial,
  input              weight_update,
  //output reg [8*3 - 1:0] weight,
  output reg [5:0]  tag,
  output reg [9:0] manhattan_distance//manhattan distance, add 2 extension bits to prevent overflow
);

reg [23:0]weight;
reg [23:0]input_pixel;

wire rbig;
wire gbig;
wire bbig;
wire [23:0] tmp_weight;
wire [7:0] minus_r;
wire [7:0] minus_b;
wire [7:0] minus_g;

wire [7:0] front_r;
wire [7:0] back_r;

wire [7:0] front_b;
wire [7:0] back_b;

wire [7:0] front_g;
wire [7:0] back_g;


always @(posedge clk or posedge rst) begin
	if(rst)begin
		weight <= 24'b0;
	end
	else if ((weight_update)&&(pixel_en)) begin
		weight <= weight_initial;
	end
	else begin
		weight <= weight;
	end
end

always @(posedge clk or posedge rst) begin
	if(rst)begin
		input_pixel <= 24'b0;
	end
	else  begin
		input_pixel <= pixel;	
	end
end

assign tmp_weight = weight;
assign rbig = (tmp_weight[23:16]>input_pixel[23:16]) ? 1'b1 : 1'b0;
assign gbig = (tmp_weight[15:8]>input_pixel[15:8]) ? 1'b1 : 1'b0;
assign bbig = (tmp_weight[7:0]>input_pixel[7:0]) ? 1'b1 : 1'b0;

assign minus_r = front_r - back_r;
assign front_r = (rbig) ? tmp_weight[23:16]:input_pixel[23:16];
assign back_r = (rbig) ? input_pixel[23:16]:tmp_weight[23:16];

assign minus_g = front_g - back_g;
assign front_g = (gbig) ? tmp_weight[15:8]:input_pixel[15:8];
assign back_g = (gbig) ? input_pixel[15:8]:tmp_weight[15:8];

assign minus_b = front_b - back_b;
assign front_b = (bbig) ? tmp_weight[7:0]:input_pixel[7:0];
assign back_b = (bbig) ? input_pixel[7:0]:tmp_weight[7:0];

always @(*)begin
	manhattan_distance = {{2'b0},minus_r}+{{2'b0},minus_g}+{{2'b0},minus_b};
end

always @(*)begin
	tag = {VEP_y,VEP_x};
end

endmodule
