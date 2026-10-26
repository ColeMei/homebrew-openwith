cask "openwith-gui" do
  version "0.7.0"
  sha256 "7262bbefa23553755d2129e8ddbb40bd38b86c3f8af0749a0218d4579df84899"

  url "https://github.com/ColeMei/openwith/releases/download/v#{version}/OpenWith_#{version}_aarch64.dmg"
  name "OpenWith"
  desc "GUI for managing file extension associations"
  homepage "https://github.com/ColeMei/openwith"

  # From v0.7.0 the app updates itself in place ("Update to X…", signature-
  # checked), so `brew upgrade` leaves it alone unless asked by name or with
  # --greedy, rather than fighting the in-app updater.
  auto_updates true
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

    Updates install from inside the app: when a new release is out, choose
    "Update to X…" (Settings, the menu-bar panel or the notice). Each update
    is checked against OpenWith's signing key before it replaces the app.
    `brew upgrade --cask openwith-gui` still works too.
  EOS
end
