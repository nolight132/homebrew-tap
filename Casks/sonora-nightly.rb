cask "sonora-nightly" do
  version "0.50.3-nightly.20261128"
  sha256 "115f0d8a7b960ae1d864a1fb2df18ce3b2e54e8f73eaa098ba141255965c620e"

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
