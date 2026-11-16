cask "sonora-nightly" do
  version "0.50.0-nightly.20261116"
  sha256 "fc2efb4a9c7f974a19fe63e5d9d4d9129ac3e1a7ad8990fcd8b2954496c838de"

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
