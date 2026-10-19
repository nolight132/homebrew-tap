cask "tokativ" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "8fb71a04ed92e9f297cbc8d41d244be4d790e87c6284d8f51d6022c95e935def",
         intel: "27dae134c102ef05052c28e8e60457fcad6e370199e72606bf04ae4237f7b87f"

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
