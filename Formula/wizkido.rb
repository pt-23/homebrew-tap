class Wizkido < Formula
  desc "WizKidz Studio CLI: write, check and upload lesson packs"
  homepage "https://wizkido.vercel.app/studio/tokens"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.3.0.tgz"
  sha256 "8735c7ae221ee918988f4fd0dada55237e3b75891981779b6fbc48b876515b55"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
