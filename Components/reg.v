module REG #(parameter WIDTH = 2)(Clk, Rst, d, q);
	input Clk, Rst;
	input [WIDTH-1:0] d;
	output reg [WIDTH-1:0] q; 
	
	always @(posedge Clk) begin
		if(Rst)
			q <= 0;
		end
		else
			q <= d;
		end
	end
end module

// REG needs to be tested