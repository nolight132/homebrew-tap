cask "sonora" do
  version "0.20.0"
  sha256 "6394270e6d8585540d3dc43567c89c2432a0133c5efaac75e59a61e4de50f58b"

  url "https://github.com/nolight132/sonora/releases/download/v#{version}/sonora-v#{version}-macos.dmg"
  name "Sonora"
  desc "Native music streaming client, built with Rust and GPUI"
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
