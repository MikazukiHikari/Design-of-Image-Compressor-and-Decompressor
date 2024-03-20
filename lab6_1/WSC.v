module WSC(
	//{VEP63.manhattan_distance, VEP62.manhattan_distance, ... , VEP0.manhattan_distance}
	input  [10*64 - 1:0] VEPs_manhattan_distance,
	output reg [2:0] winner_x,
	output reg [2:0] winner_y
);
wire [2:0] tmp_x;
wire [2:0] tmp_y;

wire [9:0]tmp0;
wire [9:0]tmp1;
wire [9:0]tmp2;
wire [9:0]tmp3;
wire [9:0]tmp4;
wire [9:0]tmp5;
wire [9:0]tmp6;
wire [9:0]tmp7;
wire [9:0]tmp8;
wire [9:0]tmp9;
wire [9:0]tmp10;
wire [9:0]tmp11;
wire [9:0]tmp12;
wire [9:0]tmp13;
wire [9:0]tmp14;
wire [9:0]tmp15;
wire [9:0]tmp16;
wire [9:0]tmp17;
wire [9:0]tmp18;
wire [9:0]tmp19;
wire [9:0]tmp20;
wire [9:0]tmp21;
wire [9:0]tmp22;
wire [9:0]tmp23;
wire [9:0]tmp24;
wire [9:0]tmp25;
wire [9:0]tmp26;
wire [9:0]tmp27;
wire [9:0]tmp28;
wire [9:0]tmp29;
wire [9:0]tmp30;
wire [9:0]tmp31;

wire [9:0]twotmp0;
wire [9:0]twotmp1;
wire [9:0]twotmp2;
wire [9:0]twotmp3;
wire [9:0]twotmp4;
wire [9:0]twotmp5;
wire [9:0]twotmp6;
wire [9:0]twotmp7;
wire [9:0]twotmp8;
wire [9:0]twotmp9;
wire [9:0]twotmp10;
wire [9:0]twotmp11;
wire [9:0]twotmp12;
wire [9:0]twotmp13;
wire [9:0]twotmp14;
wire [9:0]twotmp15;

wire [9:0]threetmp0;
wire [9:0]threetmp1;
wire [9:0]threetmp2;
wire [9:0]threetmp3;
wire [9:0]threetmp4;
wire [9:0]threetmp5;
wire [9:0]threetmp6;
wire [9:0]threetmp7;

wire [9:0]fourtmp0;
wire [9:0]fourtmp1;
wire [9:0]fourtmp2;
wire [9:0]fourtmp3;

wire [9:0]fivetmp0;
wire [9:0]fivetmp1;

wire [9:0]sixtmp0;

wire [9:0]finalx;

