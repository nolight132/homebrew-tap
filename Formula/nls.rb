class Nls < Formula
  desc "A modern ls with useful tables"
  homepage "https://github.com/nolight132/nls"
  url "https://github.com/nolight132/nls/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "0fada44662ac28191b679c2c143d5d67ccc1b75849dfecf74d2cc5fae23dc133"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/nolight132/nls/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"nls"), "./cmd/nls"

    system bin/"nls", "--completion", "bash", "--completion", "zsh", "--completion", "fish"
    bash_completion.install "completion.bash" => "nls"
    zsh_completion.install "completion.zsh" => "_nls"
    fish_completion.install "completion.fish" => "nls.fish"
  end

  test do
    output = shell_output("#{bin}/nls --json")
    assert_match '"name"', output
  end
end
