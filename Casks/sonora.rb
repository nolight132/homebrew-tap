cask "sonora" do
  version "0.13.0"
  sha256 "4c640d31df3493468ed54fd292eeee5bc15913e6344a7eefb6f226f638b1fd7b"

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
