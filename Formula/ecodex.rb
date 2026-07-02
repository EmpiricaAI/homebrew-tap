class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/Nubaeon/ecodex"
  url "https://github.com/EmpiricaAI/ecodex/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "49249bc0ab354da730d35e1cf02c029ccc10204462d36e6eb6bb929ef764fc45"
  license "Apache-2.0"
  head "https://github.com/Nubaeon/ecodex.git", branch: "build/v1-plugin"

  depends_on "rust" => :build

  def install
    cd "codex-rs" do
      system "cargo", "install", *std_cargo_args(path: "cli")
    end
  end

  test do
    assert_match "ecodex", shell_output("#{bin}/ecodex --version")
  end
end
