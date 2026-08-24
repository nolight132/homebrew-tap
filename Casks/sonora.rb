cask "sonora" do
  version "0.17.0"
  sha256 "d0e7d33e9ae8c5d5c938b9f0434c99102de043385350dc9125ccf0ef1d7c5db2"

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
