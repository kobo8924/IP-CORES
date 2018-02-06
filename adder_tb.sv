/* adder_tb.sv */
`timescale 1ps/1ps
module adder_tb;

parameter STEP = 10;

reg [3:0] a_i, b_i;
wire [3:0] o;

/* 暗黙のポート宣言によるモジュール呼び出し */
adder adder_1(.*);

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, adder_1);

    #STEP;
    a_i <= 4'b0000;
    b_i <= 4'b0000;
    #STEP;
    display();
    a_i <= 4'b0000;
    b_i <= 4'b0001;
    #STEP;
    display();
    a_i <= 4'b0001;
    b_i <= 4'b0000;
    #STEP;
    display();
    a_i <= 4'b0001;
    b_i <= 4'b0001;
    #STEP;
    display();
    $finish;
end

//タスク
task display;
    begin
	$display("a:%b b:%b s:%b", a_i, b_i, o);
    end
endtask

endmodule
