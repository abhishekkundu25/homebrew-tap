class Hoardmap < Formula
  desc "See where your disk space went, in the browser; it only looks, never deletes"
  homepage "https://abhishekkundu25.github.io/hoardmap/"
  url "https://github.com/abhishekkundu25/hoardmap/releases/download/v0.3.2/hoardmap-macos.tar.gz"
  version "0.3.2"
  sha256 "3db410faed9bdda948c20fc68a42fdaebd5c55885ce49b121ff49bc61d97be89"
  license "MIT"

  depends_on :macos

  def install
    bin.install "hoardmap"
  end

  test do
    assert_match "Usage: hoardmap", shell_output("#{bin}/hoardmap --help")
  end
end
