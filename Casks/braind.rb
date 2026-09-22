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
  homepage "https://braind.vercel.app"

  # No `depends_on macos:` — Homebrew disabled minimum-version constraints
  # (there's no replacement). The app bundle's own LSMinimumSystemVersion
  # is what stops it launching on something too old.
  depends_on formula: "tmux"

  app "BrAIn.D.app"
  binary "#{appdir}/BrAIn.D.app/Contents/Resources/cli/braind"

  # Not notarized yet: without this, Gatekeeper refuses the first launch.
  # postflight_steps, not a `postflight do` block — Homebrew deprecated
  # arbitrary Ruby there in favour of these declarative steps.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/BrAIn.D.app"]
  end

  caveats <<~EOS
    BrAIn.D runs your agent CLI inside tmux. Install one if you haven't:
      Claude Code (recommended): https://docs.claude.com/en/docs/claude-code

    Then, in any project folder:
      braind
  EOS

  # Maps live in each project's .braind folder and are never touched.
  zap trash: [
    "~/.ai-mind",
    "~/Library/Application Support/BrAIn.D",
  ]
end
