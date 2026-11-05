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

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
