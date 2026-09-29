# Possible Improvements

> **None of the items below have been applied.** They are documented only for
> reference. The source code in [`src/`](../src/) is deliberately kept as the
> original implementation to preserve its historical context.

Each item was checked by running the unchanged code with GNU Octave 8.4.0 (see
[code-overview.md](code-overview.md#observed-behaviour)).

## Correctness

| # | Issue | Effect | Possible change |
|---|---|---|---|
| 1 | Output `r` is declared but never assigned | `x = CambioDeBase(...)` fails with `'r' undefined` | Assign `r = conversion;` and terminate line 21 with `;` |
| 2 | Negative inputs are not handled | The `while` loop never runs, so the integer part is lost; `floor` on a negative number also distorts the fraction (`-3.5` → `[].[1 0 …]`) | Convert `abs(numero)` and prefix `-` |
| 3 | Zero integer part prints `[]` | `CambioDeBase(0, 2)` → `[].[0 …]` | Emit `0` when `arregloe` is empty |
| 4 | No validation of `base` | `base < 2` or non-integer bases give meaningless results, and `base = 1` never ends the integer loop | Validate `base` as an integer ≥ 2 |
| 5 | Floating-point drift in the fractional loop | Inputs that are not exact binary fractions accumulate rounding error over 15 iterations | Document the limitation, or use exact/rational arithmetic |

## Usability

| # | Issue | Possible change |
|---|---|---|
| 6 | Digits rendered with `mat2str` (`[1 0 1 0]`, `[15 15]`) instead of a numeral string (`1010`, `FF`) | Map digits to `0-9A-Z`, as `dec2base` does |
| 7 | `mat2str` output format depends on digit count (`5` vs `[1 0]`) | Build the string directly |
| 8 | Fixed 15 fractional digits; trailing zeros always printed | Add an optional precision argument and stop when the fraction reaches 0 |
| 9 | Result is only printed, never returned | Return the string (see #1) |

## Portability and style

| # | Issue | Possible change |
|---|---|---|
| 10 | `endwhile` / `endfor` / `endfunction` are Octave-only | Use `end` for MATLAB compatibility |
| 11 | Inconsistent indentation, whitespace-only lines, CRLF endings, no final newline | Normalize formatting |
| 12 | No help text / header comment | Add an Octave help block describing arguments and output |
| 13 | Arrays grown inside loops (`[arregloe, residuo]`) | Irrelevant at this size, but could be preallocated |
| 14 | Unused `cociente = numero1` seed only exists to enter the loop | Use `numero1 > 0` directly as the loop condition |

## Testing

There are no tests. A future modernized version (kept separate from the
original, for example in a new folder or repository) could include a small
test script that compares integer results with the built-in `dec2base`.
