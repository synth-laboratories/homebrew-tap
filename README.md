# Synth Laboratories Homebrew Tap

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

- `synth-ai` depends on the forked `opencode` formula from this tap.
- `opencode` installs its JavaScript dependencies on first run with Bun (from `oven-sh/bun/bun`).
- `synth-ai` installs Python dependencies on first run with `uv` into `~/.synth-ai/venv`.
