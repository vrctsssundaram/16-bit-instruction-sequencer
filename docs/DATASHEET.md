# Instruction and interface summary

| Opcode | Instruction |
|---|---|
| 0 | NOP |
| 1 | LDI8 rd, imm8 |
| 2 | ADD rd, rs |
| 3 | XOR rd, rs |
| 4 | ADDI4 rd, signed imm4 |
| 5 | BZ rd, target8 |
| 6 | JMP target8 |
| 7 | OUT rd, port4 |
| 8 | IN rd, port4 |
| F | HALT |

Ports: `instr_addr[7:0]`, `instr[15:0]`, `io_addr[3:0]`, `io_rdata[15:0]`, `io_wdata[15:0]`, `io_write`, `halted`, `debug_r1`.

The I/O interface and instruction ROM are directly connected to the custom control ISA.
