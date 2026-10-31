class Wizkido < Formula
  desc "WiseKido Studio CLI: write, check and upload lesson packs"
  homepage "https://wizkido.vercel.app/studio/tokens"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.5.0.tgz"
  sha256 "2d7b745c655d80a4c16105817eb9d37e1467c5d6f397cfadd97260918ce9dbbf"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
