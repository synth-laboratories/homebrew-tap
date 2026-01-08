class SynthAi < Formula
  desc "Synth AI CLI and TUI"
  homepage "https://github.com/synth-laboratories/synth-ai"
  url "https://github.com/synth-laboratories/synth-ai/archive/65c2c2540a82af5e5aa1829ced5e25b82e3907eb.tar.gz"
  sha256 "2d9e1fef531b93aa848e998c43d834b5bd014aee9f539d5838b2fd2875ddc958"
  version "0.4.7"
  license "MIT"

  depends_on "bun"
  depends_on "python@3.11"
  depends_on "uv"
  depends_on "opencode"

  def install
    libexec.install Dir["*"]
    (bin/"synth-ai").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      ROOT="#{libexec}"
      export UV_PROJECT_ENVIRONMENT="${HOME}/.synth-ai/venv"
      exec uv run --project "$ROOT" synth-ai "$@"
    EOS
  end

  def caveats
    <<~EOS
      On first run, synth-ai installs Python dependencies into:
        ~/.synth-ai/venv
    EOS
  end

  test do
    system "#{bin}/synth-ai", "--help"
  end
end
