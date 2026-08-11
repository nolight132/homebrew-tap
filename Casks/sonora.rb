cask "sonora" do
  version "0.9.0"
  sha256 "0e18e476420b739a557a889485a0a30ae969f0ca8e9a78d298756599ac3f3fec"

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
