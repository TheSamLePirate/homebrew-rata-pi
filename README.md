# homebrew-rata-pi

Homebrew tap for [rata-pi](https://github.com/TheSamLePirate/rata-pi) — a
terminal UI for the [Pi coding agent](https://github.com/mariozechner/pi-coding-agent).

## Install

```bash
brew install TheSamLePirate/rata-pi/rata-pi
```

Or equivalently, tap first and install by name:

```bash
brew tap TheSamLePirate/rata-pi
brew install rata-pi
```

## Upgrade

```bash
brew update
brew upgrade rata-pi
```

## Uninstall

```bash
brew uninstall rata-pi
brew untap TheSamLePirate/rata-pi
```

## Formula

[`Formula/rata-pi.rb`](Formula/rata-pi.rb) — builds pinned to the
GitHub Release artifacts of the matching `rata-pi` version.

## Bumping the version

For each new `rata-pi` release:

1. Wait for the `v*` tag push to trigger
   [`.github/workflows/release.yml`](https://github.com/TheSamLePirate/rata-pi/blob/main/.github/workflows/release.yml)
   and publish a GitHub Release with the three tarballs + `SHA256SUMS.txt`.
2. Update `version` in `Formula/rata-pi.rb`.
3. Replace the three `sha256` values with the hashes from `SHA256SUMS.txt`:
   - `rata-pi-aarch64-apple-darwin.tar.gz`
   - `rata-pi-x86_64-apple-darwin.tar.gz`
   - `rata-pi-x86_64-unknown-linux-gnu.tar.gz`
4. Commit + push.

## License

MIT — matching upstream rata-pi.
