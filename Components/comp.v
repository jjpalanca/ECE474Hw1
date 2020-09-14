module COMP #(parameter WIDTH = 2)(a, b, gt, lt, eq);
	input [WIDTH-1:0] a, b;
	output reg gt, lt, eq; 
	
	always @(a, b) begin
		if(a > b)
			lt <= 0;
			gt <= 1;
			eq <= 0;
		end
		else if(a < b)
			lt <= 1;
			gt <= 0;
			eq <= 0;
		end
		else
			lt <= 0;
			gt <= 0;
			eq <= 1;
		end
	end
end module

// COMP needs to be tested