cask "sonora-nightly" do
  version "0.50.3-nightly.20261127"
  sha256 "c9bd98f2aefc3f8a2fa6cef9f5fd87f60d0a396ef3d2f1b621e495d553392ecc"

  url "https://github.com/sonorahq/sonora/releases/download/nightly-build/sonora-nightly-macos.dmg"
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
