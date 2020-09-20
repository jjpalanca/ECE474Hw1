module REG #(parameter WIDTH = 2)(Clk, Rst, d, q);
	input Clk, Rst;
	input [WIDTH-1:0] d;
	output reg [WIDTH-1:0] q; 
	
	always @(posedge Clk) begin
		if(Rst) begin
			q <= 0;
		end
		else begin
			q <= d;
		end
	end
endmodule

// REG needs to be tested