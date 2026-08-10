cask "sonora" do
  version "0.7.0"
  sha256 "afe7744c90a6f62555dc7ac8fbb0f75847017bc9981269977ce212f7a5b9b613"

  url "https://github.com/nolight132/sonora/releases/download/v#{version}/sonora-v#{version}-macos.dmg"
  name "Sonora"
  desc "Minimal native Spotify client built with Rust and GPUI"
  homepage "https://github.com/nolight132/sonora"

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
