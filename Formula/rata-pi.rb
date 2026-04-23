# Homebrew formula for rata-pi.
#
# V4.e · after a `v1.0.0` tag push fires `.github/workflows/release.yml`
# and a draft release is published, fill the three SHA256 placeholders
# below with the values from the release's SHA256SUMS.txt:
#
#   shasum -a 256 rata-pi-aarch64-apple-darwin.tar.gz
#   shasum -a 256 rata-pi-x86_64-apple-darwin.tar.gz
#   shasum -a 256 rata-pi-x86_64-unknown-linux-gnu.tar.gz
#
# Then either:
#   (a) copy this file into a `homebrew-rata-pi` tap repo so users can
#       `brew install TheSamLePirate/rata-pi/rata-pi`, or
#   (b) `brew install --formula Formula/rata-pi.rb` from a local checkout.
#
# Future version bumps: update `version`, `url`, and `sha256` for each
# platform; keep the structure.

class RataPi < Formula
  desc "Terminal UI for the Pi coding agent (@mariozechner/pi-coding-agent)"
  homepage "https://github.com/TheSamLePirate/rata-pi"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TheSamLePirate/rata-pi/releases/download/v#{version}/rata-pi-aarch64-apple-darwin.tar.gz"
      sha256 "b65a5563b8b52c9129e807ba90582658aa819a4532ce6a24840c3e81f6b0c4b9"
    end
    on_intel do
      url "https://github.com/TheSamLePirate/rata-pi/releases/download/v#{version}/rata-pi-x86_64-apple-darwin.tar.gz"
      sha256 "392f30f131a4f930e5e0dfcea2c0cd28acce175ba131f6e37e982f91844f9648"
    end
  end

  on_linux do
    # 64-bit x86 only at 1.0.0. aarch64-linux is a follow-up (needs
    # cross-compilation or a separate Linux ARM runner in CI).
    url "https://github.com/TheSamLePirate/rata-pi/releases/download/v#{version}/rata-pi-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "691dd098ccf3bab790460c17537295fd0565dea2ef501e482a8d40865276250f"
  end

  # rata-pi spawns `pi` from $PATH. The npm package @mariozechner/pi-coding-agent
  # isn't installable via Homebrew, but we can hint at it in the caveats so users
  # don't get stuck at the offline-mode fallback.
  def caveats
    <<~EOS
      Tau talks to the `pi` coding agent over stdio. Install it via npm:

        npm install -g @mariozechner/pi-coding-agent

      Without `pi` on $PATH, Tau starts in offline mode — you can still
      inspect the chrome, theme cycle, and settings. Any RPC-backed toggle
      flashes "offline — applies next session".
    EOS
  end

  def install
    bin.install "tau"
  end

  test do
    # --help prints to stderr with a non-zero exit on some clap configs;
    # just assert the binary runs and mentions itself.
    output = shell_output("#{bin}/tau --help 2>&1", 2)
    assert_match "tau", output
  end
end
