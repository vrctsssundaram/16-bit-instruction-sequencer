# Technical design

One instruction executes on each active clock edge. Register zero reads as zero and ignores writes. The 16-bit instruction field map is opcode [15:12], destination [11:8], source/port [7:4] and immediate nibble [3:0]. Branch and jump target a full eight-bit absolute instruction address in [7:0].

The machine uses a combinationally accessible instruction ROM and one-cycle peripheral input. No instruction prefetch, pipeline, interrupt, bus timeout or memory protection exists in this revision.

Illegal opcodes halt the machine without side effects. The selected operating model is a deterministic control-sequence engine, not a general-purpose CPU.
