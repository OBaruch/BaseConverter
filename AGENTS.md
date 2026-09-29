# Contributor Guidelines

Rules for anyone (human or automated) who changes this repository.

## Golden rule

**`src/CambioDeBase.m` is a historical artifact. Do not modify it.**

That includes logic, formatting, whitespace, CRLF line endings, the missing
final newline, names, comments and known bugs. Its sha256 must remain:

```text
01adb1d8a2bea05e4258ed56a8b144cd628fdeb7fb7dac541e4a11681c3c0d36
```

Check with `sha256sum src/CambioDeBase.m`.

## Allowed

- Improving documentation in `README.md` and `docs/`.
- Adding newly found historical material (for example original assignment
  files) under `docs/original/`, unchanged.
- Recording defects or ideas in `docs/possible-improvements.md`.

## Not allowed without an explicit new intent/spec/plan

- Editing anything in `src/`.
- Adding build systems, CI/CD, containers, package managers or linters.
- Adding `.gitattributes` or other settings that could renormalize the source's
  line endings.

## Documentation conventions

- Label claims as **Confirmed**, **Inferred** or **Unknown**.
- Never present an inference as fact, and never invent context.
- Use relative links between Markdown files.
- Behavioural claims must be reproducible with the unchanged code in GNU Octave.

## Workflow

Changes follow [intent](docs/sdlc/intent.md) → [spec](docs/sdlc/spec.md) →
[plan](docs/sdlc/plan.md). Update the plan's status when you complete work.
