cask "hoardmap" do
  version "0.3.1"
  sha256 "21a64f2925e0733f40ac8ae8ab12cc5bb671e2eef51b822ba6a7289bd9de1785"

  url "https://github.com/abhishekkundu25/hoardmap/releases/download/v#{version}/Hoardmap.zip"
  name "Hoardmap"
  desc "See where your Mac's disk space went; it only looks, never deletes"
  homepage "https://abhishekkundu25.github.io/hoardmap/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Hoardmap.app"

  # Clear the "downloaded from the internet" flag so the app opens straight away.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Hoardmap.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.hoardmap.app",
    "~/Library/HTTPStorages/dev.hoardmap.app",
    "~/Library/Logs/Hoardmap",
    "~/Library/WebKit/dev.hoardmap.app",
  ]
end
