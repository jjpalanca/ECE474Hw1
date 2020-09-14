module SHL#(parameter WIDTH = 2)(a, sh_amt, d);
	
	input [WIDTH-1:0] a, sh_amt;
    output reg [WIDTH-1:0] d;

    always @(a, sh_amt) begin
		d <= a<<sh_amt;
    end

endmodule

// SHL needs to be tested