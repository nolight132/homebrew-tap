cask "tokativ" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "41b58e8fe5eb18ca1cb60ec952990543f3641381854072ce36f95642647c2675",
         intel: "d650be664c7a1ce974e2b04b2b1145d22c7a4a2bddcbbf9bf0b1bff7716a4704"

  url "https://github.com/nolight132/tokativ/releases/download/v#{version}/tokativ-v#{version}-#{arch}-apple-darwin.app.tar.gz"
  name "Tokativ"
  desc "Local dictation"
  homepage "https://github.com/nolight132/tokativ"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Tokativ.app"
  binary "#{appdir}/Tokativ.app/Contents/MacOS/tokativ"

  uninstall launchctl: "tokativ",
            quit:      "io.github.nolight132.tokativ"

  zap trash: [
    "~/Library/Application Support/tokativ",
    "~/Library/Caches/tokativ",
    "~/Library/LaunchAgents/tokativ.plist",
  ]

  caveats <<~EOS
    Tokativ is signed ad-hoc rather than notarized. If macOS blocks it, run:

      xattr -dr com.apple.quarantine "#{appdir}/Tokativ.app"
  EOS
end
