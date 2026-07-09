class Nls < Formula
  desc "A modern ls with useful tables"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "9e37d960d6180474a05d47206fc67406fef9b8bd6e6d735ec918ddc857873bd4"
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
