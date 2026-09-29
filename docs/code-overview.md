# Code Overview

This document explains [`src/CambioDeBase.m`](../src/CambioDeBase.m) without
modifying it. It is the only source file in the project.

## Signature

```octave
function r = CambioDeBase(numero, base)
```

| Parameter | Meaning |
|---|---|
| `numero` | Decimal number to convert ("número"). May have a fractional part. |
| `base` | Target base |
| `r` | Declared output, **never assigned** (see [Observed behaviour](#observed-behaviour)) |

## Variables

| Name | Meaning (Spanish → English) | Role |
|---|---|---|
| `numero1` | number 1 | Working copy for the integer loop |
| `numero2` | number 2 | Working copy for the fractional loop |
| `cociente` | quotient | Loop condition of the integer conversion |
| `residuo` | remainder | One integer-part digit |
| `arregloe` | array (*enteros*, integers) | Integer digits, least significant first |
| `fraccionaria` | fractional | Current fractional part |
| `producto` | product | One fractional-part digit |
| `arreglof` | array (*fraccionarios*, fractions) | Fractional digits, most significant first |
| `enteros` | integers | String form of the integer digits |
| `fraccionarios` | fractional ones | String form of the fractional digits |
| `conversion` | conversion | Final printed string |

## Execution flow

### 1. Initialization (line 4–5)

`numero` is copied into two working variables, one per loop, and the digit
arrays start empty. `cociente` is seeded with the input so the `while` loop
runs at least once for positive input.

### 2. Integer part: successive division (lines 7–12)

```text
while cociente > 0:
    residuo  = floor(mod(numero1, base))   # current least-significant digit
    cociente = floor(numero1 / base)
    numero1  = cociente
    append residuo to arregloe
```

The `floor` around `mod` removes the fractional part on the first iteration,
when `numero1` is still the full real number. Digits come out least
significant first and are reversed later with `fliplr`.

### 3. Fractional part: successive multiplication (lines 13–18)

```text
repeat 15 times:
    fraccionaria = numero2 - floor(numero2)
    producto     = floor(fraccionaria * base)     # next fractional digit
    numero2      = fraccionaria * base - producto
    append producto to arreglof
```

The loop always runs **exactly 15 times**. It does not stop early when the
fraction becomes zero, so exact conversions are padded with zeros.

### 4. Formatting (lines 19–21)

```octave
enteros       = mat2str(fliplr(arregloe));
fraccionarios = mat2str(arreglof);
conversion    = strcat(enteros, '.', fraccionarios)   % no semicolon → printed
```

`mat2str` renders a numeric vector as Octave literal syntax: `[1 0 1 0]` for
several digits, a bare `5` for a single digit, and `[]` when empty. Every digit
is written as a decimal number, so base-16 digit 15 appears as `15`, not `F`.
The missing semicolon on line 21 is how the result reaches the user.

### 5. Trailing comment (line 23)

`%dec2base(numero,base)` comes after `endfunction` and does nothing. It refers to
Octave's built-in integer-only base converter.

## Observed behaviour

These results were produced during the reorganization by running the unchanged
file with **GNU Octave 8.4.0**. They are not historical outputs from the
original author.

| Call | Printed output | Notes |
|---|---|---|
| `CambioDeBase(10, 2)` | `conversion = [1 0 1 0].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` | Correct; padded fraction |
| `CambioDeBase(10.625, 2)` | `conversion = [1 0 1 0].[1 0 1 0 0 0 0 0 0 0 0 0 0 0 0]` | Correct (1010.101₂) |
| `CambioDeBase(0.1, 2)` | `conversion = 0.[0 0 0 1 1 0 0 1 1 0 0 1 1 0 0]` | Correct repeating expansion, truncated at 15 digits |
| `CambioDeBase(255, 16)` | `conversion = [15 15].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` | Digits are 15,15 (= FF₁₆) |
| `CambioDeBase(5, 8)` | `conversion = 5.[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` | Single digit printed without brackets |
| `CambioDeBase(0, 2)` | `conversion = [].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` | Zero integer part prints as `[]` |
| `CambioDeBase(-3.5, 2)` | `conversion = [].[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]` | Negative input not supported: integer part lost |
| `x = CambioDeBase(10, 2)` | prints the conversion, then `error: 'r' undefined` | The declared output `r` is never assigned |
| `dec2base(10, 2)` (built-in, for comparison) | `ans = 1010` | Integer-only reference |

## Dependencies

Only Octave core functions: `floor`, `mod`, `fliplr`, `mat2str`, `strcat`.
No packages, toolboxes, files or I/O.

## File-level notes

- Line endings are CRLF and the file has no final newline. Both are preserved
  as uploaded.
- Indentation is inconsistent (mix of 2, 4 and 6 spaces, plus whitespace-only
  lines). Also preserved.
