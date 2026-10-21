class Wizkido < Formula
  desc "WizKidz Studio CLI: write, check and upload lesson packs"
  homepage "https://wizkido.vercel.app/studio/tokens"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.1.0.tgz"
  sha256 "aa1400941e8aad71d69dcc3fe4cfd3d64c68199c14e36d1b5907c4c7a71e9a18"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
