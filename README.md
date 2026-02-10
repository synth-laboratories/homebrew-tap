# Synth Laboratories Homebrew Tap

## Install

### Horizons

Self-hostable agent platform — serve, orchestrate, and optimize AI agents.

```bash
brew install synth-laboratories/tap/horizons
```

Or with an explicit tap:

```bash
brew tap synth-laboratories/tap
brew install horizons
```

After installing, start the server:

```bash
horizons --help
```

> **Note:** Currently available for macOS (Apple Silicon and Intel). Linux support coming soon.

### Synth AI (TUI)

```bash
brew install synth-laboratories/tap/synth-ai
```

Or with an explicit tap:

```bash
brew tap synth-laboratories/tap
brew install synth-ai
```

## Formulas

| Formula | Description |
|---------|-------------|
| `horizons` | Horizons agent platform server (v0.1.2) |
| `synth-ai` | Synth AI terminal interface |
| `synth-tui` | Synth TUI |
| `opencode-synth` | OpenCode (Synth fork) |

## Notes

- `horizons` is a single static binary — no runtime dependencies.
- `synth-ai` depends on the forked `opencode-synth` formula from this tap.
- `opencode-synth` installs its JavaScript dependencies on first run with Bun (from `oven-sh/bun/bun`).
- `synth-ai` installs Python dependencies on first run with `uv` into `~/.synth-ai/venv`.
