class Nls < Formula
  desc "Nushell-style ls for bash, zsh, and fish"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "afccfe25da79ef4b219618983c0deaf3d09d6b36d0cc24f04c4e0dd95ab15cc3"
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
