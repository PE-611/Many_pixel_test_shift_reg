///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : FLEXLAB													//
// Description : Test system (shift_reg/driver)			  	//
// Start design : 18.07.2022 										//
// Last revision : 25.07.2022 									//
///////////////////////////////////////////////////////////

module main (input clk_in, start_button, reset,

				 output reg out_clk_positive, out_clk_negative,
				 
				 output reg Hold, Reset, D_out);

parameter divider_clk = 1000;
parameter quantity_clk = 3;
parameter nonoverlaped_time = divider_clk / 3;

reg [7:0] state;	
reg [7:0] next_state;
//reg [7:0] state_cnt;
		  
localparam IDLE 							= 8'd0;
localparam START							= 8'd1;
localparam D_enable						= 8'd2;
localparam START_GENERATE				= 8'd3;
localparam REVERSE_CLK					= 8'd4;
localparam STOP							= 8'd5;
		  
reg process_flg;

reg [32:0] cnt;

reg [12:0] cnt_quantity_clk;		

		  
		  
initial begin
	
	Hold = 1'b0;
	Reset = 1'b0;
	D_out = 1'b0;
	out_clk_positive <= 1'b0;
	out_clk_negative <= 1'b0;
	
	state <= 1'b0;	
	next_state <= 1'b0;
	
	process_flg <= 1'b0;
	
	cnt <= 1'b0;
	cnt_quantity_clk <= 1'b0;	
	
	
end		


			
always @* 	
		
		case (state)
			
			IDLE:
						
				
				if (start_button == 1'b0) begin
					next_state <= START;
				end
				
				else begin
					next_state <= IDLE;
				end
				
				
			START:	
			
				if (state == START) begin
					next_state <= D_enable;
				end
				
				else begin
					next_state <= START;
				end
				
			D_enable:	
			
				if (cnt == divider_clk) begin
					next_state <= START_GENERATE;
				end
				
				else begin
					next_state <= D_enable;
				end
						
				
			START_GENERATE:
			
				if (cnt == divider_clk) begin
					next_state <= REVERSE_CLK;
				end
				
				else begin
					next_state <= START_GENERATE;
				end
				
				
			REVERSE_CLK:
			
				if (cnt == divider_clk && cnt_quantity_clk < quantity_clk) begin
					next_state <= START_GENERATE;
				end
				
				else if (cnt == divider_clk && cnt_quantity_clk == quantity_clk) begin
					next_state <= STOP;
				end
				
				else begin
					next_state <= REVERSE_CLK;
				end
				
			
			STOP:

				if (state == STOP) begin
					next_state <= START;
				end
				
				else begin
					next_state <= STOP;
				end
		
				
				
			default:
				next_state <= IDLE;
		
		endcase
		
		
always @(posedge clk_in) begin

	if (state == IDLE) begin
		D_out = 1'b0;
		out_clk_positive <= 1'b0;
		out_clk_negative <= 1'b0;

		process_flg <= 1'b0;
	
		cnt <= 1'b0;
	end
	
	if (state == START) begin
		process_flg <= 1'b1;
		D_out <= 1'b0;
		out_clk_positive <= 1'b0;
	end
	
	if (state == D_enable) begin
		D_out <= 1'b1;
	end
	
	if (state == START_GENERATE) begin
		out_clk_positive <= 1'b1;
	end
	
	
	if (state == REVERSE_CLK) begin
		out_clk_positive <= 1'b0;
		D_out <= 1'b0;
	end
	
	
	if (state == STOP) begin
		out_clk_negative <= 1'b0;
		out_clk_positive <= 1'b0;
		D_out <= 1'b0;
		process_flg <= 1'b0;
	end
	
	
	if (state == REVERSE_CLK && cnt == nonoverlaped_time) begin
		out_clk_negative <= 1'b1;
	end
	
	if (state == REVERSE_CLK && cnt > divider_clk - nonoverlaped_time) begin
		out_clk_negative <= 1'b0;
	end
	
	
	if (out_clk_positive == 1'b1) begin
		out_clk_negative <= 1'b0;
	end
	
	
	if (process_flg == 1'b1) begin
		cnt <= cnt + 1'b1;
	end
	
	
	if (cnt == divider_clk) begin
		cnt <= 1'b0;
	end
	
	
		
end	

always @(posedge out_clk_positive or negedge process_flg) begin		

	
	if (!process_flg) begin														
		cnt_quantity_clk <= 1'b0;
	end
	
	else begin
		cnt_quantity_clk <= cnt_quantity_clk + 1'b1;
	end
	

end



always @(posedge clk_in or negedge reset) begin 
	
	
	if(!reset) begin
		state <= IDLE;
	end
	
	else begin
		state <= next_state;
	end
end		

	
	
endmodule


//data_out <=  {data_out[7:0], Rx_in}; shift reg