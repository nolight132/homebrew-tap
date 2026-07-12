class Nls < Formula
  desc "A modern ls with useful tables"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "65af2bae064e5accff0e2a25969c56c145618fe3aa4237f77b5123a2d31a28ff"
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
