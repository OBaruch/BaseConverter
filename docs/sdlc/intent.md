# Intent

> Part of the spec-driven workflow for this repository:
> **intent** (why) → [spec](spec.md) (what) → [plan](plan.md) (how).
> These documents were written **after the fact** and reconstruct intent from
> the existing repository. They do not describe new development.

## 1. Original project intent (reconstructed)

| | Statement | Evidence |
|---|---|---|
| Problem | Represent a real decimal number in another base, including its fractional part | Confirmed: code |
| Motivation | Octave's `dec2base` only handles non-negative integers. The author implemented the full integer + fractional algorithm by hand | Inferred: trailing `%dec2base(numero,base)` comment |
| Approach | Successive division for the integer part, successive multiplication for the fractional part | Confirmed: code |
| Audience | The author, running the function interactively in Octave | Inferred: result is printed, not returned |
| Origin | Unknown. A coursework origin is plausible but unconfirmed | See [project-context.md](../project-context.md) |

## 2. Intent of the repository restructuring

**Modernize the repository, not the project.**

Goals:

1. Make the project understandable without reading the source first.
2. Present it as a clear historical entry in a technical portfolio.
3. Keep the original implementation **byte-for-byte unchanged**.
4. Separate verified facts, inferences and unknowns in every document.
5. Record known defects without fixing them.

Non-goals:

- Fixing, optimizing, reformatting or porting the code.
- Adding build tooling, CI/CD, containers, package managers, linters or test
  frameworks.
- Inventing an academic or business context that the repository does not
  support.
- Creating folders (`data/`, `assets/`, `examples/`) for content that does not
  exist.

## 3. Success criteria

- `src/CambioDeBase.m` keeps sha256
  `01adb1d8a2bea05e4258ed56a8b144cd628fdeb7fb7dac541e4a11681c3c0d36`.
- `LICENSE` and the original git history are unchanged.
- A reader can learn what the project does, how to run it and what its
  limitations are from `README.md` alone.
- Every behavioural claim in the docs can be reproduced with the unchanged
  code in GNU Octave.
