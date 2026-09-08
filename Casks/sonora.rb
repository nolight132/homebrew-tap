cask "sonora" do
  version "0.32.0"
  sha256 "e8c023eaae78ef20e6773a89232b9f5b3bb28626ea023e79e9f9c921c9dd9d0f"

  url "https://github.com/sonorahq/sonora/releases/download/v#{version}/sonora-v#{version}-macos.dmg"
  name "Sonora"
  desc "Native music streaming client, built with Rust and GPUI"
  homepage "https://github.com/sonorahq/sonora"

  depends_on macos: ">= :big_sur"

  app "Sonora.app"

  caveats <<~EOS
    Sonora is signed ad-hoc rather than notarized, so Gatekeeper refuses to open it
    until the quarantine attribute is cleared. Run this once after installing:

      xattr -dr com.apple.quarantine "#{appdir}/Sonora.app"

  EOS

  zap trash: [
    "~/Library/Application Support/sonora",
    "~/Library/Caches/sonora",
  ]
end
