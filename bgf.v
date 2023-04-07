module bgf(
	input clk,
  input rst,
  input dir,
  input inc,
  input dec,
  output reg pin1,
  output  reg pin2,
  output reg led_inc,
  output reg led_dec,
   output  square_wave
);

reg [23:0] counter =0;
reg toggle=1;
reg [23:0] store = 15000;

always @(posedge clk) begin
   counter <= counter + 1;
   if (counter == store) begin
	 toggle <= ~toggle;
      counter <= 0;
		if(inc == 1)
		begin
//		store <= store + 2000;
		if(store == 29000)
		begin
		led_dec <= 1;
		store <= 15000;
		end
		else
		begin
		store <= store + 2000;
		led_dec <= 0;
		end
		end
		else
		begin
		store <= store;
		end

		if (dec == 1)
		begin
		store <= store - 2000;
		if (store == 9000)
		begin
		store <= 15000;
		led_inc <= 1;
		end
		else
		begin
		store <= store - 2000;
		led_inc <= 0;
		end
	end
		else
		begin
		store <= store;
	end
	
		
		  end
	 end
  always @(rst, dir)
    begin
        if(dir==1)
          begin
            pin2<=0;
            if (square_wave ==1)
              pin1<=1;
            else
              pin1<=0;
          end
      if(rst==1)
        begin
          pin1<=0;
          if(square_wave ==1)
            pin2<=1;
          else
            pin1<=0;
        end
    end
      
      
assign  square_wave = toggle;

endmodule
