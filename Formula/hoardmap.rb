class Hoardmap < Formula
  desc "See where your disk space went, in the browser; it only looks, never deletes"
  homepage "https://abhishekkundu25.github.io/hoardmap/"
  url "https://github.com/abhishekkundu25/hoardmap/releases/download/v0.3.3/hoardmap-macos.tar.gz"
  version "0.3.3"
  sha256 "1a3cccee5c856b4eeefde58c0721f4ad68c02aa98eac68b565776b4a8f749999"
  license "MIT"

  depends_on :macos

  def install
    bin.install "hoardmap"
  end

  test do
    assert_match "Usage: hoardmap", shell_output("#{bin}/hoardmap --help")
  end
end
