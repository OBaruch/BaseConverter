# Project Context

This document records what can and cannot be established about the origin of
BaseConverter. Each statement is labelled with its evidence level:

- **Confirmed**: directly supported by files, code or git history.
- **Inferred**: reasonably deduced from the repository, but not stated anywhere.
- **Unknown**: cannot be determined from the repository.

## Inventory of the original repository

Before the reorganization, the repository contained exactly two files:

| File | Type | Role |
|---|---|---|
| `CambioDeBase.m` | GNU Octave source (ASCII, CRLF line endings, 23 lines) | The entire implementation |
| `LICENSE` | MIT License text, "Copyright (c) 2021 Baruch Lopez" | Licensing |

There were **no** PDFs, Word or PowerPoint documents, images, diagrams,
datasets, notebooks, generated outputs, configuration files or README. As a
result, the context below comes only from the code, the license and the git
metadata.

## Git history

| Commit | Date | Author | Message |
|---|---|---|---|
| `06a4716` | 2021-02-20 20:19 (UTC-6) | Baruch Lopez | Initial commit (added `LICENSE`) |
| `2f78f1a` | 2021-02-20 20:20 (UTC-6) | Baruch Lopez | Add files via upload (added `CambioDeBase.m`) |

"Add files via upload" is the default message of the GitHub web uploader.
This suggests the file was written elsewhere and uploaded afterwards
(**Inferred**), so it may be older than February 2021 (**Unknown**).

## Findings

| Question | Answer | Level |
|---|---|---|
| What does it do? | Converts a decimal number (integer and fractional part) into digits of another base and prints them | Confirmed |
| Language / runtime | GNU Octave (`endwhile`, `endfor`, `endfunction` are Octave-only syntax) | Confirmed |
| Author | Baruch Lopez | Confirmed |
| Language of identifiers | Spanish (`CambioDeBase` = "change of base", `cociente` = quotient, `residuo` = remainder, `fraccionaria` = fractional, `arregloe`/`arreglof` = "array" for *enteros* / *fraccionarios*) | Confirmed (naming) / Inferred (the `e`/`f` suffix meanings) |
| Relation to `dec2base` | A trailing comment `%dec2base(numero,base)` refers to the built-in integer-only converter, probably as a reference or as a discarded alternative | Inferred |
| Project category | **Unknown** | Unknown |
| University, course, assignment | No evidence | Unknown |
| Intended precision (15 fractional digits) | Hard-coded; no reason documented | Unknown |

## Project origin: Unknown

The repository does not provide enough information to determine whether this
was coursework, a personal exercise or an experiment.

For reference only (not a conclusion): converting integer parts by successive
division and fractional parts by successive multiplication is a standard topic
in introductory numerical-methods, digital-systems and computer-architecture
courses. Octave is also often used in university settings as a free
alternative to MATLAB. Both facts make an academic origin **plausible**, but
**it cannot be confirmed** from the repository.

## Scope of the original project

- **In scope** *(Confirmed from code)*: non-negative real inputs, any integer
  base ≥ 2, 15 fractional digits, console output.
- **Out of scope / not handled** *(Confirmed from code)*: negative numbers,
  input validation, letter digits for bases above 10, returning the result as a
  value, conversion *to* decimal, and conversion between two non-decimal bases.

## Historical information preserved

- `src/CambioDeBase.m` is byte-identical to the uploaded file
  (sha256 `01adb1d8a2bea05e4258ed56a8b144cd628fdeb7fb7dac541e4a11681c3c0d36`).
- `LICENSE` is unchanged.
- The original git history is kept intact. The reorganization was added as new
  commits on top of it.
