class Openwith < Formula
  desc "Manage macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"
  url "https://github.com/ColeMei/openwith/archive/refs/tags/v0.6.5.tar.gz"
  sha256 "13312aaa659fd515093dc36a9eef7f44a17e575f086283f506bb7969ea3c33c2"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    # The repo root is a virtual cargo workspace; the CLI package lives in
    # crates/openwith-cli.
    system "cargo", "install", *std_cargo_args(path: "crates/openwith-cli")

    generate_completions_from_executable(bin/"openwith", "completions")
    (man1/"openwith.1").write Utils.safe_popen_read(bin/"openwith", "mangen")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openwith --version")
  end
end
