cask "nxbrowser" do
  version "0.1.9"
  sha256 "aac710ef6d106605aeafc3db0ff2fb608bc7de6a91f89c52783ccbb57b9b468f"

  url "https://github.com/abeldzan/nx-browser/releases/download/v#{version}/NxBrowser.dmg"
  name "NxBrowser"
  desc "Keyboard-first web browser with tiling, extensions and a built-in terminal"
  homepage "https://github.com/abeldzan/nx-browser"

  # The app updates itself from GitHub releases; `brew upgrade` leaves it alone unless run with --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NxBrowser.app"

  # Not notarized (no Apple Developer ID): clear the quarantine flag so Gatekeeper opens the ad-hoc signed app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/NxBrowser.app"],
        writable_paths: ["NxBrowser.app"],
        writable_base:  :appdir
  end
end
