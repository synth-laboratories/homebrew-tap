class SynthTui < Formula
  desc "Synth TUI - Terminal interface for Synth AI"
  homepage "https://github.com/synth-laboratories/synth-tui"
  url "https://github.com/synth-laboratories/synth-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "680a514f3ba60f28ce2097becb78c6aa919895cab335ee457d17c672cd173ae5"
  version "0.1.0"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install "app" => "app"
    libexec.install "opencode_config" => "opencode_config"

    (bin/"synth-tui").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      ROOT="#{libexec}/app"
      BUN="#{Formula["oven-sh/bun/bun"].opt_bin}/bun"
      if [ ! -d "$ROOT/node_modules" ]; then
        echo "Installing TUI dependencies..." >&2
        (cd "$ROOT" && "$BUN" install)
      fi
      TS_CONFIG="$ROOT/tsconfig.json"
      exec "$BUN" --preload @opentui/solid/preload --tsconfig-override "$TS_CONFIG" "$ROOT/src/index.ts" "$@"
    EOS
  end

  def caveats
    <<~EOS
      The first run installs JavaScript dependencies into:
        #{libexec}/app/node_modules
    EOS
  end

  test do
    assert_predicate bin/"synth-tui", :exist?
  end
end
