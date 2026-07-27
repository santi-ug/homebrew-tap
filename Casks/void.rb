cask "void" do
  version "1.2.0"
  sha256 "f68806c7d92d55cf5ab73b9ad88b758017bc2310a619adfb4e6f77124d2482f3"

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

    void is ad-hoc signed rather than notarized, so macOS binds that grant to
    this exact build. After every `brew upgrade --cask void` you must remove
    void from the Accessibility list and add it back, or it will silently stop
    blocking input while the toggle still reads as enabled.
  EOS
end
