# 16-bit instruction sequencer

Compact custom 16-bit instruction controller with register file and basic I/O.

## Features

- Decode of load, arithmetic, branch and I/O instructions
- 16-register design with a fixed zero register
- Illegal-instruction halt behavior

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Architecture:** Custom 16-bit control sequencer with 16 registers, instruction ROM and I/O control.

Project owner: Sundaram S S.
