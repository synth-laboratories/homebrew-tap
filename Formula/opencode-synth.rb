class OpencodeSynth < Formula
  desc "OpenCode CLI (Synth fork)"
  homepage "https://github.com/synth-laboratories/opencode"
  url "https://github.com/synth-laboratories/opencode/archive/947b864d96cbdeb4206920f1a7ed29305602dbc8.tar.gz"
  sha256 "48410cf0116bea198e3d117d38950ed5bc0780a7d4a07418c1d24aea52a36db9"
  version "1.1.6"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    (bin/"opencode-synth").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      ROOT="#{libexec}"
      BUN="#{Formula["oven-sh/bun/bun"].opt_bin}/bun"
      if [ ! -d "$ROOT/node_modules" ]; then
        (cd "$ROOT" && HUSKY=0 "$BUN" install)
      fi
      TS_CONFIG="$ROOT/packages/opencode/tsconfig.json"
      exec "$BUN" --preload @opentui/solid/preload --tsconfig-override "$TS_CONFIG" "$ROOT/packages/opencode/src/index.ts" "$@"
    EOS
  end

  def caveats
    <<~EOS
      The first run installs JavaScript dependencies into:
        #{libexec}/node_modules
    EOS
  end

  test do
    system "#{bin}/opencode-synth", "--version"
  end
end
