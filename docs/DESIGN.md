# Technical design

One instruction executes on each active clock edge. Register zero reads as zero and ignores writes. The 16-bit instruction field map is opcode [15:12], destination [11:8], source/port [7:4] and immediate nibble [3:0]. Branch and jump target a full eight-bit absolute instruction address in [7:0].

The control sequencer uses combinational instruction ROM access, a 16-register file, direct I/O and deterministic illegal-opcode halt behavior.

Illegal opcodes halt the deterministic control-sequence engine without register or I/O side effects.
