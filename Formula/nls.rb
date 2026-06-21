class Nls < Formula
  desc "Nushell-style ls for bash, zsh, and fish"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f020c16d101df06ae415b97d8b90f4c48d4fd9d6cccd1b36b6e90d6c4d198991"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"nls"), "./cmd/nls"
  end

  test do
    output = shell_output("#{bin}/nls --json")
    assert_match '"name"', output
  end
end
