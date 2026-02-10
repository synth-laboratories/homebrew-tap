# Synth Laboratories Homebrew Tap

## SDLC Usage (Internal Changes)

When changing formulas as part of private repo release flow, run SDLC checks from `../synth-bazel` first:

```bash
cd ../synth-bazel
./scripts/ci_dev_gate.sh --skip-integration
```

## Install

One command:

```bash
brew install synth-laboratories/tap/synth-ai
```

Or with an explicit tap:

```bash
brew tap synth-laboratories/tap
brew install synth-ai
```

## Notes

- `synth-ai` depends on the forked `opencode-synth` formula from this tap.
- `opencode-synth` installs its JavaScript dependencies on first run with Bun (from `oven-sh/bun/bun`).
- `synth-ai` installs Python dependencies on first run with `uv` into `~/.synth-ai/venv`.
