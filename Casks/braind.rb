# Homebrew cask for BrAIn.D. Lives in the tap repo github.com/pt-23/homebrew-tap
# as Casks/braind.rb, so users install with:
#
#   brew install --cask pt-23/tap/braind
#
# This copy is the source of truth; see publish/RELEASING.md for how to
# bump version + sha256 and push it to the tap after each release.
cask "braind" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1"
  sha256 arm:   "26cbe3756bcf1a4d66e2c32cce4a619d826a28fea61b230b478e0cacdbee931f",
         intel: "c21ca1e137a92189d06af0470f6df122df5cb206d8cd4a25c6d22348052915d2"

  # pt-23/braind-releases, not the source repo: the zips have to be
  # downloadable with no credentials, and the source repo is private.
  url "https://github.com/pt-23/braind-releases/releases/download/v#{version}/BrAIn.D-mac-#{arch}.zip"
  name "BrAIn.D"
  desc "Mind map where every node is a resumable AI agent session"
  homepage "https://braindub.vercel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "tmux"
  # The status hook that drives the live pulse and the waiting-for-input
  # badge runs as `node <hook>.cjs` (src/main/providers/claude.ts), so
  # node is a real runtime dependency, not just a nicety.
  depends_on formula: "node"
  # Plain `:macos` only. A minimum version (`macos: ">= :catalina"`) is
  # disabled in Homebrew 7 with no replacement — the app bundle's own
  # LSMinimumSystemVersion is what keeps it off a too-old macOS.
  depends_on :macos

  app "BrAIn.D.app"
  binary "#{appdir}/BrAIn.D.app/Contents/Resources/cli/braind"

  # Not notarized yet: without this, Gatekeeper refuses the first launch.
  # postflight_steps, not a `postflight do` block — Homebrew deprecated
  # arbitrary Ruby there in favour of these declarative steps, where
  # appdir is a {{template token}} rather than a Ruby method.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/BrAIn.D.app"]
  end

  # Maps live in each project's .braind folder and are never touched.
  zap trash: [
    "~/.ai-mind",
    "~/Library/Application Support/BrAIn.D",
  ]

  caveats <<~EOS
    BrAIn.D runs your agent CLI inside tmux. Install one if you haven't:
      Claude Code (recommended): https://docs.claude.com/en/docs/claude-code

    Then, in any project folder:
      braind
  EOS
end
