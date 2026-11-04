# Verification record

Date: 04 November 2026
Source revision tested: `7d7d57ac6cf95a64b75e9bb4bf85fa91ae688b8c`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-9/actions/runs/41871271560

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | load, add, signed immediate, branch, peripheral output and halt |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
