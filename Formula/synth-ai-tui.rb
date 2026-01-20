class SynthAiTui < Formula
  desc "Synth AI TUI - Terminal interface for Synth AI"
  homepage "https://github.com/synth-laboratories/synth-ai"
  url "https://github.com/synth-laboratories/synth-ai/archive/tui-v0.1.0.tar.gz"
  sha256 "8d0438b368a24fe89310cb4961c90c940fa6f6c1d975353d5af37b819411c3f7"
  version "0.1.0"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    # Install only the tui directory
    libexec.install "tui/app" => "app"
    libexec.install "tui/opencode_config" => "opencode_config"

    (bin/"synth-ai-tui").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      ROOT="#{libexec}/app"
      BUN="#{Formula["oven-sh/bun/bun"].opt_bin}/bun"
      if [ ! -d "$ROOT/node_modules" ]; then
        echo "Installing TUI dependencies..." >&2
        (cd "$ROOT" && "$BUN" install)
      fi
      exec "$BUN" "$ROOT/src/index.ts" "$@"
    EOS
  end

  def caveats
    <<~EOS
      The first run installs JavaScript dependencies into:
        #{libexec}/app/node_modules
    EOS
  end

  test do
    # TUI requires a terminal, just check the script exists
    assert_predicate bin/"synth-ai-tui", :exist?
  end
end