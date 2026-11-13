cask "sonora-nightly" do
  version "0.49.1-nightly.20261113"
  sha256 "ed7c24508be027f2d24b21d905049299a0ffdcfcfdad1495e938178dfb7ff66e"

  url "https://github.com/sonorahq/sonora/releases/download/nightly/sonora-nightly-macos.dmg"
  name "Sonora Nightly"
  desc "A native, familiar music streaming client (nightly)"
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
