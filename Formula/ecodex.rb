class Ecodex < Formula
  desc "Empirica's epistemic agent environment — a fork of openai/codex with measured discipline"
  homepage "https://github.com/Nubaeon/ecodex"
  url "https://github.com/Nubaeon/ecodex/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "59bfa117cb382a5bb56e9d95c3ceeb91f18d9ac90fa39f93546e7334e67dbdab"
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
