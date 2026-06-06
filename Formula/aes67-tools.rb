class Aes67Tools < Formula
  desc "AES67-oriented RTP audio streamer and player"
  homepage "https://github.com/wiccy46/aes67-tools"
  version "0.1.0"
  url "https://github.com/wiccy46/aes67-tools/releases/download/v#{version}/aes67-tools-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "a1f87ab1059c0b3ba7cda69554c9f5b84b38e94402d791d1b407aa8e47b7f9b5"
  license "GPL-3.0-only"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "bin/aes67-streamer"
    bin.install "bin/aes67-player"
    doc.install "README.md"
    doc.install "LICENSE"
    pkgshare.install "examples"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aes67-streamer --version")
    assert_match version.to_s, shell_output("#{bin}/aes67-player --version")
  end
end
