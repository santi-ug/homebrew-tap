cask "cvtex" do
  version "0.1.0"
  sha256 "23c566966f553cabf826d577567f58b537d1ba14bb07066711c12b4d95b552ac"

  url "https://github.com/santi-ug/cvtex-releases/releases/download/v#{version}/CvTeX-#{version}.zip"
  name "CvTeX"
  desc "Tailors a LaTeX resume to a job posting and keeps it to one page"
  homepage "https://github.com/santi-ug/cvtex-releases"

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
    Compiling needs nothing else: Tectonic ships inside the app. Rewriting
    needs a Claude account, either Claude Code (brew install --cask
    claude-code) or an API key.
  EOS
end
