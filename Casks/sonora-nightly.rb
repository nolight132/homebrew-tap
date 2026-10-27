cask "sonora-nightly" do
  version "0.44.2-nightly.20261026"
  sha256 "25425dd4e222bd129b0084b53daa7f9d58bb92bd9b26257da24ed49fefe868a2"

  url "https://github.com/sonorahq/sonora/releases/download/nightly/sonora-nightly-macos.dmg",
      verified: "github.com/sonorahq/sonora/"
  name "Sonora Nightly"
  desc "Nightly build of the Sonora music streaming client"
  homepage "https://github.com/sonorahq/sonora"

  conflicts_with cask: "sonora"
  depends_on macos: :big_sur

  app "Sonora.app"

  zap trash: [
    "~/Library/Application Support/sonora",
    "~/Library/Caches/sonora",
  ]

  caveats <<~EOS
    Sonora is signed ad-hoc rather than notarized, so Gatekeeper refuses to open it
    until the quarantine attribute is cleared. Run this once after installing:

      xattr -dr com.apple.quarantine "#{appdir}/Sonora.app"

    The sonorahq/sonora nightly workflow updates this cask after every nightly build.
  EOS
end
