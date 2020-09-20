module ADD #(parameter WIDTH = 2)(a, b, sum);
	input [WIDTH-1:0] a, b;
	output reg [WIDTH-1:0] sum; 
	
	always @(a, b) begin
		sum <= a+b;
	end
endmodule

// ADD needs to be tested