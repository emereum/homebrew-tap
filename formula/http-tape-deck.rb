# frozen_string_literal: true

class HttpTapeDeck < Formula
  desc "HTTP traffic record and replay tool"
  homepage "https://github.com/emereum/http-tape-deck"
  url "https://github.com/emereum/http-tape-deck/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "36a56e5fe749703daee777a1ae56416cb3972d23a7677814dc4f65b67ec42d13"
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
