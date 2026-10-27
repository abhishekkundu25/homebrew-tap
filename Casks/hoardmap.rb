cask "hoardmap" do
  version "0.4.0"
  sha256 "c9d0d54f731aa50e210dee82e4f49af6e10a2a658dbf3edf59014588f8fa5ca6"

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
  binary "#{appdir}/Hoardmap.app/Contents/MacOS/hoardmap"

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
