module TAG_gen (
    input clk,
    input rst,
    input vep_en,
    input tag_en,
    input [5:0] vep_A,
    input [5:0] tag_A,
    input [23:0] vep_D,
    output reg [23:0] tag_gen_out
);

    reg [23:0] vep [63:0];
    integer i; 

	//tag_gen
    always @(*) begin
        if (tag_en)begin
            tag_gen_out = vep[tag_A];
        end
        else begin
            tag_gen_out = 24'd0;
        end
    end
    //vep
    always @(posedge clk or posedge rst)begin
		if(rst)begin
			for(i = 0;i < 64;i = i + 1)begin
				vep[i] <= 24'd0;
			end
		end
		else if (vep_en)begin
				vep[vep_A] <= vep_D;
		end
		else begin
			for(i = 0;i < 64;i = i + 1)begin
				vep[i] <= vep[i];
			end
		end
	end
    
endmodule
