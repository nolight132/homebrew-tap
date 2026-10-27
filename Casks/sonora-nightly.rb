cask "sonora-nightly" do
  version "0.44.2-nightly.20261027"
  sha256 "d0b946a5f68fa7b81015ec1027c82d4a7a3fce79f5880b754ace2724db6aa74a"

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
