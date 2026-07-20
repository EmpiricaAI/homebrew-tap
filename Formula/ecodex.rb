class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/EmpiricaAI/ecodex"
  url "https://github.com/EmpiricaAI/ecodex/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "90fd09493a3b2bcb52cc66fbbd84083fc243ef058ce8305bbbdb80438e1fecdd"
  license "Apache-2.0"
  head "https://github.com/EmpiricaAI/ecodex.git", branch: "build/v1-plugin"

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
