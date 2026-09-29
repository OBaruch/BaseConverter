# Plan

> [intent](intent.md) → [spec](spec.md) → **plan**
>
> Execution plan for the repository restructuring. Status reflects the
> current state of the branch.

## Phase 1: Discovery ✅

- [x] Inventory all files (`CambioDeBase.m`, `LICENSE`, git history).
- [x] Look for PDFs, Word, slides, images, datasets and outputs. **None exist.**
- [x] Identify the runtime from syntax (GNU Octave).
- [x] Record the original sha256 of the source file.
- [x] Run the unchanged function in GNU Octave 8.4.0 across normal and edge
      inputs to confirm behaviour.
- [x] Classify the project origin → **Unknown** (not enough evidence).

## Phase 2: Restructure ✅

- [x] Move `CambioDeBase.m` → `src/CambioDeBase.m` with `git mv` (content
      untouched, history preserved).
- [x] Keep `LICENSE` at the root.
- [x] Add a minimal `.gitignore` for Octave/editor artifacts.
- [x] Do **not** create `data/`, `assets/`, `examples/` or `archive/`
      (nothing to put in them).
- [x] Do **not** add `.gitattributes`, so the original CRLF bytes are never
      renormalized.

## Phase 3: Documentation ✅

- [x] `README.md`: overview, context, structure, how it works, I/O, running,
      historical note.
- [x] `docs/project-context.md`: evidence-labelled origin analysis.
- [x] `docs/code-overview.md`: walkthrough and observed behaviour table.
- [x] `docs/possible-improvements.md`: defects and ideas, explicitly not
      applied.
- [x] `docs/sdlc/intent.md`, `spec.md`, `plan.md`: spec-driven records.
- [x] `AGENTS.md`: guardrails for future human or automated contributors.
- [x] Skip `architecture.md` (one function; no real architecture) and
      `assignment.md` (no evidence of an assignment).

## Phase 4: Verification ✅

- [x] `sha256sum src/CambioDeBase.m` matches
      `01adb1d8a2bea05e4258ed56a8b144cd628fdeb7fb7dac541e4a11681c3c0d36`.
- [x] `git diff main --stat -M` shows the source only as a 100 % rename.
- [x] Relative links between Markdown files resolve.
- [x] The commands in the README run as documented.

## Phase 5: Delivery

- [x] Commit on a dedicated branch.
- [x] Open a pull request against `main` for review.

## Out of scope (future, separate work)

If a modernized version is ever wanted, build it **next to** the original
(new folder or repository), driven by a new intent/spec/plan, and use
[possible-improvements.md](../possible-improvements.md) as input.
`src/CambioDeBase.m` must remain the historical reference.
