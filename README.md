# homebrew-tap

Homebrew tap for [ivanrvpereira](https://github.com/ivanrvpereira)'s tools.

## Usage

```sh
brew tap ivanrvpereira/tap
brew install --cask fixit
```

Upgrade with `brew upgrade --cask fixit`.

## Casks

| Cask | Description |
|------|-------------|
| [`fixit`](Casks/fixit.rb) | [Fixit](https://github.com/ivanrvpereira/fixit) — fix typos and polish phrasing in any macOS app with one hotkey, using any model on OpenRouter |

## About the Fixit postflight

Fixit release binaries are ad-hoc signed. On install, the cask re-signs the app
with a stable self-signed identity created on your machine (`Fixit Local Code
Signing`), so the Accessibility permission macOS asks for survives upgrades
instead of resetting on every update. Creating that identity pops a keychain
password prompt on first install only. See
[BUILDING.md](https://github.com/ivanrvpereira/fixit/blob/main/BUILDING.md) for
details.

## License

[MIT](LICENSE)
