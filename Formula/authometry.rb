class Authometry < Formula
  desc "Configuration-as-code CLI for Authometry"
  homepage "https://github.com/jiayangc1/authometry"
  url "https://registry.npmjs.org/authometry/-/authometry-0.1.2.tgz"
  sha256 "a0e6f1faf72ab852035421b9f3b6b7cb3185f18e31e0d4fc56e3910aee3f9010"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    bin.install "dist/index.js" => "authometry"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/authometry --version").strip
    system bin/"authometry", "init", "--directory", testpath/"config"
    assert_path_exists testpath/"config"/"instance.yaml"
  end
end
