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

  version "0.2.0"
  sha256 arm:   "fbd0ca8536f879b6488101a70e7ab13a09dc2aae1851d467d0e25eec72ff8c02",
         intel: "bc3dbdee1791fb27c68cfdab72fba7dd94e61bc9ffc5bc039d877cbd42e451f6"

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
