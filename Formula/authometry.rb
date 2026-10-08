class Authometry < Formula
  desc "Configuration-as-code CLI for Authometry"
  homepage "https://github.com/jiayangc1/authometry"
  url "https://registry.npmjs.org/authometry/-/authometry-0.2.0.tgz"
  sha256 "12ee5e6bfaf16f62b2d21beb1a92b68a51dff466043568afa39829179e8c3a9d"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    bin.install "dist/index.js" => "authometry"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/authometry --version").strip
    system bin/"authometry", "init", "--directory", testpath/"config"
    assert_path_exists testpath/"config"/"authometry.yaml"
  end
end
