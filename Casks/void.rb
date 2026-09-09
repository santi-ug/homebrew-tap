# frozen_string_literal: true

cask "void" do
  version "1.4.0"
  sha256 "d2198e15a736dcd3b39325b90d9aa479d067da5bf74e2ea41f20376c2b86f041"

  url "https://github.com/santi-ug/void/releases/download/v#{version}/void-#{version}.dmg"
  name "void"
  desc "Blanks the display and locks the keyboard for screen cleaning"
  homepage "https://github.com/santi-ug/void"

  livecheck do
    url :url
    strategy :github_latest
  end

  # void updates itself from GitHub releases; `brew upgrade` skips it unless --greedy.
  auto_updates true
  # Matches the project's deployment target. macOS 26 is Tahoe; the app's
  # LSMinimumSystemVersion (26.2) is enforced at launch, so this check only
  # turns a silent refusal to open into a clear install-time error.
  depends_on macos: :tahoe

  app "void.app"

  preflight_steps do
    run "/bin/sh", args: ["-c", <<~SH]
      /usr/bin/sw_vers -productVersion | /usr/bin/awk -F. '
        $1 > 26 || ($1 == 26 && $2 >= 2) { supported = 1 }
        END { if (!supported) { print "void requires macOS 26.2 or later." > "/dev/stderr"; exit 1 } }
      '
    SH
  end

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
