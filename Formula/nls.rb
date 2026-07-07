class Nls < Formula
  desc "Nushell-style ls for bash, zsh, and fish"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "5b50169336aa1867e36c7bc10b96a05f311d0a713573aba523a1701255468d13"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/nolight132/nls/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"nls"), "./cmd/nls"
  end

  test do
    output = shell_output("#{bin}/nls --json")
    assert_match '"name"', output
  end
end
