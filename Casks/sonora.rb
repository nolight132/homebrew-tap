cask "sonora" do
  version "0.50.3"
  sha256 "65f2b470421dc462b75052680440b7391d9eceb8022f5ed8ea095a45c8f5d0a2"

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
