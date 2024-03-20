module controller(
	input clk,
	input rst,
	output reg done,
	//RAM_W
	input  [23:0]RAM_W_Q,
	output reg [17:0]RAM_W_A,	
	output reg RAM_W_OE,
	//RAM_TAG
	input [23:0] RAM_TAG_Q,	
	output reg [17:0] RAM_TAG_A,
	output reg RAM_TAG_OE,
	//RAM_PIC
    //output[23:0] RAM_PIC_D,
	output [17:0] RAM_PIC_A,
	output RAM_PIC_WE,	
	
	input RAM_PIC_WE_in,
	input [17:0] RAM_PIC_A_in,

	output reg RAM_PIC_WE_out,
	output reg [17:0] RAM_PIC_A_out,
	
	output reg vep_en,
    output reg tag_en,
	output [5:0]vep_A,
	output [5:0]tag_A,
	output [23:0]vep_D,
	input [1:0] state_in,
    output reg [1:0] state
);
	parameter  INIT = 2'b00;
	parameter LOAD_WEIGHT = 2'b01;
	parameter WRITE_PIC = 2'b10;
	parameter FINISH = 2'b11 ;

	reg [1:0] ns;
	
	wire con1;

	assign con1 = (state == WRITE_PIC) ? 1'b1 : 1'b0;
	
	assign RAM_PIC_A=RAM_PIC_A_in;
	assign RAM_PIC_WE=RAM_PIC_WE_in;
	
	assign vep_A = RAM_W_A[5:0];
	assign tag_A = RAM_TAG_Q[5:0];
    assign vep_D = RAM_W_Q;				
	
	//state
	always @(posedge clk or posedge rst) 
	begin
		if (rst)begin
			state <= INIT;	
		end	
		else begin			
			state <= ns;			
		end
	end
	//ns
	//finite state machine
	always @(*)begin
		case (state)
			INIT: begin				
				ns=LOAD_WEIGHT;			
			end
			LOAD_WEIGHT:begin
				if (RAM_W_A == 18'd63)
					ns = WRITE_PIC;
				else
					ns = LOAD_WEIGHT;				
			end
			WRITE_PIC:begin
				if (RAM_TAG_A == 18'd4095)
				    ns = FINISH;
				else
					ns = WRITE_PIC;			
			end
			default:begin
				ns = FINISH;				
			end			 
		endcase	
	end

	//RAM_TAG address
	always @(posedge clk or posedge rst) begin
		if (rst)
			RAM_TAG_A <= 18'b0;
		else if (con1)
			RAM_TAG_A <= RAM_TAG_A + 18'b1;
		else
			RAM_TAG_A <=18'b0;
	end

	//RAM_W address
	always @(posedge clk or posedge rst) begin
		if (rst)begin
			RAM_W_A <= 18'b111111111111111111;//owing to adding 1 initially at LOAD_WEIGHT state ,so minus before
		end
		else begin
			if (ns==LOAD_WEIGHT)begin
				RAM_W_A <= RAM_W_A + 18'd1;
			end
			else begin
				RAM_W_A <= (18'b111111111111111111);
			end			
		end
	end

	//RAM_PIC address
	always @(posedge clk or posedge rst) begin
		if (rst)
			RAM_PIC_A_out <= 18'b0;
		else if (con1)
				RAM_PIC_A_out <= RAM_PIC_A_out + 18'b1;
		else
			RAM_PIC_A_out <= 18'b0;
	end

	// every state
	always @(*) begin//RAM_W_OE
		case (state)
			INIT: begin			
				RAM_W_OE = 1'b0;
			end
			LOAD_WEIGHT:begin
				RAM_W_OE = 1'b1;
			end
			WRITE_PIC:begin
				RAM_W_OE = 1'b0;
			end
			default:begin
				RAM_W_OE = 1'b0;
			end			 
		endcase	
	end
	
	always @(*) begin//RAM_TAG_OE
		case (state)
			INIT: begin			
				RAM_TAG_OE = 1'b0;
			end
			LOAD_WEIGHT:begin
				RAM_TAG_OE = 1'b0;
			end
			WRITE_PIC:begin
				RAM_TAG_OE = 1'b1;
			end
			default:begin
				RAM_TAG_OE = 1'b0;
			end			 
		endcase	
	end
	
	always @(*) begin//vep_en
		case (state)
			INIT: begin			
				vep_en = 1'b0;
			end
			LOAD_WEIGHT:begin
				vep_en = 1'b1;
			end
			WRITE_PIC:begin
				vep_en = 1'b0;
			end
			default:begin
				vep_en = 1'b0;
			end			 
		endcase	
	end
	
	always @(*) begin//RAM_PIC_WE_out
		case (state)
			INIT: begin			
				RAM_PIC_WE_out = 1'b0;
			end
			LOAD_WEIGHT:begin
				RAM_PIC_WE_out = 1'b0;
			end
			WRITE_PIC:begin
				RAM_PIC_WE_out = 1'b1;
			end
			default:begin
				RAM_PIC_WE_out = 1'b0;
			end			 
		endcase	
	end
	
	always @(*) begin//tag_en
		case (state)
			INIT: begin			
				tag_en = 1'b0;
			end
			LOAD_WEIGHT:begin
				tag_en = 1'b0;
			end
			WRITE_PIC:begin
				tag_en = 1'b1;
			end
			default:begin
				tag_en = 1'b0;
			end			 
		endcase	
	end
	
	always @(*) begin
		done = (state_in==FINISH) ? 1'b1 :1'b0;
	end
	
endmodule


