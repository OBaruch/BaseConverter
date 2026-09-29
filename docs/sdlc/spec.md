# Specification (as-is)

> [intent](intent.md) → **spec** → [plan](plan.md)
>
> This is a **descriptive** specification. It documents how the original code
> actually behaves, reverse-engineered and verified with GNU Octave 8.4.0. It
> is not a set of requirements for new work. Where the behaviour is surprising,
> the spec records it as it is. Defects are listed in
> [possible-improvements.md](../possible-improvements.md).

## 1. Part A: `CambioDeBase` function

### 1.1 Interface

```octave
function r = CambioDeBase(numero, base)
```

| ID | Requirement | Status |
|---|---|---|
| F-01 | Accepts a numeric `numero` and a numeric `base` | Confirmed |
| F-02 | Declares output `r` but never assigns it | Confirmed |
| F-03 | Produces its result by printing `conversion = <string>` to the console | Confirmed |

### 1.2 Integer part

| ID | Behaviour | Status |
|---|---|---|
| F-10 | While `cociente > 0`, appends `floor(mod(numero1, base))` and sets `numero1 = floor(numero1 / base)` | Confirmed |
| F-11 | Digits are collected least significant first and reversed with `fliplr` | Confirmed |
| F-12 | If `numero ≤ 0`, the loop does not run and the integer part is empty (`[]`) | Confirmed |
| F-13 | For `numero` in `(0, 1)`, one iteration runs and yields digit `0` | Confirmed |

### 1.3 Fractional part

| ID | Behaviour | Status |
|---|---|---|
| F-20 | Exactly 15 iterations, with no early termination | Confirmed |
| F-21 | Each iteration takes `fraccionaria = numero2 - floor(numero2)`, emits `floor(fraccionaria * base)` and keeps the remainder | Confirmed |
| F-22 | Digits are collected most significant first | Confirmed |
| F-23 | For negative input, `floor` produces the complement fraction (for example `-3.5` → `0.5`) | Confirmed |

### 1.4 Output format

| ID | Behaviour | Status |
|---|---|---|
| F-30 | Output is `strcat(mat2str(intDigits), '.', mat2str(fracDigits))` | Confirmed |
| F-31 | A multi-digit part is shown as `[d1 d2 ...]`; a single digit without brackets; an empty part as `[]` | Confirmed |
| F-32 | Digits are decimal integers. There is no letter mapping for bases above 10 | Confirmed |

### 1.5 Acceptance examples

| Given | Then prints |
|---|---|
| `CambioDeBase(10.625, 2)` | `conversion = [1 0 1 0].[1 0 1 0 0 0 0 0 0 0 0 0 0 0 0]` |
| `CambioDeBase(0.1, 2)` | `conversion = 0.[0 0 0 1 1 0 0 1 1 0 0 1 1 0 0]` |
| `CambioDeBase(255, 16)` | `conversion = [15 15].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` |
| `CambioDeBase(5, 8)` | `conversion = 5.[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` |
| `CambioDeBase(0, 2)` | `conversion = [].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` |
| `x = CambioDeBase(10, 2)` | Prints the conversion, then `error: 'r' undefined` |

### 1.6 Constraints and unknowns

- Runtime: GNU Octave (Octave-only block terminators). Original Octave
  version: **Unknown**.
- No input validation. `base = 1` never terminates for `numero ≥ 1`
  (inferred from the algorithm, not executed).
- Reason for 15 fractional digits: **Unknown**.

## 2. Part B: repository layout

| ID | Requirement |
|---|---|
| R-01 | Source lives in `src/` and is byte-identical to the original upload |
| R-02 | `LICENSE` stays at the root, unchanged |
| R-03 | `README.md` covers overview, context, structure, how it works, I/O, running, docs and historical note |
| R-04 | Supporting docs live in `docs/`; spec-driven docs live in `docs/sdlc/` |
| R-05 | Every doc labels claims as Confirmed / Inferred / Unknown where relevant |
| R-06 | Improvements are documented only in `docs/possible-improvements.md` and never applied |
| R-07 | No tooling or infrastructure that the original project did not have |
| R-08 | `AGENTS.md` records the preservation rules for future contributors |
