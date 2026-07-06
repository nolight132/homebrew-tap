class Nls < Formula
  desc "Nushell-style ls for bash, zsh, and fish"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "d95e0af092934a87f2e6ddb916708c35521f6137e6ee06336fe3835895b6a432"
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
