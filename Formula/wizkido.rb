class Wizkido < Formula
  desc "WizKidz Studio CLI: write, check and upload lesson packs"
  homepage "https://wizkido.vercel.app/studio/tokens"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.2.0.tgz"
  sha256 "e132b6d1f1906949d247d9596f4b851d825b0a609eb729ec8b2fffec07dcf675"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
