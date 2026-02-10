class Horizons < Formula
  desc "Self-hostable agent platform — serve, orchestrate, and optimize AI agents"
  homepage "https://github.com/synth-laboratories/Horizons"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/synth-laboratories/Horizons/releases/download/v#{version}/horizons-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "240282cd5d1e4945a0fc412fb69a1023ee0ac14f7a4537f864388f6bc41e01a7"
    end

    on_intel do
      url "https://github.com/synth-laboratories/Horizons/releases/download/v#{version}/horizons-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c3beef349c19cf6576841202e9f545243327ff64defeb398b60a3344bf2e70bd"
    end
  end

  # Linux support coming soon — uncomment once release artifacts are available.
  # on_linux do
  #   on_arm do
  #     url "https://github.com/synth-laboratories/Horizons/releases/download/v#{version}/horizons-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
  #     sha256 "PLACEHOLDER_AARCH64_LINUX"
  #   end
  #
  #   on_intel do
  #     url "https://github.com/synth-laboratories/Horizons/releases/download/v#{version}/horizons-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
  #     sha256 "a6c761341659e2e0d93871d13769747908c6290f40f609e7fbdd0d991d024f97"
  #   end
  # end

  def install
    bin.install "horizons"
  end

  test do
    assert_match "horizons", shell_output("#{bin}/horizons --version 2>&1", 0)
  end
end
