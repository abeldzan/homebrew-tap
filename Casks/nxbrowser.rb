cask "nxbrowser" do
  version "0.1.8"
  sha256 "1130d941d327e785224b4fce1689b5a813f34a148824a19c75d4bd65fd974b77"

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
