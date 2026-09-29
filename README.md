# BaseConverter

A small GNU Octave function, `CambioDeBase` ("change of base"), that converts a
non-negative decimal number, including its fractional part, into its digits in
another numeric base.

> **Original implementation.** This repository preserves the original
> implementation of the project. The source code has intentionally not been
> refactored or modernized in order to retain the historical context and
> original development approach.

## Project Overview

The whole project is one function, [`src/CambioDeBase.m`](src/CambioDeBase.m)
(23 lines). It takes a decimal number and a target base. Then it:

1. converts the **integer part** by repeated division by the base and collects
   the remainders;
2. converts the **fractional part** by repeated multiplication by the base and
   collects the integer parts, always for 15 iterations;
3. prints the result to the console as `[integer digits].[fractional digits]`.

```text
>> CambioDeBase(10.625, 2)
conversion = [1 0 1 0].[1 0 1 0 0 0 0 0 0 0 0 0 0 0 0]
```

## Project Context

| Item | Value | Evidence level |
|---|---|---|
| Project origin | **Unknown** | The repository has no assignment, report or description that says where it came from. |
| Author | Baruch Lopez | Confirmed: `LICENSE` and commit history |
| Date | February 2021 (upload date) | Confirmed: commit history. The code could be older. |
| Language / runtime | GNU Octave | Confirmed: Octave-only keywords (`endwhile`, `endfor`, `endfunction`). |
| Natural language of the code | Spanish | Confirmed: identifiers such as `numero`, `cociente`, `residuo`, `fraccionaria` |
| Purpose | Decimal → base-*b* conversion of real numbers | Confirmed: code behaviour |

The successive-division and successive-multiplication method is a standard
exercise in introductory numerical-methods and computer-architecture courses.
That makes a coursework origin plausible, but **the repository does not give
enough information to confirm it**. See [docs/project-context.md](docs/project-context.md).

## Problem Statement

Convert a real number from base 10 to an arbitrary base *b* and show both the
integer digits and a fixed number of fractional digits. Octave's built-in
`dec2base` only handles non-negative integers. A trailing comment in the source
(`%dec2base(numero,base)`) suggests that the author compared against it or
thought about using it. *(Inferred.)*

## Objective

Implement by hand the classic algorithm for converting integer and fractional
parts to another base, instead of relying on the built-in integer-only
conversion. *(Inferred from the code.)*

## Repository Structure

```text
BaseConverter/
├── README.md                  ← this file
├── LICENSE                    ← MIT License (original, 2021)
├── AGENTS.md                  ← contribution guardrails (keep src/ untouched)
├── .gitignore
├── src/
│   └── CambioDeBase.m         ← original implementation (unchanged)
└── docs/
    ├── project-context.md     ← origin, evidence, historical information
    ├── code-overview.md       ← line-by-line walkthrough and observed behaviour
    ├── possible-improvements.md ← known issues, deliberately NOT applied
    └── sdlc/
        ├── intent.md          ← why the project and this restructuring exist
        ├── spec.md            ← as-is functional specification
        └── plan.md            ← restructuring plan and status
```

No `data/`, `assets/` or `examples/` folders were created because the original
repository contained no datasets, images or example files.

## Original Implementation

The source code represents the original implementation. It was only moved from
the repository root to `src/`. Its bytes are identical, including Windows
(CRLF) line endings, the missing final newline, variable names, comments and
known defects:

```text
sha256  01adb1d8a2bea05e4258ed56a8b144cd628fdeb7fb7dac541e4a11681c3c0d36  src/CambioDeBase.m
```

Defects and possible improvements are documented separately in
[docs/possible-improvements.md](docs/possible-improvements.md). None of them
were applied.

## Technologies

- **GNU Octave**. The code uses Octave-specific block terminators, so it will
  not parse in MATLAB without changes.
- Built-in functions used: `floor`, `mod`, `fliplr`, `mat2str`, `strcat`.

No external packages, toolboxes or dependencies.

## How It Works

```text
numero ──┬─► integer loop (while cociente > 0)
         │     residuo = floor(mod(numero1, base))
         │     numero1 = floor(numero1 / base)
         │     → arregloe (remainders, least significant first) → fliplr
         │
         └─► fractional loop (15 fixed iterations)
               producto = floor(fraccionaria * base)
               → arreglof (digits, most significant first)

mat2str(integer digits) + '.' + mat2str(fractional digits) → printed as `conversion`
```

See [docs/code-overview.md](docs/code-overview.md) for the full walkthrough.

## Inputs and Outputs

| | Description |
|---|---|
| Input `numero` | A decimal number. Designed for non-negative values. |
| Input `base` | Target base (integer ≥ 2 expected; not validated) |
| Output | Printed to the console as `conversion = ...`. Digits are shown as decimal numbers inside brackets, so base 16 shows `[15 15]` rather than `FF`. |
| Declared return value `r` | Never assigned. Asking for a return value (`x = CambioDeBase(...)`) raises `error: 'r' undefined`. |

## Running the Project

Verified during the reorganization with **GNU Octave 8.4.0**. The original
Octave version is unknown.

```bash
cd src
octave --no-gui --eval "CambioDeBase(10.625, 2)"
```

Or from an interactive Octave session started inside `src/`:

```octave
CambioDeBase(255, 16)
% conversion = [15 15].[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Call the function **without** assigning its result, as shown above. Assigning
it (`x = CambioDeBase(...)`) prints the conversion and then fails, because the
output variable `r` is never set.

## Documentation

- [Project context](docs/project-context.md)
- [Code overview](docs/code-overview.md)
- [Possible improvements (not applied)](docs/possible-improvements.md)
- [Intent](docs/sdlc/intent.md) · [Specification](docs/sdlc/spec.md) · [Plan](docs/sdlc/plan.md)
- [Contribution guardrails](AGENTS.md)

## Historical Note

This repository was later reorganized and documented to improve readability
and preserve the historical context of the original project. The original
source code remains unchanged.

## License

[MIT](LICENSE) © 2021 Baruch Lopez
