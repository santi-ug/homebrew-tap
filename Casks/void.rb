cask "void" do
  version "1.2.1"
  sha256 "d4c7cbcba4db16af582e013bc8850a72dae8ad35ec5f7d062ef2edd7d6ebc369"

  url "https://github.com/santi-ug/void/releases/download/v#{version}/void-#{version}.dmg"
  name "void"
  desc "Blanks the display and locks the keyboard for screen cleaning"
  homepage "https://github.com/santi-ug/void"

  # Matches the project's deployment target. macOS 26 is Tahoe.
  depends_on macos: :tahoe

  app "void.app"

  # void holds a system-wide event tap while enabled. Quitting it before the
  # bundle is replaced keeps an upgrade from leaving a stale tap behind.
  uninstall quit: "santi-ug.void"

  zap trash: [
    "~/Library/Caches/santi-ug.void",
    "~/Library/HTTPStorages/santi-ug.void",
    "~/Library/Preferences/santi-ug.void.plist",
    "~/Library/Saved Application State/santi-ug.void.savedState",
  ]

  caveats <<~EOS
    void needs Accessibility access to block keyboard input:

      System Settings → Privacy & Security → Accessibility → add void

    Releases starting with 1.2.1 are Developer ID signed and notarized.
    Keep quarantine enabled; no Open Anyway exception is needed.

    When upgrading from an older ad-hoc build, you may need to remove void
    from Accessibility and add it back once.
  EOS
end