assign tmp0 = (VEPs_manhattan_distance[9:0]<=VEPs_manhattan_distance[19:10])? 10'd0 : 10'd10;
assign tmp1 = (VEPs_manhattan_distance[29:20]<=VEPs_manhattan_distance[39:30])? 10'd20 : 10'd30;
assign tmp2 = (VEPs_manhattan_distance[49:40]<=VEPs_manhattan_distance[59:50])? 10'd40 : 10'd50;
assign tmp3 = (VEPs_manhattan_distance[69:60]<=VEPs_manhattan_distance[79:70])? 10'd60 : 10'd70;
assign tmp4 = (VEPs_manhattan_distance[89:80]<=VEPs_manhattan_distance[99:90])? 10'd80 : 10'd90;
assign tmp5 = (VEPs_manhattan_distance[109:100]<=VEPs_manhattan_distance[119:110]) ? 10'd100 : 10'd110;
assign tmp6 = (VEPs_manhattan_distance[129:120]<=VEPs_manhattan_distance[139:130]) ? 10'd120 : 10'd130;
assign tmp7 = (VEPs_manhattan_distance[149:140]<=VEPs_manhattan_distance[159:150]) ? 10'd140 : 10'd150;
assign tmp8 = (VEPs_manhattan_distance[169:160]<=VEPs_manhattan_distance[179:170]) ? 10'd160 : 10'd170;
assign tmp9 =  (VEPs_manhattan_distance[189:180]<=VEPs_manhattan_distance[199:190]) ? 10'd180 : 10'd190;
assign tmp10 = (VEPs_manhattan_distance[209:200]<=VEPs_manhattan_distance[219:210]) ? 10'd200 : 10'd210;
assign tmp11 = (VEPs_manhattan_distance[229:220]<=VEPs_manhattan_distance[239:230]) ? 10'd220 : 10'd230;
assign tmp12 = (VEPs_manhattan_distance[249:240]<=VEPs_manhattan_distance[259:250]) ? 10'd240 : 10'd250;
assign tmp13 = (VEPs_manhattan_distance[269:260]<=VEPs_manhattan_distance[279:270]) ? 10'd260 : 10'd270;
assign tmp14 = (VEPs_manhattan_distance[289:280]<=VEPs_manhattan_distance[299:290]) ? 10'd280 : 10'd290;
assign tmp15 = (VEPs_manhattan_distance[309:300]<=VEPs_manhattan_distance[319:310]) ? 10'd300 : 10'd310;
assign tmp16 = (VEPs_manhattan_distance[329:320]<=VEPs_manhattan_distance[339:330]) ? 10'd320 : 10'd330;
assign tmp17 = (VEPs_manhattan_distance[349:340]<=VEPs_manhattan_distance[359:350]) ? 10'd340 : 10'd350;
assign tmp18 = (VEPs_manhattan_distance[369:360]<=VEPs_manhattan_distance[379:370]) ? 10'd360 : 10'd370;
assign tmp19 = (VEPs_manhattan_distance[389:380]<=VEPs_manhattan_distance[399:390]) ? 10'd380 : 10'd390;
assign tmp20 = (VEPs_manhattan_distance[409:400]<=VEPs_manhattan_distance[419:410]) ? 10'd400 : 10'd410;
assign tmp21 = (VEPs_manhattan_distance[429:420]<=VEPs_manhattan_distance[439:430]) ? 10'd420 : 10'd430;
assign tmp22 = (VEPs_manhattan_distance[449:440]<=VEPs_manhattan_distance[459:450]) ? 10'd440 : 10'd450;
assign tmp23 = (VEPs_manhattan_distance[469:460]<=VEPs_manhattan_distance[479:470]) ? 10'd460 : 10'd470;
assign tmp24 = (VEPs_manhattan_distance[489:480]<=VEPs_manhattan_distance[499:490]) ? 10'd480 : 10'd490;
assign tmp25 = (VEPs_manhattan_distance[509:500]<=VEPs_manhattan_distance[519:510]) ? 10'd500 : 10'd510;
assign tmp26 = (VEPs_manhattan_distance[529:520]<=VEPs_manhattan_distance[539:530]) ? 10'd520 : 10'd530;
assign tmp27 = (VEPs_manhattan_distance[549:540]<=VEPs_manhattan_distance[559:550]) ? 10'd540 : 10'd550;
assign tmp28 = (VEPs_manhattan_distance[569:560]<=VEPs_manhattan_distance[579:570]) ? 10'd560 : 10'd570;
assign tmp29 = (VEPs_manhattan_distance[589:580]<=VEPs_manhattan_distance[599:590]) ? 10'd580 : 10'd590;
assign tmp30 = (VEPs_manhattan_distance[609:600]<=VEPs_manhattan_distance[619:610]) ? 10'd600 : 10'd610;
assign tmp31 = (VEPs_manhattan_distance[629:620]<=VEPs_manhattan_distance[639:630]) ? 10'd620 : 10'd630;

assign twotmp0 = (VEPs_manhattan_distance[tmp0 +: 10'd10]<=VEPs_manhattan_distance[tmp1 +: 10'd10]) ? tmp0 : tmp1;
assign twotmp1 = (VEPs_manhattan_distance[tmp2 +: 10'd10]<=VEPs_manhattan_distance[tmp3 +: 10'd10]) ? tmp2 : tmp3;
assign twotmp2 = (VEPs_manhattan_distance[tmp4 +: 10'd10]<=VEPs_manhattan_distance[tmp5 +: 10'd10]) ? tmp4 : tmp5;
assign twotmp3 = (VEPs_manhattan_distance[tmp6 +: 10'd10]<=VEPs_manhattan_distance[tmp7 +: 10'd10]) ? tmp6 : tmp7;
assign twotmp4 = (VEPs_manhattan_distance[tmp8 +: 10'd10]<=VEPs_manhattan_distance[tmp9 +: 10'd10]) ? tmp8 : tmp9;
assign twotmp5 = (VEPs_manhattan_distance[tmp10 +: 10'd10]<=VEPs_manhattan_distance[tmp11 +: 10'd10]) ? tmp10 : tmp11;
assign twotmp6 = (VEPs_manhattan_distance[tmp12 +: 10'd10]<=VEPs_manhattan_distance[tmp13 +: 10'd10]) ? tmp12 : tmp13;
assign twotmp7 = (VEPs_manhattan_distance[tmp14 +: 10'd10]<=VEPs_manhattan_distance[tmp15 +: 10'd10]) ? tmp14 : tmp15;
assign twotmp8 = (VEPs_manhattan_distance[tmp16 +: 10'd10]<=VEPs_manhattan_distance[tmp17 +: 10'd10]) ? tmp16 : tmp17;
assign twotmp9 = (VEPs_manhattan_distance[tmp18 +: 10'd10]<=VEPs_manhattan_distance[tmp19 +: 10'd10]) ? tmp18 : tmp19;
assign twotmp10 = (VEPs_manhattan_distance[tmp20 +: 10'd10]<=VEPs_manhattan_distance[tmp21 +: 10'd10]) ? tmp20 : tmp21;
assign twotmp11 = (VEPs_manhattan_distance[tmp22 +: 10'd10]<=VEPs_manhattan_distance[tmp23 +: 10'd10]) ? tmp22 : tmp23;
assign twotmp12 = (VEPs_manhattan_distance[tmp24 +: 10'd10]<=VEPs_manhattan_distance[tmp25 +: 10'd10]) ? tmp24 : tmp25;
assign twotmp13 = (VEPs_manhattan_distance[tmp26 +: 10'd10]<=VEPs_manhattan_distance[tmp27 +: 10'd10]) ? tmp26 : tmp27;
assign twotmp14 = (VEPs_manhattan_distance[tmp28 +: 10'd10]<=VEPs_manhattan_distance[tmp29 +: 10'd10]) ? tmp28 : tmp29;
assign twotmp15 = (VEPs_manhattan_distance[tmp30 +: 10'd10]<=VEPs_manhattan_distance[tmp31 +: 10'd10]) ? tmp30 : tmp31;


