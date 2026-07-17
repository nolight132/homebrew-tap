class Nls < Formula
  desc "A modern ls with useful tables"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "74156789dc6d4cac278176135eef48af8f4176096e699fe0db5125df1a83c5a3"
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
