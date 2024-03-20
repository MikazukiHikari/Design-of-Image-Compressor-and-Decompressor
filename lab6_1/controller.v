module controller(
  input                 clk,
  input                 rst,
  //input   [1:0]         mode,
  //input   [24*64 - 1:0] weight,
  //input   [2:0]         winner_VEP_x,
  //input   [2:0]         winner_VEP_y,
  output  reg          RAM_IF_OE,
  output  reg          RAM_IF_WE, //always zero
  output  reg [17:0]   RAM_IF_A,
  output  reg[23:0]    RAM_IF_D, //always zero
  output  reg          RAM_W_OE,
  output  reg          RAM_W_WE, //always zero
  output  reg [17:0]   RAM_W_A,
  output  reg [23:0]   RAM_W_D, //always zero
  output  reg          RAM_TAG_OE,
  output  reg          RAM_TAG_WE,
  output  reg [17:0]   RAM_TAG_A,
  //output  [23:0]     RAM_TAG_D,
  output  reg [63:0]   write_vep,
  output    reg        done
);
parameter INIT=2'b00,
          LOAD_WEIGHT=2'b01,
	  WRITE_TAG=2'b10,
	  FINISH=2'b11;
		  
reg [1:0] ns,state;
reg [5:0]counter;
integer idx;

always@(posedge clk or posedge rst)begin
    if(rst)begin
        state<=INIT;
    end
    else begin
        state<=ns;
    end
end

always @(*) begin
		case (state)	
		    INIT: begin				
				ns=LOAD_WEIGHT;			
			end
			LOAD_WEIGHT:begin
				if (RAM_W_A==18'd63)begin
					ns=WRITE_TAG;
				end
				else begin
					ns=LOAD_WEIGHT;
				end				
			end			
			WRITE_TAG:begin
				if (RAM_IF_A > 18'd4095)begin
				    ns=FINISH;
				end
				else begin
					ns=WRITE_TAG;
				end				
			end
			FINISH:begin
				ns=FINISH;				
			end
			
			/*default:begin
				ns=FINISH;
			end*/
		endcase	
	end
	
//ramIF&W address
always @(posedge clk or posedge rst) begin//RAM_W_A
	if (rst)begin
		RAM_W_A <= 18'b111111111111111111;//(18'd0-18'd1);//owing to adding 1 initially at LOAD_WEIGHT state ,so minus before
	end
	else if (ns==LOAD_WEIGHT)begin
		RAM_W_A <= RAM_W_A + 18'd1;
	end
	else if(ns==WRITE_TAG)begin
		RAM_W_A <= RAM_W_A;
	end
	else begin
			RAM_W_A <= (18'b111111111111111111);
	end			
end	

always @(posedge clk or posedge rst) begin//write_vep
	if (rst)begin
		write_vep <= 64'd0;
	end
	else if (ns==LOAD_WEIGHT)begin
		for(idx = 0; idx < 64; idx = idx +1)begin
				if(idx == {26'd0,counter})
					write_vep[idx] <=  1'b1;
				else
					write_vep[idx] <=  1'b0;
		end
	end
	else if(ns==WRITE_TAG)begin
		write_vep <= write_vep ;
	end
	else begin
		write_vep <= 64'd0;
	end			
end	
	
always @(posedge clk or posedge rst) begin//counter
	if (rst)begin
		counter <= 6'b0;
	end
	else if (ns==LOAD_WEIGHT)begin
		counter <= counter + 6'b1;
	end
	else if(ns==WRITE_TAG)begin
		counter <= counter;
	end
	else begin
		counter <= 6'b0;
	end			
end	
	
always @(posedge clk or posedge rst) begin//RAM_IF_A
	if (rst)begin
		RAM_IF_A <= (18'b111111111111111111);
	end
	else if (ns==LOAD_WEIGHT)begin
		RAM_IF_A <= RAM_IF_A;
	end
	else if(ns==WRITE_TAG)begin
		RAM_IF_A <= RAM_IF_A + 18'd1;
	end
	else begin
		RAM_IF_A<= (18'b111111111111111111);
	end
end	
	
//ramTAG address//RAM_TAG_A	
always @(posedge clk or posedge rst) begin
	if (rst) begin
		RAM_TAG_A <= (18'b111111111111111111);
	end
	else if (ns==WRITE_TAG)begin
		RAM_TAG_A <= RAM_IF_A;
	end
	else begin
		RAM_TAG_A<=(18'b111111111111111111);
	end
end
	
always @(*) begin//RAM_W_WE
	RAM_W_WE=1'b0;//always0
end

always @(*) begin//RAM_W_D
	RAM_W_D=24'b0;//always0
end

always @(*) begin//RAM_IF_WE
	RAM_IF_WE=1'b0;//always0
end

always @(*) begin//RAM_IF_D
	RAM_IF_D=24'b0;//always0
end

always @(*) begin//RAM_W_OE
	case (state)
		INIT: begin
			RAM_W_OE=1'b0;
		end
		LOAD_WEIGHT:begin
			RAM_W_OE=1'b1;
		end
		WRITE_TAG:begin
			RAM_W_OE=1'b0;
		end
		FINISH:begin
			RAM_W_OE=1'b0;
		end
		/*default:begin
			RAM_W_OE=1'b0;
		end*/
	endcase	
end

always @(*) begin//RAM_IF_OE
	case (state)
		INIT: begin
			RAM_IF_OE=1'b0;
		end
		LOAD_WEIGHT:begin
			RAM_IF_OE=1'b0;
		end
		WRITE_TAG:begin
			RAM_IF_OE=1'b1;
		end
		FINISH:begin
			RAM_IF_OE=1'b0;
		end
		/*default:begin
			RAM_IF_OE=1'b0;
		end*/
	endcase	
end

always @(*) begin//RAM_TAG_OE
	case (state)
		INIT: begin
			RAM_TAG_OE=1'b0;
		end
		LOAD_WEIGHT:begin
			RAM_TAG_OE=1'b0;
		end
		WRITE_TAG:begin
			RAM_TAG_OE=1'b0;
		end
		FINISH:begin
			RAM_TAG_OE=1'b0;
		end
		/*default:begin
			RAM_TAG_OE=1'b0;
		end*/
	endcase	
end

always @(*) begin//RAM_TAG_WE
	case (state)
		INIT: begin
			RAM_TAG_WE=1'b0;
		end
		LOAD_WEIGHT:begin
			RAM_TAG_WE=1'b0;
		end
		WRITE_TAG:begin
			RAM_TAG_WE=1'b1;
		end
		FINISH:begin
			RAM_TAG_WE=1'b0;
		end
		/*default:begin
			RAM_TAG_WE=1'b0;
		end*/
	endcase	
end

always @(*) begin//done
	case (state)
		INIT: begin
			done=1'b0;
		end
		LOAD_WEIGHT:begin
			done=1'b0;
		end
		WRITE_TAG:begin
			done=1'b0;
		end
		FINISH:begin
			done=1'b1;
		end
		/*default:begin
			done=1'b0;
		end*/
	endcase	
end

endmodule