assign threetmp0 = (VEPs_manhattan_distance[twotmp0 +: 10'd10]<=VEPs_manhattan_distance[twotmp1 +: 10'd10]) ? twotmp0 : twotmp1;
assign threetmp1 = (VEPs_manhattan_distance[twotmp2 +: 10'd10]<=VEPs_manhattan_distance[twotmp3 +: 10'd10]) ? twotmp2 : twotmp3;
assign threetmp2 = (VEPs_manhattan_distance[twotmp4 +: 10'd10]<=VEPs_manhattan_distance[twotmp5 +: 10'd10]) ? twotmp4 : twotmp5;
assign threetmp3 = (VEPs_manhattan_distance[twotmp6 +: 10'd10]<=VEPs_manhattan_distance[twotmp7 +: 10'd10]) ? twotmp6 : twotmp7;
assign threetmp4 = (VEPs_manhattan_distance[twotmp8 +: 10'd10]<=VEPs_manhattan_distance[twotmp9 +: 10'd10]) ? twotmp8 : twotmp9;
assign threetmp5 = (VEPs_manhattan_distance[twotmp10 +: 10'd10]<=VEPs_manhattan_distance[twotmp11 +: 10'd10]) ? twotmp10 : twotmp11;
assign threetmp6 = (VEPs_manhattan_distance[twotmp12 +: 10'd10]<=VEPs_manhattan_distance[twotmp13 +: 10'd10]) ? twotmp12 : twotmp13;
assign threetmp7 = (VEPs_manhattan_distance[twotmp14 +: 10'd10]<=VEPs_manhattan_distance[twotmp15 +: 10'd10]) ? twotmp14 : twotmp15;


assign fourtmp0 = (VEPs_manhattan_distance[threetmp0 +: 10'd10]<=VEPs_manhattan_distance[threetmp1 +: 10'd10]) ? threetmp0 : threetmp1;
assign fourtmp1 = (VEPs_manhattan_distance[threetmp2 +: 10'd10]<=VEPs_manhattan_distance[threetmp3 +: 10'd10]) ? threetmp2 : threetmp3;
assign fourtmp2 = (VEPs_manhattan_distance[threetmp4 +: 10'd10]<=VEPs_manhattan_distance[threetmp5 +: 10'd10]) ? threetmp4 : threetmp5;
assign fourtmp3 = (VEPs_manhattan_distance[threetmp6 +: 10'd10]<=VEPs_manhattan_distance[threetmp7 +: 10'd10]) ? threetmp6 : threetmp7;


assign fivetmp0 = (VEPs_manhattan_distance[fourtmp0 +: 10'd10]<=VEPs_manhattan_distance[fourtmp1 +: 10'd10]) ? fourtmp0 : fourtmp1;
assign fivetmp1 = (VEPs_manhattan_distance[fourtmp2 +: 10'd10]<=VEPs_manhattan_distance[fourtmp3 +: 10'd10]) ? fourtmp2 : fourtmp3;

assign sixtmp0 = (VEPs_manhattan_distance[fivetmp0 +: 10'd10]<=VEPs_manhattan_distance[fivetmp1 +: 10'd10]) ? fivetmp0 : fivetmp1;

assign finalx = sixtmp0/(10'd10);

//assign winner_x = finalx[2:0];
//assign winner_y = finalx[5:3];

assign tmp_x = finalx[2:0];
assign tmp_y = finalx[5:3];

always@(*)begin
	winner_x = tmp_x;
	winner_y = tmp_y;
end

endmodule
