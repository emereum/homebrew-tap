class HttpTapeDeck < Formula
  desc "HTTP traffic record and replay tool"
  homepage "https://github.com/emereum/http-tape-deck"
  url "https://github.com/emereum/http-tape-deck/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "65b770b2b8152e18a5a278f2d9b96ed8ff177d4121ecc899c02846d2afb48666"
  head "https://github.com/emereum/http-tape-deck.git"
  depends_on "mitmproxy"

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]
    # Then write executables under #{bin}/
    bin.install_symlink "#{libexec}/http-tape-deck.sh" => "http-tape-deck"
  end

  test do
    assert_match "Usage: http-tape-deck (play|record) tape-name", shell_output("#{bin}/http-tape-deck", 1)
  end
end