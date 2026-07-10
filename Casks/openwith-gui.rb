cask "openwith-gui" do
  version "0.5.2"
  sha256 "a40481b35531bb6bc447a055c7e4c3347c8172aa3d1f0c05c371eddb012e09f5"

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
