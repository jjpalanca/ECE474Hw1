module MUX2x1#(parameter WIDTH = 64)(a, b, sel, d);
	input [WIDTH-1:0] a, b;
    input sel;
    output reg [WIDTH-1:0] d;

    always @(sel, a, b) begin
        if (sel == 1) begin
            d <= b;
        end 
        else begin
            d <= a;
        end
    end

endmodule

// MUX2x1 needs to be tested