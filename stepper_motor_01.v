

module hfds(
  input inc,
  input dec,
reg [24:0] store = 10000;
	store <= store + 500;
	
//if(store==1200000)
//begin
//		store <= 0;
//		end