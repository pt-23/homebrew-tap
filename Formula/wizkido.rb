class Wizkido < Formula
  desc "WiseKido Studio CLI: write, check and upload lesson packs"
  homepage "https://wizkido.vercel.app/studio/tokens"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.4.0.tgz"
  sha256 "d68ddf36a839cc6a43a6c6a0e864987e5c880108532b126e708c1fb240a7a01d"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
