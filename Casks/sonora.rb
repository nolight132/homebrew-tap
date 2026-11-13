cask "sonora" do
  version "0.49.1"
  sha256 "39d44b55d6ee6056d968e1a98bc8684841e6459eb67d3bd8a5387fe008cb5485"

  url "https://github.com/sonorahq/sonora/releases/download/v#{version}/sonora-v#{version}-macos.dmg"
  name "Sonora"
  desc "A native, familiar music streaming client"
  homepage "https://github.com/sonorahq/sonora"

  conflicts_with cask: "sonora-nightly"
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

  EOS
end
