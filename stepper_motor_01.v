

module hfds(   input clk,  input rst,  input dir,
  input inc,
  input dec,  output reg pin1,  output  reg pin2,   output  square_wave); reg [24:0] counter =0;reg toggle=1;
reg [24:0] store = 10000;always @(posedge clk) begin   counter <= counter + 1;
	store <= store + 500;   if (counter == store) begin
	      toggle <= ~toggle;      counter <= 0;
//if(store==1200000)
//begin
//		store <= 0;
//		end   endend  always @(rst, dir)    begin        if(dir==1)          begin            pin2<=0;            if (square_wave ==1)              pin1<=1;            else              pin1<=0;          end      if(rst==1)        begin          pin1<=0;          if(square_wave ==1)            pin2<=1;          else            pin1<=0;        end    end            assign  square_wave = toggle;endmodule
