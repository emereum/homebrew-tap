# frozen_string_literal: true

class HttpTapeDeck < Formula
  desc "HTTP traffic record and replay tool"
  homepage "https://github.com/emereum/http-tape-deck"
  url "https://github.com/emereum/http-tape-deck/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "900bd82be46b76391f0b8e487a2adc90a7d8284e466291498dab2c1c74db3aed"
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
