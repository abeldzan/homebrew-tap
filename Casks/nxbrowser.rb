cask "nxbrowser" do
  version "0.1.4"
  sha256 "a5ad0d9b3fe76692401547fa49363e4a5210a6e47f1a7b4a957bd5c138b37f26"

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
