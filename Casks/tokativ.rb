cask "tokativ" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "bb772baa2c674bb432880bdb83aa74f09f1178a69490c5383b448e797b97a09e",
         intel: "9d4d48749c190e8233309277dddc9f24bc7d2e0584fdaf78c53f5e966eb124f6"

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
