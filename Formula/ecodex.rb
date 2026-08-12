# Homebrew formula for ecodex — PREBUILT BINARY (no compile, no Rust toolchain).
#
# This is the authoritative source; `scripts/sync-homebrew.sh <version>` fills
# the per-platform SHA-256 values from the GitHub Release artifacts and copies
# this file into the EmpiricaAI/homebrew-tap repo (Formula/ecodex.rb).
#
# The __SHA256_*__ tokens are placeholders replaced by the sync script. Do not
# hand-edit them — re-run the sync script after a release.
class Ecodex < Formula
  desc "Empirica-native fork of OpenAI Codex — calibrated agentic coding CLI"
  homepage "https://github.com/EmpiricaAI/ecodex"
  version "0.147.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/EmpiricaAI/ecodex/releases/download/v#{version}/ecodex-aarch64-apple-darwin.tar.gz"
      sha256 "059bffaae1179d1f42e2186f6ccd68fa8588c315093f0434a06dcfc201d40e23"
    end
    on_intel do
      url "https://github.com/EmpiricaAI/ecodex/releases/download/v#{version}/ecodex-x86_64-apple-darwin.tar.gz"
      sha256 "260e05317e1b3ebea39c76ef0a92baf343eeb9652544d182cf47365f44e3ac4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/EmpiricaAI/ecodex/releases/download/v#{version}/ecodex-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e8447a3716635a35a6ee10d4631f40385cce4096d8d59d13949e4701f57ee84"
    end
    on_intel do
      url "https://github.com/EmpiricaAI/ecodex/releases/download/v#{version}/ecodex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "578be5d4ab58a96cc58bb5d5247db670624365b2712d941e1e69c04fee9fe008"
    end
  end

  def install
    # Tarball contains the three binaries at its root.
    bin.install "ecodex", "codex-empirica-plugin", "codex-empirica-translator"
  end

  def caveats
    <<~EOS
      ecodex's epistemic plugin needs the empirica CLI on PATH:
        https://github.com/EmpiricaAI/empirica
      Chat providers (Mistral/Devstral, etc.) route through the translator:
        run `codex-empirica-translator` before launching ecodex.
    EOS
  end

  test do
    assert_match "codex-cli", shell_output("#{bin}/ecodex --version")
  end
end
