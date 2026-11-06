class Wizkido < Formula
  desc "WizFamily Studio CLI: write, check and upload lesson packs"
  homepage "https://wizfamili.vercel.app/docs"
  url "https://registry.npmjs.org/wizkido/-/wizkido-0.6.1.tgz"
  sha256 "89427cf3624f9b5883e3707e6444aa66b900d40369083d35554600f94f063808"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizkido --version").strip
  end
end
