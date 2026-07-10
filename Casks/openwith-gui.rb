cask "openwith-gui" do
  version "0.5.3"
  sha256 "fee29c66fc7950dfca3eb589a50692e5c043d02014d4f35bff92015d6ab93c53"

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
