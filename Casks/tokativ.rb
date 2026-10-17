cask "tokativ" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "5bb94320a5ad7315fbb847cee8044242d604d4b3dc42ecbb434e7147394265e7",
         intel: "ebfe7b8c0d535019808b1080ac7adef2607e2c4a8fa9c6827012ae49bd66be68"

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
