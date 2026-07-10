cask "openwith" do
  version "0.5.1"
  sha256 "741f3f0267bb78d84d56a218946e04e896118486e5d54401e47b19bad126a8c6"

  url "https://github.com/ColeMei/openwith/releases/download/v#{version}/OpenWith_#{version}_aarch64.dmg"
  name "OpenWith"
  desc "GUI for managing file extension associations"
  homepage "https://github.com/ColeMei/openwith"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "OpenWith.app"

  zap trash: [
    "~/Library/Application Support/openwith",
    "~/Library/Caches/com.colemei.openwith",
    "~/Library/Preferences/com.colemei.openwith.plist",
    "~/Library/Saved Application State/com.colemei.openwith.savedState",
    "~/Library/WebKit/com.colemei.openwith",
  ]

  caveats <<~EOS
    OpenWith is not signed with an Apple Developer ID yet. If macOS blocks
    the first launch, either right-click OpenWith.app and choose Open, or
    clear the quarantine flag:

      xattr -dr com.apple.quarantine /Applications/OpenWith.app
  EOS
end
