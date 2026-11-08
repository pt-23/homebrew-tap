class Wizfamily < Formula
  desc "WizFamily Studio CLI: write, check and upload lesson packs"
  homepage "https://wizfamili.vercel.app/docs"
  url "https://registry.npmjs.org/wizfamily/-/wizfamily-0.8.0.tgz"
  sha256 "c93da988b53447e4a3393014f6fe997712c25a647f4d050aaf03ba97a5ac2be0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizfamily --version").strip
  end
end
