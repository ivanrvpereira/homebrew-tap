cask "fixit" do
  version "0.1.0"
  sha256 "a4d8346ffc5a4d9d665930957fb88e20dbe7b6c9287332534204dc3d19841f6e"

  url "https://github.com/ivanrvpereira/fixit/releases/download/v#{version}/Fixit-#{version}.zip"
  name "Fixit"
  desc "Fix typos and polish phrasing in any app with one hotkey"
  homepage "https://github.com/ivanrvpereira/fixit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Fixit.app"

  # The release binary is ad-hoc signed. Re-sign it with a stable local
  # self-signed identity so the Accessibility (TCC) grant survives upgrades,
  # and strip quarantine so Gatekeeper accepts the re-signed app.
  # Creating the identity pops a keychain password prompt on first install.
  postflight do
    system_command "/bin/bash",
                   args: ["#{staged_path}/create-signing-cert.sh"]
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Fixit.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--sign", "Fixit Local Code Signing", "#{appdir}/Fixit.app"]
  end

  zap trash: "~/.config/fixit"
end
