module MUL #(parameter WIDTH = 2)(a, b, prod);
	input [WIDTH-1:0] a, b;
	output reg [WIDTH-1:0] prod; 
	
	always @(a, b) begin
		prod <= a * b;
	end
endmodule

// MUL needs to be tested