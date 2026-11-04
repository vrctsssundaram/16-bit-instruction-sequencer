# Verification record

Date: 05 November 2026
Source revision tested: `cb2b3c259c9901d4e212ad24921b7ec151e3e789`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-9/actions/runs/41902472759
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-9/actions/runs/41902472801

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | load, add, signed immediate, branch, peripheral output and halt |
| Generic Yosys synthesis | **PASS**; 1,905 technology-independent cells |
| Device-specific FPGA/ASIC utilization | **Not measured** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.

The generic cell count is obtained from the cited Yosys `stat` output and is not an FPGA LUT estimate, ASIC area, or a timing result.
