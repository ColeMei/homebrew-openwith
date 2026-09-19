class Openwith < Formula
  desc "Manage macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"
  url "https://github.com/ColeMei/openwith/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "83bfc6081e1116919a0b19c4b9b0b1d3b8f797bd07c0b34f6b09f33a10080dcb"
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
