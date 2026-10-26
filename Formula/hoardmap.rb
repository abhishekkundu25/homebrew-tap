class Hoardmap < Formula
  desc "See where your disk space went, in the browser; it only looks, never deletes"
  homepage "https://abhishekkundu25.github.io/hoardmap/"
  url "https://github.com/abhishekkundu25/hoardmap/releases/download/v0.3.1/hoardmap-macos.tar.gz"
  version "0.3.1"
  sha256 "eb2463a8f7cbc899ad9f9b764ca9b11819c364633c9480c449628a8a3a0b19c0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "hoardmap"
  end

  test do
    assert_match "Usage: hoardmap", shell_output("#{bin}/hoardmap --help")
  end
end
