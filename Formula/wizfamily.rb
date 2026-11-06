class Wizfamily < Formula
  desc "WizFamily Studio CLI: write, check and upload lesson packs"
  homepage "https://wizfamili.vercel.app/docs"
  url "https://registry.npmjs.org/wizfamily/-/wizfamily-0.7.0.tgz"
  sha256 "a45eeb61b54b82d5215c57857540954f200f48ebe14d01a1f8003cc058e74d12"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizfamily --version").strip
  end
end
