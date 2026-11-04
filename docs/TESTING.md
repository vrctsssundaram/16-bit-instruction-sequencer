# Test procedure

Run `make test`; confirm `PASS` and zero exit. The ROM test checks loads, signed ADDI, ADD, taken branch, skipped instruction, peripheral OUT and HALT.

Next tests: every opcode and illegal encoding, PC wrap, zero-register writes, exhaustive signed immediate values, interrupt design, deterministic memory wait-state policy and synthesis.

Run `make synth` with Yosys installed to reproduce the generic RTL synthesis check. Hardware placement, timing and power remain separate.
