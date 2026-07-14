cask "openwith-gui" do
  version "0.5.4"
  sha256 "3fc9917d0d83702f355e3481ed22844b01181431d84c6a0e7fd9e8985d5fc1ac"

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
    OpenWith is not signed with an Apple Developer ID yet, so on first launch
    macOS may claim the app "is damaged and can't be opened". It isn't; that
    is Gatekeeper's message for unsigned apps (right-click > Open does not
    bypass it). Clear the quarantine flag once and it launches normally:

      xattr -dr com.apple.quarantine /Applications/OpenWith.app

    Or install with the quarantine flag disabled:

      brew reinstall --cask --no-quarantine ColeMei/openwith/openwith-gui
  EOS
end
