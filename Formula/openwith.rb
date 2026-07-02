class Openwith < Formula
  desc "Manage macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"
  url "https://github.com/ColeMei/openwith/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "5db6021453e43018aa02a32434cf7db4a7756fbb1cf2f802a8c82b985205c02a"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"openwith", "completions")
    (man1/"openwith.1").write Utils.safe_popen_read(bin/"openwith", "mangen")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openwith --version")
  end
end
