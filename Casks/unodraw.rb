# Homebrew cask for unoDraw (the desktop app; source in pt-23/unodraw, desktop/). Install with:
#
#   brew install --cask pt-23/tap/unodraw
#
# The .dmgs are assets of this tap's own releases (tag unodraw-v<version>), since the source repo
# is private and a cask's url must download without credentials. To release: pnpm desktop:build in
# the source repo, attach both .dmgs to a new unodraw-v<version> release here, then bump version
# and both sha256s below.
cask "unodraw" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "6196f593e7efcc5320a8674c6fb3b57a43bfdd8ddd7cf8a8510ea775023598fe",
         intel: "dcbcca08c8475ae148224baa07c43082f8fbba9a9c0afccea368da9a56064e47"

  url "https://github.com/pt-23/homebrew-tap/releases/download/unodraw-v#{version}/unoDraw-#{version}-#{arch}.dmg"
  name "unoDraw"
  desc "Architecture diagrams drawn from your model and your code"
  homepage "https://unoarch.vercel.app/"

  # This tap's releases carry more than one app: only unodraw-v* tags count.
  livecheck do
    url "https://github.com/pt-23/homebrew-tap/releases"
    regex(/unodraw-v?(\d+(?:\.\d+)+)/i)
    strategy :github_releases
  end

  depends_on :macos

  app "unoDraw.app"

  # Not signed or notarized yet: without this, Gatekeeper refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/unoDraw.app"]
  end

  zap trash: [
    "~/Library/Application Support/unoDraw",
    "~/Library/Preferences/com.unodraw.desktop.plist",
    "~/Library/Saved Application State/com.unodraw.desktop.savedState",
  ]

  caveats <<~EOS
    unoDraw opens https://unoarch.vercel.app by default; pick another server in
    unoDraw › Server (for example this Mac's localhost:3000).

    To draw a repository's diagrams from the terminal, install the CLI:
      curl -fsSL https://unoarch.vercel.app/install.sh | sh
  EOS
end
