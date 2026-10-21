# pt-23/homebrew-tap

Homebrew tap for [BrAIn.D](https://braind.vercel.app) — a mind map where every
node is a resumable AI agent session — and [unoDraw](https://unoarch.vercel.app),
architecture diagrams drawn from your model and your code.

```bash
brew install --cask pt-23/tap/braind
```

Update with `brew upgrade --cask braind`.

The cask here is the recipe; the app downloads come from
[pt-23/braind-releases](https://github.com/pt-23/braind-releases).
Bug reports go [there](https://github.com/pt-23/braind-releases/issues/new) too.

## unoDraw

```bash
brew install --cask pt-23/tap/unodraw
```

Update with `brew upgrade --cask unodraw`. The .dmgs (Apple silicon and Intel) are
attached to this repo's own `unodraw-v<version>` releases.

## wizkido

The [WizKidz](https://wizkido.vercel.app) Studio CLI: write, check and upload lesson packs, for you or your AI agent.

```bash
brew install pt-23/tap/wizkido
wizkido login
wizkido kit --install-skill
```

Update with `brew upgrade wizkido`. The formula installs the [wizkido](https://www.npmjs.com/package/wizkido) npm package.
