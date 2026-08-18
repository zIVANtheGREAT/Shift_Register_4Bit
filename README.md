# Shift_Register_4Bit
# Serial-In Parallel-Out (SIPO) Shift Register — Verilog

A 4-bit Serial-In Parallel-Out shift register implemented in Verilog, with an asynchronous active-low reset. Data shifts in one bit per clock cycle, MSB-first, and after 4 clock cycles the full parallel word is available on `Dout`.

## How it works

Each rising edge of `clk` shifts `Din` into bit 3 of the register while the existing bits shift right by one:

```
Dout <= {Din, Dout[3:1]};
```

After 4 clock cycles, the first bit received ends up at `Dout[0]` and the most recently received bit is at `Dout[3]`.

## Module Interface

| Signal  | Direction | Width | Description                          |
|---------|-----------|-------|---------------------------------------|
| `Dout`  | output    | [3:0] | Parallel output register              |
| `Din`   | input     | 1     | Serial data input                     |
| `clk`   | input     | 1     | Clock                                 |
| `rst_n` | input     | 1     | Asynchronous active-low reset         |

## Reset Behavior

`rst_n` is asserted low to asynchronously clear `Dout` to `4'b0000`. This was fixed during development — the original reset branch mistakenly held the current value (`Dout <= Dout`) instead of clearing it, which made the reset a no-op. The corrected logic properly clears the register on reset:

```verilog
always @ (posedge clk or negedge rst_n)
begin
    if (!rst_n)
        Dout <= 4'b0000;
    else
        Dout <= {Din, Dout[3:1]};
end
```

## Files

- `SR4.v` — SIPO shift register module
- `SR4_tb.v` — testbench (update filename to match yours)

## Simulation

Simulated in Vivado. Waveform below shows `Dout` shifting in a test pattern over 4 clock cycles:

<img width="648" height="273" alt="image" src="https://github.com/user-attachments/assets/74da0c17-f10b-4136-854d-6177568e8a8d" />


## Notes

Built as a hands-on exercise in bare-metal digital logic design and debugging — part of an ongoing set of small Verilog/FPGA projects.
