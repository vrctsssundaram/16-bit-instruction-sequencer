# Test procedure

Run `make test`; confirm `PASS` and zero exit. The ROM test checks loads, signed ADDI, ADD, taken branch, skipped instruction, peripheral OUT and HALT.

Next tests: every opcode and illegal encoding, PC wrap, zero-register writes, exhaustive signed immediate values, interrupt design, deterministic memory wait-state policy and synthesis.

`make synth` reproduces the generic Yosys RTL synthesis check.
