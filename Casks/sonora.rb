cask "sonora" do
  version "0.50.2"
  sha256 "dd54d39df75126ed2a69366eba5cef96b631aefa4febcb8cc671343470e7357b"

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
