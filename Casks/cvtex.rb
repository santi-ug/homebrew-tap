cask "cvtex" do
  version "0.1.0"
  sha256 "4d60168360c118d1c468ac9caaf1a7bd4e6f82f08a3c93323c15f3ffa18c44ed"

  url "https://github.com/santi-ug/CvTeX/releases/download/v#{version}/CvTeX-#{version}.zip"
  name "CvTeX"
  desc "Tailors a LaTeX resume to a job posting and keeps it to one page"
  homepage "https://github.com/santi-ug/CvTeX"

  # Matches LSMinimumSystemVersion. macOS 15 is Sequoia; the symbol form means "at least".
  depends_on macos: :sequoia

  app "cvtex.app"

  uninstall quit: "co.santiu.cvtex"

  zap trash: [
    "~/Library/Application Support/cvtex",
    "~/Library/Preferences/co.santiu.cvtex.plist",
    "~/Library/Saved Application State/co.santiu.cvtex.savedState",
  ]

  caveats <<~EOS
    CvTeX is ad-hoc signed, not notarized. The first launch of every build
    gets a "cannot verify" dialog; allow it once under System Settings >
    Privacy & Security > Open Anyway, or clear the flag yourself:

      xattr -dr com.apple.quarantine /Applications/cvtex.app

    Compiling needs nothing else: Tectonic ships inside the app. Rewriting
    needs a Claude account, either Claude Code (brew install --cask
    claude-code) or an API key.
  EOS
end
