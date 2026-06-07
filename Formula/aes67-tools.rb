class Aes67Tools < Formula
  desc "AES67-oriented RTP audio streamer and player"
  homepage "https://github.com/wiccy46/aes67-tools"
  version "0.1.2"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/wiccy46/aes67-tools/releases/download/v#{version}/aes67-tools-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "be82fc2a28b7fa70cca4cfeee0cc84e6a878d0ed5a921c848cf1d1335b783c6a"
  end

  on_linux do
    url "https://github.com/wiccy46/aes67-tools/releases/download/v#{version}/aes67-tools-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3b389eb129a2fe58c8be781f4e98e870559ec151ec097de24391ae7ee95d8b2"
  end

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
