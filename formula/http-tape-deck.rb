# frozen_string_literal: true

class HttpTapeDeck < Formula
  desc "HTTP traffic record and replay tool"
  homepage "https://github.com/emereum/http-tape-deck"
  url "https://github.com/emereum/http-tape-deck/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "98027176525eda8ee6bb659003d2581bd901cf300c3f2a8738d921cf6b431d1c"
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
