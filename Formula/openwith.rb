class Openwith < Formula
  desc "Manage macOS file extension associations"
  homepage "https://github.com/ColeMei/openwith"
  url "https://github.com/ColeMei/openwith/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "85d78a675af0b5a2252027314582ee4cfa3f827aa429798b21e89b8dca99104e"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    # The repo root is a virtual cargo workspace; the CLI package lives in
    # crates/openwith-cli.
    system "cargo", "install", *std_cargo_args, "--path", "crates/openwith-cli"

    generate_completions_from_executable(bin/"openwith", "completions")
    (man1/"openwith.1").write Utils.safe_popen_read(bin/"openwith", "mangen")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openwith --version")
  end
end
