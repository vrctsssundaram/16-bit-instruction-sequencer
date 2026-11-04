module microseq16 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] instr,
    output reg  [7:0]  instr_addr,
    output wire [3:0]  io_addr,
    input  wire [15:0] io_rdata,
    output reg  [15:0] io_wdata,
    output reg         io_write,
    output reg         halted,
    output wire [15:0] debug_r1
);
    reg [15:0] regs [0:15];
    wire [3:0] opcode = instr[15:12];
    wire [3:0] rd = instr[11:8];
    wire [3:0] rs = instr[7:4];
    wire signed [15:0] signimm4 = {{12{instr[3]}},instr[3:0]};
    reg [3:0] io_port_reg;
    integer i;
    assign io_addr = io_write ? io_port_reg : rs;
    assign debug_r1 = regs[1];
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            instr_addr <= 0;
            io_wdata <= 0;
            io_write <= 0;
            io_port_reg <= 0;
            halted <= 0;
            for (i=0; i<16; i=i+1) regs[i] <= 0;
        end else begin
            io_write <= 0;
            if (!halted) begin
                instr_addr <= instr_addr + 1'b1;
                case (opcode)
                    4'h0: ; // NOP
                    4'h1: if (rd!=0) regs[rd] <= {8'd0,instr[7:0]}; // LDI8
                    4'h2: if (rd!=0) regs[rd] <= regs[rd] + regs[rs]; // ADD
                    4'h3: if (rd!=0) regs[rd] <= regs[rd] ^ regs[rs]; // XOR
                    4'h4: if (rd!=0) regs[rd] <= regs[rd] + signimm4; // ADDI4
                    4'h5: if (regs[rd]==0) instr_addr <= instr[7:0]; // BZ
                    4'h6: instr_addr <= instr[7:0]; // JMP
                    4'h7: begin // OUT: port address in RS
                        io_port_reg <= rs;
                        io_wdata <= regs[rd];
                        io_write <= 1;
                    end
                    4'h8: if (rd!=0) regs[rd] <= io_rdata; // IN
                    4'hf: begin
                        halted <= 1;
                        instr_addr <= instr_addr;
                    end
                    default: begin
                        halted <= 1; // Illegal opcode traps to halt.
                        instr_addr <= instr_addr;
                    end
                endcase
            end
        end
    end
endmodule
