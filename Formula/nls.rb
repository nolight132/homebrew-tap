class Nls < Formula
  desc "Nushell-style ls for bash, zsh, and fish"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "dffdb3668b03eaedc8ce82fc1bc195bcd93c47a726eb8a1fda9f93638ed48e27"
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
