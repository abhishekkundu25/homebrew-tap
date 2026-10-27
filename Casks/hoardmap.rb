cask "hoardmap" do
  version "0.3.3"
  sha256 "e30d7e9fd2b9d4d14c5ffd43e91ef2d27bf4db7fc847a8856f23b4e95b7700f5"

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
