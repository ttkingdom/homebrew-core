class BazelDiff < Formula
  desc "Performs Bazel Target Diffing between two revisions in Git"
  homepage "https://github.com/Tinder/bazel-diff/"
  url "https://github.com/Tinder/bazel-diff/releases/download/7.2.19/bazel-diff_deploy.jar"
  sha256 "e189d3274d2d3b4fdbacd687f126e814de8c9361b1e18b13ccd9c3ec71158f4a"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8c8c01d6ff190c8e083f0f4ac30abd6fc44c5e775e28b6f18cba91377eaac8ed"
  end

  depends_on "bazel" => :test
  depends_on "openjdk"

  def install
    libexec.install "bazel-diff_deploy.jar"
    bin.write_jar_script libexec/"bazel-diff_deploy.jar", "bazel-diff"
  end

  test do
    output = shell_output("#{bin}/bazel-diff generate-hashes --workspacePath=#{testpath} 2>&1", 1)
    assert_match "ERROR: The 'info' command is only supported from within a workspace", output
  end
end
