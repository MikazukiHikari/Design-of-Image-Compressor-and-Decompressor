module TAG_controller (
    input clk,
    input rst,         
    input [23:0] vep_D_in,
    input [5:0] vep_A_in,
	input vep_en_in,
    input tag_en_in,
    input [5:0] tag_A_in,
    input RAM_PIC_WE_in,
    input [17:0] RAM_PIC_A_in,
    input [1:0] state_in,
	output reg [1:0] state,
    output reg tag_en_out,
    output reg [5:0] tag_A_out,
	output reg vep_en_out,
    output reg [23:0]vep_D_out,
    output reg [5:0] vep_A_out,
    output reg RAM_PIC_WE_out,
    output reg [17:0] RAM_PIC_A_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <=2'b00;
        else 
            state <= state_in;   
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            vep_en_out <=  1'b0;
        end
        else begin
            vep_en_out <= vep_en_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            tag_en_out <= 1'b0;
        end
        else begin
            tag_en_out <=tag_en_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            vep_A_out <= 6'd0;
        end
        else begin
            vep_A_out <= vep_A_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            tag_A_out <= 6'd0;
        end
        else begin
            tag_A_out <= tag_A_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            vep_D_out <= 24'd0;
        end
        else begin
            vep_D_out <= vep_D_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)begin
            RAM_PIC_WE_out <= 1'b0;
        end
        else begin
            RAM_PIC_WE_out <= RAM_PIC_WE_in;
        end    
    end
	
	always @(posedge clk or posedge rst) begin
        if (rst)
            RAM_PIC_A_out <= 18'd0;
        else
            RAM_PIC_A_out <= RAM_PIC_A_in;    
    end
	

endmodule
