class Openwith < Formula
  desc "Manage macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"
  url "https://github.com/ColeMei/openwith/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6ee460a2a4fecf467b11b88a2be80b1b954bb3ecb3240e72d0cd367810d3c010"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openwith --version")
  end
end
