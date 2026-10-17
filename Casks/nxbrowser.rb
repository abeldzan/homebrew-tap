cask "nxbrowser" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/abeldzan/nx-browser/releases/download/v#{version}/NxBrowser.dmg"
  name "NxBrowser"
  desc "Keyboard-first web browser with tiling, extensions and a built-in terminal"
  homepage "https://github.com/abeldzan/nx-browser"

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
