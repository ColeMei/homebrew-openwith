cask "openwith" do
  version "0.5.0"
  sha256 "b07157b04b0b34b0915be3cff03e8cf1483bf33ac1f6954e6ed2b601d4db083d"

  url "https://github.com/ColeMei/openwith/releases/download/v#{version}/OpenWith_#{version}_aarch64.dmg"
  name "OpenWith"
  desc "GUI for managing macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "OpenWith.app"

  caveats do
    <<~EOS
      OpenWith is not signed with an Apple Developer ID yet. If macOS blocks
      the first launch, either right-click OpenWith.app and choose Open, or
      clear the quarantine flag:

        xattr -dr com.apple.quarantine /Applications/OpenWith.app
    EOS
  end

  zap trash: [
    "~/Library/Application Support/openwith",
    "~/Library/WebKit/com.colemei.openwith",
    "~/Library/Caches/com.colemei.openwith",
    "~/Library/Preferences/com.colemei.openwith.plist",
    "~/Library/Saved Application State/com.colemei.openwith.savedState",
  ]
end
