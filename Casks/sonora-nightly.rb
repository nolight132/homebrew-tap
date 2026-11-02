cask "sonora-nightly" do
  version "0.47.0-nightly.20261102"
  sha256 "a5782f9c3c460f4f7f5763edfa9586004949c1d757bcd6ba1a08fed3d13f5093"

  url "https://github.com/sonorahq/sonora/releases/download/nightly/sonora-nightly-macos.dmg"
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
