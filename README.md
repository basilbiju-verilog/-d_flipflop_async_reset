# — D Flip-Flop with Asynchronous Reset

A positive-edge-triggered D flip-flop with **active-high asynchronous reset**,
implemented in Verilog HDL and verified on Artix-7 FPGA.

---

## What is Asynchronous Reset?

Reset happens **instantly** the moment rst goes HIGH —
it does NOT wait for the clock edge.

```
always @(posedge clk or posedge rst) begin
    if (rst) q <= 0;    // reset immediately — no clock needed
    else     q <= d;    // normal capture on clock edge
end
```

---

## Truth Table

| CLK Edge | RST | D | Q (next)  |
|----------|-----|---|-----------|
| Any time |  1  | X |     0     |  <- Reset INSTANTLY
| Rising   |  0  | 0 |     0     |  <- Capture D
| Rising   |  0  | 1 |     1     |  <- Capture D
| No edge  |  0  | X | No change |  <- Holds value

---

## Files

| File | Description |
|------|-------------|
| ` d_flipflop_async_reset.v` | RTL source — synthesizable |
| `d_flipflop_async_reset_tb.v` | Self-checking testbench |
| `d_flipflop_async_reset .xdc` | Constraints for Cmod A7-35T |

---

## Waveform

```
CLK  →  _/‾\_/‾\_/‾\_/‾\_/‾\
RST  →  0   0  1← instant!  0
D    →  0   1   1   0   1
─────────────────────────────
Q    →  0   1   0←now! 0   1
              ^Q goes 0 immediately
               without waiting for clock
```

---
<img width="1074" height="578" alt="Screenshot 2026-09-18 115631" src="https://github.com/user-attachments/assets/2906ef82-f7d9-4fc1-bc6e-fd83ad36d28f" />
<img width="904" height="357" alt="Screenshot 2026-09-18 115654" src="https://github.com/user-attachments/assets/5ee2ba4c-332e-48ce-904d-3dec1f181e08" />


## Synchronous vs Asynchronous — Key Difference

| Feature | Synchronous | Asynchronous  |
|---------|-------------------|---------------------|
| Reset timing | Only on clock edge | Instantly |
| Sensitivity list | `@(posedge clk)` | `@(posedge clk or posedge rst)` |
| FPGA usage | Preferred in most designs | Used for power-on init |
| Timing analysis | Easier | More complex |
| Risk | Safer | Can cause glitches |

---

## Board

- **Device:** Digilent Cmod A7-35T (Artix-7 XC7A35T)
- **Tool:** Xilinx Vivado 2024
- **I/O:** LVCMOS33
