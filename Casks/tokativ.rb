cask "tokativ" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.1"
  sha256 arm:   "4d949c1f47060f87b55722afbb08157351b75d6c125d8f7a2532f34dd6d06720",
         intel: "6a1cfae47f97b3707cd26611a5c13e28f235e76f1e89e44da23d31fddbcc19eb"

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
