class Wizfamily < Formula
  desc "WizFamily Studio CLI: write, check and upload lesson packs"
  homepage "https://wizfamili.vercel.app/docs"
  url "https://registry.npmjs.org/wizfamily/-/wizfamily-0.9.0.tgz"
  sha256 "0f6f3a57dcc0947becd456a30bcbb83e5c9525932e96ba175a9c31916884742f"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wizfamily --version").strip
  end
end
