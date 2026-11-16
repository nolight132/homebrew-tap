cask "sonora" do
  version "0.50.1"
  sha256 "5849797f5b1b6519ca015d8f3dc32da1786b507ca948f2a9633f9e9b4e5dbe60"

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
