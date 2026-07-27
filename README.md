# santi-ug/homebrew-tap

Homebrew casks for my macOS utilities.

## Usage

Installing by full name taps this repository automatically:

```bash
brew install --cask santi-ug/tap/<name>
```

## Available

| Cask | Description |
|---|---|
| [`void`](https://github.com/santi-ug/void) | Blanks the display and locks the keyboard for screen cleaning |

## Adding a cask

Casks live in `Casks/`. Version and checksum must match the published release
artifact exactly or installation fails on the checksum — `scripts/release.sh` in
each project rewrites both from the DMG it just built.

## Copyright

© 2026 Santiago Uribe. All rights reserved.
