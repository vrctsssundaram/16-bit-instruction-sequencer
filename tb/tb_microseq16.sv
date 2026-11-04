module tb_microseq16;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0;
    reg [15:0] rom [0:255];
    wire [7:0] pc;
    wire [3:0] io_addr;
    wire [15:0] io_data, r1;
    wire io_write, halted;
    reg [15:0] observed_output=0;
    integer write_count=0,i;
    wire [15:0] instr = rom[pc];
    microseq16 dut(.clk(clk),.rst_n(rst_n),.instr(instr),.instr_addr(pc),
        .io_addr(io_addr),.io_rdata(16'hbeef),.io_wdata(io_data),
        .io_write(io_write),.halted(halted),.debug_r1(r1));
    always @(negedge clk) if (rst_n && io_write) begin
        if (io_addr != 2 || io_data != 16'd9) $fatal(1,"Peripheral write error");
        observed_output = io_data;
        write_count = write_count + 1;
    end
    initial begin
        for (i=0;i<256;i=i+1) rom[i]=16'h0000;
        rom[0]=16'h1105; // LDI8 r1,5
        rom[1]=16'h1203; // LDI8 r2,3
        rom[2]=16'h2120; // ADD r1,r2
        rom[3]=16'h4108; // ADDI4 r1,-8 -> zero
        rom[4]=16'h5106; // BZ r1,6
        rom[5]=16'h11ff; // Must not execute
        rom[6]=16'h1309; // LDI8 r3,9
        rom[7]=16'h7320; // OUT r3, port2
        rom[8]=16'hf000; // HALT
        #22; rst_n=1;
        wait (halted);
        repeat(2) @(posedge clk);
        if (pc!=8 || r1!=0 || write_count!=1 || observed_output!=9)
            $fatal(1,"Microsequencer PC/register/branch/output error");
        $display("PASS: load, add, signed immediate, branch, peripheral output and halt");
        $finish;
    end
    initial begin #10000;$fatal(1,"Watchdog timeout");end
endmodule
