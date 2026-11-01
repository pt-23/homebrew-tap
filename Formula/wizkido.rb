class Wizkido < Formula
  desc "WiseKido Studio CLI: write, check and upload lesson packs"
  homepage "https://wisekido.vercel.app/docs"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.5.1.tgz"
  sha256 "9575a4a3751e878a0f182dd6ef45d9d12badcdd80f1edce0df80af459738d338"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
