cask "openwith-gui" do
  version "0.6.3"
  sha256 "4b8776e833f5aae30f7afe5fc13c216713ad987982aeb33ce30567b20e935be8"

  url "https://github.com/ColeMei/openwith/releases/download/v#{version}/OpenWith_#{version}_aarch64.dmg"
  name "OpenWith"
  desc "GUI for managing file extension associations"
  homepage "https://github.com/ColeMei/openwith"

  depends_on arch: :arm64
  depends_on :macos

  app "OpenWith.app"

  zap trash: [
    "~/Library/Application Support/com.colemei.openwith",
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
