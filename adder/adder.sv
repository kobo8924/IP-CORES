/*adder.sv*/
module adder(input [3:0] a_i, b_i,
       output [3:0] o);


assign o = a_i + b_i;

endmodule
